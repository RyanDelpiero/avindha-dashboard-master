require('dotenv').config();
const express = require('express');
const cors = require('cors');
const db = require('./db');

const app = express();

app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));

// --- REST API ENDPOINTS ---

// 1. GET: Ambil seluruh data berdasarkan modul
app.get('/api/testcases/:module', async (req, res) => {
    try {
        // Menggunakan $1 dan destructuring { rows } khas package pg
        const { rows } = await db.query(
            `SELECT * FROM test_cases WHERE module = $1 ORDER BY id DESC`,
            [req.params.module]
        );

        const formatted = rows.map(item => ({
            id: item.id,
            module: item.module,
            date: item.date ? (typeof item.date === 'string' ? item.date : item.date.toISOString().split('T')[0]) : '',
            result: item.result,
            severity: item.severity,
            serviceProvider: item.service_provider,
            callerProvider: item.service_provider,
            phone: item.phone,
            layanan: item.layanan,
            tier: item.tier,
            menuCategory: item.menu_category,
            capability: item.capability,
            step: item.step,
            detail: item.detail,
            desc: item.description,
            propose: item.propose,
            evidence: item.evidence_data ? {
                type: item.evidence_type,
                name: item.evidence_name,
                data: item.evidence_data
            } : null
        }));

        res.json(formatted);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// 2. POST: Tambah Record Test Case Baru
app.post('/api/testcases', async (req, res) => {
    try {
        const body = req.body;
        const evidence = body.evidence || {};

        // Ubah ? menjadi $1, $2, ... $17 dan tambahkan RETURNING id
        const sql = `
            INSERT INTO test_cases 
            (module, date, result, severity, service_provider, phone, layanan, tier, menu_category, capability, step, detail, description, propose, evidence_type, evidence_name, evidence_data)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17)
            RETURNING id;
        `;

        const values = [
            body.module,
            body.date || new Date().toISOString().split('T')[0],
            body.result || 'Passed',
            body.severity || 'Minor',
            body.serviceProvider || '',
            body.phone || '',
            body.layanan || '',
            body.tier || '',
            body.menuCategory || '',
            body.capability || '',
            body.step || '',
            body.detail || '',
            body.desc || '',
            body.propose || '',
            evidence.type || null,
            evidence.name || null,
            evidence.data || null
        ];

        const { rows } = await db.query(sql, values);
        res.status(201).json({ message: 'Data berhasil disimpan!', insertId: rows[0].id });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// 3. PUT: Update Record Test Case Existing
app.put('/api/testcases/:id', async (req, res) => {
    try {
        const body = req.body;
        const evidence = body.evidence || {};

        const sql = `
            UPDATE test_cases SET
            date = $1, result = $2, severity = $3, service_provider = $4, phone = $5, 
            layanan = $6, tier = $7, menu_category = $8, capability = $9, step = $10, 
            detail = $11, description = $12, propose = $13, evidence_type = $14, evidence_name = $15, evidence_data = $16
            WHERE id = $17
        `;

        const values = [
            body.date,
            body.result,
            body.severity,
            body.serviceProvider || '',
            body.phone || '',
            body.layanan || '',
            body.tier || '',
            body.menuCategory || '',
            body.capability || '',
            body.step || '',
            body.detail || '',
            body.desc || '',
            body.propose || '',
            evidence.type || null,
            evidence.name || null,
            evidence.data || null,
            req.params.id
        ];

        await db.query(sql, values);
        res.json({ message: 'Data berhasil diperbarui!' });
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});

// 4. DELETE: Hapus Seluruh Data Modul
app.delete('/api/testcases/module/:module', async (req, res) => {
    try {
        await db.query(`DELETE FROM test_cases WHERE module = $1`, [req.params.module]);
        res.json({ message: `Seluruh data modul ${req.params.module} berhasil dihapus!` });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Khusus untuk deployment Vercel (Export handler express)
module.exports = app;

const PORT = process.env.PORT || 5000;
if (process.env.NODE_ENV !== 'production') {
    app.listen(PORT, () => console.log(`🚀 AVINDHA SQL API Server berjalan di http://localhost:${PORT}`));
}
