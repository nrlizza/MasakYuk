import { z } from 'zod';

export const loginSchema = z.object({
  username: z.string().min(1, "Username harus diisi"),
  password: z.string().min(1, "Password harus diisi")
});

export const registerSchema = z.object({
  fullname: z.string().min(1, "Fullname harus diisi"),
  username: z.string().min(1, "Username harus diisi"),
  password: z.string().min(1, "Password harus diisi"),
  role: z.string().min(1, "role harus diisi")
});