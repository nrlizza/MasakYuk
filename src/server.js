import app from './app.js';

const port = process.env.PORT || 3000;
const host = process.env.HOST || '0.0.0.0'; // Ubah dari 'localhost' ke '0.0.0.0'

app.listen(port, host, () => {
    console.log(`Server running at http://${host}:${port}`);
});