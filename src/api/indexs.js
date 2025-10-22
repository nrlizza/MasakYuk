import express from 'express'

const router = express.Router() 

import masakYukRoutes from './masakYuk/masakYuk.routes.js'
import authRoutes from './auth/auth.routes.js'
import * as middleware from '../middleware/auth.middleware.js'

router.use('/auth', authRoutes)
router.use(middleware.authenticate)
router.use('/masakYuk', masakYukRoutes) 

export default router
