import express from 'express'
import cors from 'cors'
import apiRoutes from './api/indexs.js'
import cookieParser from 'cookie-parser'
import { errorHandler } from './middleware/error.middleware.js'

const app = express()

app.use(express.json())

// CORS yang lebih flexible untuk development
app.use(cors({
  origin: true, // Izinkan semua origin untuk development
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'Cookie']
}));

app.use(cookieParser())

// Logging middleware untuk debugging
app.use((req, res, next) => {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.path}`);
  console.log('Headers:', req.headers);
  console.log('Body:', req.body);
  next();
})

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