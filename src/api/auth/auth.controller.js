import { S_login, S_register } from './auth.services.js';
import { S_generateTokenDirect } from './auth.services.js';
import { loginSchema, registerSchema } from './auth.validation.js';
import jwt from 'jsonwebtoken';

const REFRESH_SECRET = process.env.REFRESH_SECRET;
const SECRET_KEY = process.env.SECRET_KEY;

export async function C_login(req, res, next) {
  const { username, password } = loginSchema.parse(req.body);

  try {
    const token = await S_login(username, password);
    const decoded = jwt.decode(token);

    const refreshToken = jwt.sign(
      {
        sub: decoded.sub,
        name: decoded.name,
        role: decoded.role,
      },
      REFRESH_SECRET,
      { expiresIn: '8h' } 
    );

    // Simpan refresh token sebagai httpOnly cookie
    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      secure: true, 
      sameSite: 'none',
      maxAge: 8 * 60 * 60 * 1000,
    });

    res.cookie('token', token, {
      httpOnly: false, 
      secure: true,
      sameSite: 'none',
      maxAge: 60 * 60 * 1000,
    });

    res.json({ message: 'Login successful' });
  } catch (err) {
    next(err);
  }
}

export async function C_refreshToken(req, res) {
  const refreshToken = req.cookies.refreshToken;

  if (!refreshToken) {
    return res.status(401).json({ message: 'Refresh token tidak ditemukan' });
  }

  try {
    const decoded = jwt.verify(refreshToken, REFRESH_SECRET);

    const accessToken = jwt.sign(
      {
        sub: decoded.sub,
        name: decoded.name,
        role: decoded.role,
      },
      SECRET_KEY,
      { expiresIn: '1h' } // atau sesuaikan
    );

    res.json({ accessToken });
  } catch (err) {
    res.status(403).json({ message: 'Refresh token tidak valid atau expired' });
  }
}

export function C_generateTokenNoLogin(req, res) {
  const payload = req.body.payload || {
    sub: 'testuser',
    name: 'Test User',
    role: 'bd',
  };

  const token = S_generateTokenDirect(payload);
  res.json({ token });
}

export function C_logout(req, res) {
  res.clearCookie('refreshToken', { httpOnly: true, secure: true, sameSite: 'none' });
  res.json({ message: 'Logout successful' });
}

export async function C_register(req, res, next) {
  try {
  const payload = registerSchema.safeParse(req.body)
  const data = await S_register(payload.data)
  res.json(data)
  }catch(error) {
    next(error)
  }
}