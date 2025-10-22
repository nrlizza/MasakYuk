import { 
  M_getAllKategori, 
  M_getAllResep, 
  M_getResepById, 
  M_getResepByKategori, 
  M_getResepDisimpanByUser, 
  M_simpanResep, 
  M_hapusSimpanResep
} from "./masakyuk.model.js";

// ------------------ Kategori Services ------------------
export async function S_getAllKategori() {
  const kategori = await M_getAllKategori();
  return kategori;
}

// ------------------ Resep Services ------------------
export async function S_getAllResep(limit = 10, offset = 0) {
  const resep = await M_getAllResep(limit, offset);
  return resep;
}

export async function S_getResepById(id_resep) {
  const resep = await M_getResepById(id_resep);
  return resep;
}

export async function S_getResepByKategori(id_kategori) {
  const resep = await M_getResepByKategori(id_kategori);
  return resep;
}

// ------------------ User Simpan Resep Services ------------------
export async function S_getResepDisimpanByUser(id_user) {
  const resep = await M_getResepDisimpanByUser(id_user);
  return resep;
}

export async function S_simpanResep(id_user, id_resep) {
  const saved = await M_simpanResep(id_user, id_resep);
  return saved;
}

export async function S_hapusSimpanResep(id_simpan) {
  const deleted = await M_hapusSimpanResep(id_simpan);
  return deleted;
}
