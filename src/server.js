import app from './app.js';

const port = process.env.PORT || 3000;
const host = process.env.HOST || 'localhost'; // Tambahkan host

app.listen(port, host, () => {
    console.log(`Server running at http://${host}:${port}`);
});