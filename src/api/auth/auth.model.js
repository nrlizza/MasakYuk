import db from '../../config/db.config.js';
import bcrypt from 'bcrypt';

export async function M_login(email) {
  const query = `
    SELECT * FROM master_user 
    WHERE email = $1
  `;

  const values = [email];
  const { rows } = await db.query(query, values);
  
  return rows[0] || null;
}

export async function M_register(payload) {
  const { nama_lengkap, email, password } = payload;

  const hashedPassword = await bcrypt.hash(password, 10);
  
  const sql = `
      INSERT INTO master_user (nama_lengkap, email, password)
      VALUES ($1, $2, $3)
      RETURNING *;
  `;

  const result = await db.query(sql, [nama_lengkap, email, hashedPassword]);
  return result.rows[0];
}

// ✅ FUNCTION BARU: Register/Login dengan Google
export async function M_registerGoogle(payload) {
  const { nama_lengkap, email, google_id, avatar } = payload;
  
  // Generate random password untuk user Google (tidak akan digunakan)
  const randomPassword = await bcrypt.hash(Math.random().toString(36), 10);
  
  const sql = `
    INSERT INTO master_user (nama_lengkap, email, password, google_id, avatar, is_google_auth)
    VALUES ($1, $2, $3, $4, $5, true)
    RETURNING *;
  `;

  const result = await db.query(sql, [nama_lengkap, email, randomPassword, google_id, avatar]);
  return result.rows[0];
}

// ✅ FUNCTION BARU: Cek user by Google ID
export async function M_findByGoogleId(googleId) {
  const query = `
    SELECT * FROM master_user 
    WHERE google_id = $1
  `;

  const { rows } = await db.query(query, [googleId]);
  return rows[0] || null;
}

// ✅ FUNCTION BARU: Update user dengan Google ID
export async function M_updateGoogleId(userId, googleId) {
  const query = `
    UPDATE master_user 
    SET google_id = $1, is_google_auth = true
    WHERE id_user = $2
    RETURNING *;
  `;

  const { rows } = await db.query(query, [googleId, userId]);
  return rows[0] || null;
}