const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');
const { buscarProveedorPrincipal, buscarMarcasPorProveedor, obtenerDatosIniciales } = require('./db');
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

    win.loadFile('index.html');
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
    return await buscarProveedorPrincipal(marca);
});

ipcMain.handle('buscar-marcas-por-proveedor', async (event, proveedor) => {
    return await buscarMarcasPorProveedor(proveedor);
});

ipcMain.handle('obtener-datos-iniciales', async () => {
    return await obtenerDatosIniciales()
});