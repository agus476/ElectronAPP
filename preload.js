const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('electron', {
    ipcRenderer: ipcRenderer,
    require: (moduleName) => {
        try {
            return require(moduleName);
        } catch (e) {
            console.error(e);
        }
    }
});