require('dotenv').config();
const express = require('express');
const cors = require('cors');
const db = require('./db');

const app = express();

// Middleware: Mengatur batas payload 50MB agar sanggup menerima Base64 evidence gambar/video
app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: '50mb', extended: true }));

// --- REST API ENDPOINTS ---

// 1. GET: Ambil seluruh data berdasarkan modul ('ivr', 'grapari-indihome', 'grapari-mobile')
app.get('/api/testcases/:module', async (req, res) => {
    try {
        const [rows] = await db.query(
            `SELECT * FROM test_cases WHERE module = ? ORDER BY id DESC`,
            [req.params.module]
        );

        const formatted = rows.map(item => ({
            id: item.id,
            module: item.module,
            date: item.date ? item.date.toISOString().split('T')[0] : '',
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

        const sql = `
            INSERT INTO test_cases 
            (module, date, result, severity, service_provider, phone, layanan, tier, menu_category, capability, step, detail, description, propose, evidence_type, evidence_name, evidence_data)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
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

        const [result] = await db.query(sql, values);
        res.status(201).json({ message: 'Data berhasil disimpan!', insertId: result.insertId });
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
            date = ?, result = ?, severity = ?, service_provider = ?, phone = ?, 
            layanan = ?, tier = ?, menu_category = ?, capability = ?, step = ?, 
            detail = ?, description = ?, propose = ?, evidence_type = ?, evidence_name = ?, evidence_data = ?
            WHERE id = ?
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

// 4. DELETE: Hapus Seluruh Data Modul (Clear All)
app.delete('/api/testcases/module/:module', async (req, res) => {
    try {
        await db.query(`DELETE FROM test_cases WHERE module = ?`, [req.params.module]);
        res.json({ message: `Seluruh data modul ${req.params.module} berhasil dihapus!` });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`🚀 AVINDHA SQL API Server berjalan di http://localhost:${PORT}`));