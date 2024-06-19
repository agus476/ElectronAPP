const { Client } = require('pg');

const client = new Client({
    user: 'test',
    host: 'localhost',
    database: 'MarkForge',
    password: 'test',
    port: 5432,
});

client.connect();

async function buscarProveedorPrincipal(marca) {
    try {
        const res = await client.query(`
            SELECT p.nombre_proveedor
            FROM proveedores p
            JOIN proveedormarca a ON p.proveedor_id = a.proveedor_id
            JOIN marcas m ON m.marca_id = a.marca_id
            WHERE m.nombre_marca = $1 AND (a.tipo_proveedor = 'P' OR a.tipo_proveedor = 'S') ;
        `, [marca]);
        return res.rows;
    } catch (err) {
        console.error(err);
        throw err;
    }
}

async function buscarMarcasPorProveedor(proveedor) {
    try {
        const res = await client.query(`
            SELECT m.nombre_marca
            FROM marcas m
            JOIN proveedormarca a ON m.marca_id = a.marca_id
            JOIN proveedores p ON p.proveedor_id = a.proveedor_id
            WHERE p.nombre_proveedor = $1;
        `, [proveedor]);
        return res.rows;
    } catch (err) {
        console.error(err);
        throw err;
    }
}
async function obtenerDatosIniciales() {
    const res = await client.query('SELECT DISTINCT nombre_proveedor FROM proveedores ORDER BY nombre_proveedor ASC');
    return res.rows.map(row => row.nombre_proveedor);
}

module.exports = {
    buscarProveedorPrincipal,
    buscarMarcasPorProveedor,
    obtenerDatosIniciales
};


module.exports = client;

