import express from "express";
const router = express.Router();

import {
  C_getAllKategori,
  C_getAllResep,
  C_getResepById,
  C_getResepByKategori,
  C_getResepDisimpanByUser,
  C_simpanResep,
  C_hapusSimpanResep,
} from "./masakyuk.controller.js";

router.get("/kategori", C_getAllKategori); // Ambil semua kategori
router.get("/resep", C_getAllResep); // Semua resep (dengan pagination)
router.get("/resep/:id_resep", C_getResepById); // Detail resep berdasarkan id
router.get("/resep/kategori/:id_kategori", C_getResepByKategori); // Filter resep berdasarkan kategori
router.get("/simpan/:id_user", C_getResepDisimpanByUser); // Lihat semua resep yang disimpan user
router.post("/simpan", C_simpanResep); // Simpan resep
router.delete("/simpan/:id_simpan", C_hapusSimpanResep); // Hapus simpanan resep

export default router;
