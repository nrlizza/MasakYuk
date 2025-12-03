import { M_login, M_register, M_registerGoogle, M_findByGoogleId, M_updateGoogleId } from "./auth.model.js";
import jwt from 'jsonwebtoken';
import bcrypt from 'bcrypt';
import { OAuth2Client } from 'google-auth-library';

const SECRET_KEY = process.env.SECRET_KEY;
const GOOGLE_CLIENT_ID = process.env.GOOGLE_CLIENT_ID;
const client = new OAuth2Client(GOOGLE_CLIENT_ID);

export function S_generateToken(user) {
  const payload = {
    sub: user.email,
    name: user.nama_lengkap,
    role: 'user',
    id_user: user.id_user
  };

  return jwt.sign(payload, SECRET_KEY, { expiresIn: '1h' });
}

export async function S_login(email, password) {
  const user = await M_login(email);

  if (!user) {
    throw new Error('Email tidak ditemukan');
  }

  const isPasswordValid = await bcrypt.compare(password, user.password);
  
  if (!isPasswordValid) {
    throw new Error('Password salah');
  }

  const token = S_generateToken(user);
  return token;
}

export function S_generateTokenDirect(payload) {
  return jwt.sign(payload, SECRET_KEY, { expiresIn: '1h' });
}

export async function S_register(payload) {
  const { nama_lengkap, email, password } = payload;
  
  const userData = {
    nama_lengkap,
    email,
    password
  };
  
  const data = await M_register(userData);
  return data;
}

// ✅ SERVICE BARU: Google Auth
export async function S_googleAuth(token) {
  try {
    // Verify token dengan Google
    const ticket = await client.verifyIdToken({
      idToken: token,
      audience: GOOGLE_CLIENT_ID,
    });

    const payload = ticket.getPayload();
    const { sub: googleId, email, name, picture } = payload;

    // Cek apakah user sudah ada dengan Google ID
    let user = await M_findByGoogleId(googleId);

    if (!user) {
      // Cek apakah email sudah terdaftar (merge account)
      user = await M_login(email);
      
      if (user) {
        // Update existing user dengan Google ID
        user = await M_updateGoogleId(user.id_user, googleId);
      } else {
        // Buat user baru
        user = await M_registerGoogle({
          nama_lengkap: name,
          email: email,
          google_id: googleId,
          avatar: picture
        });
      }
    }

    // Generate token untuk user
    const jwtToken = S_generateToken(user);
    return jwtToken;

  } catch (error) {
    console.error('Google auth error:', error);
    throw new Error('Google authentication failed');
  }
}