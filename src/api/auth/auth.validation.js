import { z } from 'zod';

export const loginSchema = z.object({
  email: z.string().email("Format email tidak valid").min(1, "Email harus diisi"),
  password: z.string().min(1, "Password harus diisi")
});

export const registerSchema = z.object({
  nama_lengkap: z.string().min(1, "Nama lengkap harus diisi"),
  email: z.string().email("Format email tidak valid").min(1, "Email harus diisi"),
  password: z.string().min(6, "Password minimal 6 karakter"),
  confirmPassword: z.string().min(1, "Konfirmasi password harus diisi").optional(),
  confirm_password: z.string().min(1, "Konfirmasi password harus diisi").optional()
}).refine((data) => {
  const confirmPwd = data.confirmPassword || data.confirm_password;
  return data.password === confirmPwd;
}, {
  message: "Password dan konfirmasi password tidak sama",
  path: ["confirmPassword"]
});