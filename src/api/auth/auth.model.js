import db from '../../config/db.config.js';
import bcrypt from 'bcrypt';

export async function M_login(username) {
  const query = `
    SELECT * FROM master_user 
    WHERE username = $1
  `;

  const values = [username];
  const { rows } = await db.query(query, values);
  
  return rows[0] || null;
}

export async function M_register(payload) {
  const { fullname, username, password, role } = payload;

    const hashedPassword = await bcrypt.hash(password, 10);
    const sql = `
        INSERT INTO master_user (username, password, fullname, role)
        VALUES ($1, $2, $3, $4)
        RETURNING *;
    `;

    const result = await db.query(sql, [ username, hashedPassword, fullname, role]);
    return result.rows[0];
}
