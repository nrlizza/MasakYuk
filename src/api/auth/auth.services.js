import { M_login, M_register } from "./auth.model.js";
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';

const SECRET_KEY = process.env.SECRET_KEY;

export function S_generateToken(user) {
  const payload = {
    sub: user.username,
    name: user.fullname,
    role: user.role,
  };

  return jwt.sign(payload, SECRET_KEY, { expiresIn: '1h' });
}

export async function S_login(username, password) {
  const user = await M_login(username, password);

  if (!user) {
    throw new Error('Invalid credentials');
  }

  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) {
    throw new Error('Invalid credentials');
  } 

  const token = S_generateToken(user);
  return token;
}

export function S_generateTokenDirect(payload) {
  return jwt.sign(payload, SECRET_KEY, { expiresIn: '1h' });
}

export async function S_register(payload) {
  const data = await M_register(payload)

  return data;
}