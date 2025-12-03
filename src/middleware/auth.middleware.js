import jwt from 'jsonwebtoken';

const SECRET_KEY = process.env.SECRET_KEY;

export const authenticate = (req, res, next) => {
  const authHeader = req.headers.authorization;
  const tokenFromHeader = authHeader && authHeader.split(' ')[1];
  const tokenFromCookie = req.cookies?.token;

  const token = tokenFromHeader || tokenFromCookie;

  if (!token) {
    return res.status(401).json({ 
      success: false,
      message: 'Silakan login terlebih dahulu untuk mengakses aplikasi' 
    });
  }

  try {
    const decoded = jwt.verify(token, SECRET_KEY);
    req.user = decoded;
    next();
  } catch (err) {
    return res.status(401).json({ 
      success: false,
      message: 'Session expired. Silakan login kembali' 
    });
  }
};