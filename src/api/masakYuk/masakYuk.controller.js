import { 
  S_getAllKategori, 
  S_getAllResep, 
  S_getResepById,
  S_getResepByKategori, 
  S_getResepDisimpanByUser, 
  S_simpanResep, 
  S_hapusSimpanResep 
} from "../masakYuk/masakYuk.service.js";

// ===================== KATEGORI CONTROLLERS =====================
export async function C_getAllKategori(req, res) {
  try {
    const kategori = await S_getAllKategori();
    res.json({ success: true, data: kategori });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

// ===================== RESEP CONTROLLERS =====================

// Get all resep with pagination
export async function C_getAllResep(req, res) {
  try {
    const limit = parseInt(req.query.limit) || 10;
    const offset = parseInt(req.query.offset) || 0;
    const resep = await S_getAllResep(limit, offset);
    res.json({ success: true, data: resep });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

// Get resep by id
export async function C_getResepById(req, res) {
  try {
    const { id_resep } = req.params;
    const resep = await S_getResepById(id_resep);
    if (!resep) {
      return res.status(404).json({ success: false, message: "Resep tidak ditemukan" });
    }
    res.json({ success: true, data: resep });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

// Get resep by kategori
export async function C_getResepByKategori(req, res) {
  try {
    const { id_kategori } = req.params;
    const resep = await S_getResepByKategori(id_kategori);
    res.json({ success: true, data: resep });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

// ===================== SIMPAN RESEP CONTROLLERS =====================

// Get resep disimpan by user
export async function C_getResepDisimpanByUser(req, res) {
  try {
    const { id_user } = req.params;
    const resep = await S_getResepDisimpanByUser(id_user);
    res.json({ success: true, data: resep });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

// Simpan resep
export async function C_simpanResep(req, res) {
  try {
    const { id_user, id_resep } = req.body;
    const saved = await S_simpanResep(id_user, id_resep);
    res.json({ success: true, message: "Resep berhasil disimpan", data: saved });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

// Hapus simpan resep
export async function C_hapusSimpanResep(req, res) {
  try {
    const { id_simpan } = req.params;
    const deleted = await S_hapusSimpanResep(id_simpan);
    res.json({ success: true, message: "Resep dihapus dari daftar simpan", data: deleted });
  } catch (error) {
    res.status(500).json({ success: false, message: error.message });
  }
}

