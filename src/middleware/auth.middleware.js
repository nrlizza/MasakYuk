import jwt from 'jsonwebtoken';

const SECRET_KEY = process.env.SECRET_KEY;

// Middleware untuk verifikasi JWT
export const authenticate = (req, res, next) => {
  const authHeader = req.headers.authorization;
  const tokenFromHeader = authHeader && authHeader.split(' ')[1];
  const tokenFromCookie = req.cookies?.token;

  const token = tokenFromHeader || tokenFromCookie;

  if (!token) {
    return res.status(401).json({ message: 'Token tidak ditemukan' });
  }

  try {
    const decoded = jwt.verify(token, SECRET_KEY);
    req.user = decoded; // simpan data user ke request
    next();
  } catch (err) {
    return res.status(403).json({ message: 'Token tidak valid atau expired' });
  }
};

// Middleware untuk cek role (misal: admin)
export const authorize = (...allowedRoles) => {
  return (req, res, next) => {
    const userRole = req.user?.role;

    if (!allowedRoles.includes(userRole)) {
      return res.status(403).json({ message: 'Akses ditolak (role tidak diizinkan)' });
    }

    next();
  };
};
