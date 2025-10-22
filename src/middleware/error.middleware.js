import logger from '../utils/logger.js';

export function errorHandler(err, req, res, next) {
  logger.error(`🔥 Error: ${err.message}`, {
    path: req.originalUrl,
    method: req.method,
    query: req.query,
    body: req.body,
    stack: err.stack,
  });

  res.status(err.status || 500).json({
    status: 'error',
    message: err.message || 'Internal Server Error',
    path: req.originalUrl,
    method: req.method,
    timestamp: new Date().toISOString(),
  });
}