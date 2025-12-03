import express from 'express'
import cors from 'cors'
import apiRoutes from './api/indexs.js'
import cookieParser from 'cookie-parser'
import { errorHandler } from './middleware/error.middleware.js'

const app = express()

app.use(express.json())

// Sederhanakan CORS untuk testing
app.use(cors({
  origin: 'http://localhost:3000',
  credentials: true
}));

app.use(cookieParser())

// Test route basic
app.get('/', (req, res) => {
    res.status(200).json({ 
        message: 'Server berhasil dijalankan',
        timestamp: new Date().toISOString()
    });
});

// Health check route
app.get('/health', (req, res) => {
    res.status(200).json({ 
        status: 'OK',
        database: 'Checking...',
        timestamp: new Date().toISOString()
    });
});

app.use('/api', apiRoutes)
app.use(errorHandler)

export default app