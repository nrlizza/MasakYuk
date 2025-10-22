import express from 'express'
import cors from 'cors'
import apiRoutes from './api/indexs.js'
import cookieParser from 'cookie-parser'
import { errorHandler } from './middleware/error.middleware.js'

const app = express()

app.use(express.json()) 

const allowedOrigins = [
    'http://localhost:3000',
]

app.use(cors({
  origin: (origin, callback) => {
    if (!origin) return callback(null, true); // untuk Postman, curl, dsb
    if (allowedOrigins.includes(origin)) {
      return callback(null, true);
    } else {
      return callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(cookieParser())

app.get('/', (req, res) => {
    res.status(200).json({message : 'server berhasil dijalankan'})
})

app.use('/api', apiRoutes)
app.use(errorHandler)

export default app

