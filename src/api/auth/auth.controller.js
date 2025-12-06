import { S_login, S_register, S_googleAuth, S_generateToken } from './auth.services.js';
import { S_generateTokenDirect } from './auth.services.js';
import { loginSchema, registerSchema } from './auth.validation.js';
import jwt from 'jsonwebtoken';

const REFRESH_SECRET = process.env.REFRESH_SECRET;
const SECRET_KEY = process.env.SECRET_KEY;

// ✅ CONTROLLER: Login
export async function C_login(req, res, next) {
  try {
    const validation = loginSchema.safeParse(req.body);
    if (!validation.success) {
      const errorMessage = validation.error?.errors?.[0]?.message || 'Validation error';
      return res.status(400).json({
        success: false,
        message: errorMessage,
        errors: validation.error?.errors
      });
    }

    const { email, password } = validation.data;
    const accessToken = await S_login(email, password);
    const decoded = jwt.decode(accessToken);
    
    const refreshToken = jwt.sign(
      {
        sub: decoded.sub,
        name: decoded.name,
        role: decoded.role,
        id_user: decoded.id_user
      },
      REFRESH_SECRET,
      { expiresIn: '8h' }
    );
    
    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 8 * 60 * 60 * 1000,
    });

    res.cookie('token', accessToken, {
      httpOnly: false,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 1000,
    });

    res.json({
      success: true,
      message: 'Login successful',
      token: accessToken,
      user: {
        id_user: decoded.id_user,
        name: decoded.name,
        email: decoded.sub
      }
    });
  } catch (err) {
    next(err);
  }
}

// ✅ CONTROLLER: Register
export async function C_register(req, res, next) {
  try {
    const validation = registerSchema.safeParse(req.body);
    if (!validation.success) {
      const errorMessage = validation.error?.errors?.[0]?.message || 'Validation error';
      return res.status(400).json({
        success: false,
        message: errorMessage,
        errors: validation.error?.errors
      });
    }

    const result = await S_register(validation.data);
    res.status(201).json({
      success: true,
      message: 'Registration successful',
      data: result
    });
  } catch (err) {
    next(err);
  }
}

// ✅ CONTROLLER: Refresh Token
export async function C_refreshToken(req, res, next) {
  try {
    const refreshToken = req.cookies.refreshToken;
    
    if (!refreshToken) {
      return res.status(401).json({
        success: false,
        message: 'Refresh token not found'
      });
    }

    const decoded = jwt.verify(refreshToken, REFRESH_SECRET);
    
    const newAccessToken = jwt.sign(
      {
        sub: decoded.sub,
        name: decoded.name,
        role: decoded.role,
        id_user: decoded.id_user
      },
      SECRET_KEY,
      { expiresIn: '1h' }
    );

    res.cookie('token', newAccessToken, {
      httpOnly: false,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 1000,
    });

    res.json({
      success: true,
      message: 'Token refreshed',
      token: newAccessToken
    });
  } catch (err) {
    next(err);
  }
}

// ✅ CONTROLLER: Logout
export async function C_logout(req, res, next) {
  try {
    res.clearCookie('token');
    res.clearCookie('refreshToken');
    
    res.json({
      success: true,
      message: 'Logout successful'
    });
  } catch (err) {
    next(err);
  }
}

// ✅ CONTROLLER: Generate Token No Login
export async function C_generateTokenNoLogin(req, res, next) {
  try {
    const { email, name, role = 'user', id_user } = req.body;
    
    if (!email) {
      return res.status(400).json({
        success: false,
        message: 'Email is required'
      });
    }

    const payload = {
      sub: email,
      name: name || email,
      role: role,
      id_user: id_user
    };

    const token = S_generateTokenDirect(payload);
    
    res.json({
      success: true,
      message: 'Token generated',
      token
    });
  } catch (err) {
    next(err);
  }
}

// ✅ CONTROLLER: Google Login
export async function C_googleLogin(req, res, next) {
  const { token } = req.body;

  if (!token) {
    return res.status(400).json({
      success: false,
      message: 'Google token diperlukan'
    });
  }

  try {
    const accessToken = await S_googleAuth(token);
    const decoded = jwt.decode(accessToken);

    const refreshToken = jwt.sign(
      {
        sub: decoded.sub,
        name: decoded.name,
        role: decoded.role,
        id_user: decoded.id_user
      },
      REFRESH_SECRET,
      { expiresIn: '8h' } 
    );

    // Set cookies
    res.cookie('refreshToken', refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production', 
      sameSite: 'lax',
      maxAge: 8 * 60 * 60 * 1000,
    });

    res.cookie('token', accessToken, {
      httpOnly: false, 
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 1000,
    });

    res.json({ 
      success: true,
      message: 'Google login successful',
      token: accessToken,
      user: {
        id_user: decoded.id_user,
        name: decoded.name,
        email: decoded.sub
      }
    });
    
  } catch (err) {
    next(err);
  }
}