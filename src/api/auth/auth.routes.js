import express from 'express';
import { 
  C_login, 
  C_logout, 
  C_generateTokenNoLogin, 
  C_refreshToken, 
  C_register,
  C_googleLogin // ✅ IMPORT BARU
} from './auth.controller.js';

const router = express.Router();

router.post('/login', C_login);
router.post('/refresh', C_refreshToken);
router.post('/logout', C_logout);
router.post('/generate-token-no-login', C_generateTokenNoLogin);
router.post('/register', C_register);
router.post('/google', C_googleLogin); // ✅ ROUTE BARU

export default router;