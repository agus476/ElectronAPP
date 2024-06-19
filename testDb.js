const client = require('./db');

async function testConnection() {
    try {
        const res = await client.query('SELECT NOW()');
        console.log('Resultado de la consulta:', res.rows[0]);
        client.end();
    } catch (err) {
        console.error('Error ejecutando la consulta', err.stack);
    }
}
testConnection();