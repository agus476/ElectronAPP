const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('api', {
    buscarProveedorPrincipal: (marca) => ipcRenderer.invoke('buscar-proveedor-principal', marca),
    buscarMarcasPorProveedor: (proveedor) => ipcRenderer.invoke('buscar-marcas-por-proveedor', proveedor),
    obtenerDatosIniciales: () => ipcRenderer.invoke('obtener-datos-iniciales')
});