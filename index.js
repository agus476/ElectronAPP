const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const db = require('./database/db');

function createWindow() {
    const win = new BrowserWindow({
        width: 800,
        height: 600,
        webPreferences: {
            preload: path.join(__dirname, 'preload.js'),
            contextIsolation: true,
            enableRemoteModule: false
        }
    });

    win.loadFile('ui/index.html');
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
        createWindow();
    }
});

ipcMain.handle('buscar-proveedor-principal', async (event, marca) => {
    console.log('buscarProveedorPrincipal called with:', marca);
    const result = await db.buscarProveedorPrincipal(marca);
    console.log('Result:', result);
    return result;
});

ipcMain.handle('buscar-marcas-por-proveedor', async (event, proveedor) => {
    console.log('buscarMarcasPorProveedor called with:', proveedor);
    const result = await db.buscarMarcasPorProveedor(proveedor);
    console.log('Result:', result);
    return result;
});

ipcMain.handle('obtener-proveedores', async (event) => {
    console.log('obtenerproveedores called');
    const result = await db.obtenerProveedores();
    console.log('Result:', result);
    return result;
});