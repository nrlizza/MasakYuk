import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const db = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: parseInt(process.env.DB_PORT),
  // Tambahkan timeout dan retry config
  connectionTimeoutMillis: 10000,
  idleTimeoutMillis: 30000,
  max: 10, // Maximum number of clients in pool
  allowExitOnIdle: false,
});

// Test connection
db.on('connect', () => {
  console.log('✅ Database connected successfully');
});

db.on('error', (err) => {
  console.error('❌ Database connection error:', err);
});

// Test connection saat startup
db.query('SELECT NOW()', (err) => {
  if (err) {
    console.error('❌ Database test query failed:', err);
  } else {
    console.log('✅ Database test query successful');
  }
});

export default db;