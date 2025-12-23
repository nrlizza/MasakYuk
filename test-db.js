import pkg from 'pg';
const { Client } = pkg;
import dotenv from 'dotenv';

dotenv.config();

const testConnection = async () => {
  const client = new Client({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: 'postgres', // Try connecting to default database first
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
    connectionTimeoutMillis: 5000,
  });

  try {
    console.log('Attempting to connect with:');
    console.log(`- Host: ${process.env.DB_HOST}`);
    console.log(`- Port: ${process.env.DB_PORT}`);
    console.log(`- User: ${process.env.DB_USER}`);
    console.log(`- Database: postgres (default)`);
    
    await client.connect();
    console.log('✅ Connection successful!');
    
    // List databases
    const res = await client.query('SELECT datname FROM pg_database WHERE datistemplate = false;');
    console.log('\nAvailable databases:');
    res.rows.forEach(row => console.log(`  - ${row.datname}`));
    
    await client.end();
  } catch (err) {
    console.error('❌ Connection failed:', err.message);
    console.error('\nPossible solutions:');
    console.error('1. Make sure PostgreSQL is running');
    console.error('2. Check if password is correct');
    console.error('3. Verify host and port settings');
    console.error('4. Check if user has permission to connect');
  }
};

testConnection();
