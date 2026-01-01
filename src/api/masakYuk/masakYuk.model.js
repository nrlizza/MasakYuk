import db from "../../config/db.config.js";

// ------------------ Master Kategori Table ------------------
export async function M_getAllKategori() {
  const sql = `SELECT * FROM master_kategori ORDER BY id_kategori ASC`;
  const res = await db.query(sql);
  return res.rows;
}

// ------------------ Data Resep Table ------------------
export async function M_getAllResep(limit = 10, offset = 0) {
  const dataQuery = `
    SELECT 
      a.id_resep,
      a.nama_resep,
      a.image,
      a.bahan_bahan,
      a.cara_membuat,
      a.sumber,
      b.nama_kategori
    FROM resep_data a
    INNER JOIN master_kategori b ON a.id_kategori = b.id_kategori
    ORDER BY a.id_resep DESC
    LIMIT $1 OFFSET $2
  `;
  const countQuery = `SELECT COUNT(*) AS total FROM resep_data`;
  const [dataRes, countRes] = await Promise.all([
    db.query(dataQuery, [limit, offset]),
    db.query(countQuery),
  ]);

  const total = parseInt(countRes.rows[0].total, 10);
  const page = Math.floor(offset / limit) + 1;
  const totalPages = Math.ceil(total / limit);

  return {
    data: dataRes.rows,
    pagination: { total, limit, offset, page, totalPages },
  };
}

export async function M_getResepById(id_resep) {
  const sql = `
    SELECT 
      a.id_resep,
      a.nama_resep,
      a.image,
      a.bahan_bahan,
      a.cara_membuat,
      a.sumber,
      b.nama_kategori
    FROM resep_data a
    INNER JOIN master_kategori b ON a.id_kategori = b.id_kategori
    WHERE a.id_resep = $1
  `;
  const res = await db.query(sql, [id_resep]);
  return res.rows[0]; // ambil satu resep saja
}

export async function M_getResepByKategori(id_kategori) {
  const sql = `
    SELECT 
      a.id_resep,
      a.nama_resep,
      a.image,
      a.bahan_bahan,
      a.cara_membuat,
      a.sumber,
      b.nama_kategori
    FROM resep_data a
    INNER JOIN master_kategori b ON a.id_kategori = b.id_kategori
    WHERE a.id_kategori = $1
  `;
  const res = await db.query(sql, [id_kategori]);
  return res.rows;
}

// ------------------ User Simpan Resep Table ------------------
export async function M_getResepDisimpanByUser(id_user) {
  const sql = `
    SELECT 
      a.id_simpan,
      b.id_resep,
      b.nama_resep,
      b.image,
      b.bahan_bahan,
      b.cara_membuat,
      b.sumber,
      c.nama_kategori
    FROM user_simpan_resep a
    INNER JOIN resep_data b ON a.id_resep = b.id_resep
    INNER JOIN master_kategori c ON b.id_kategori = c.id_kategori
    WHERE a.id_user = $1
  `;
  const res = await db.query(sql, [id_user]);
  return res.rows;
}

export async function M_simpanResep(id_user, id_resep) {
  const sql = `
    INSERT INTO user_simpan_resep (id_user, id_resep)
    VALUES ($1, $2)
    RETURNING *;
  `;
  const res = await db.query(sql, [id_user, id_resep]);
  return res.rows[0];
}

export async function M_hapusSimpanResep(id_simpan) {
  const sql = `DELETE FROM user_simpan_resep WHERE id_simpan = $1`;
  await db.query(sql, [id_simpan]);
  return { message: "Resep disimpan berhasil dihapus" };
}
