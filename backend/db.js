// db.js
const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false // Wajib untuk koneksi SSL Supabase di Vercel
    }
});

pool.connect()
    .then(client => {
        console.log('✅ Terhubung ke Database PostgreSQL Supabase');
        client.release();
    })
    .catch(err => {
        console.error('❌ Gagal terkoneksi ke Supabase:', err.message);
    });

module.exports = {
    // Wrapper query agar kompatibel dengan pemanggilan db.query()
    query: (text, params) => pool.query(text, params)
};
