const { ipcRenderer, require } = window.electron;
const xlsx = require('xlsx');
const path = require('path');



const excelFilePath = path.join(__dirname, './MARCA X PROVEEDOR.xlsx');


function procesarDatos(data) {
    const proveedores = data[0].slice(1); // Obtener los nombres de los proveedores
    const marcas = [];

    for (let i = 1; i < data.length; i++) {
        const marca = { Marca: data[i][0], Proveedores: {} };

        for (let j = 1; j < data[i].length; j++) {
            marca.Proveedores[proveedores[j - 1]] = data[i][j];
        }

        marcas.push(marca);
    }

    return marcas;
}

function buscarProveedorPrincipal(marca) {
    const workbook = XLSX.readFile(excelFilePath);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(sheet, { header: 1 });

    const marcasProcesadas = procesarDatos(data);

    const marcaEncontrada = marcasProcesadas.find(m => m.Marca === marca);
    if (!marcaEncontrada) {
        return "Marca no encontrada"; // Marca no encontrada
    }

    const proveedorPrincipal = Object.entries(marcaEncontrada.Proveedores).find(([_, tipo]) => tipo === 'P');
    if (!proveedorPrincipal) {
        return "Proveedor principal no encontrado"; // Proveedor principal no encontrado
    }
    
    const proveedoresSecundarios = Object.entries(marcaEncontrada.Proveedores)
  .filter(([_, tipo]) => tipo === 'S')
  .map(([proveedor, _]) => proveedor);
  

    if(!proveedoresSecundarios){
        return `Lo puedes comprar en: ${proveedorPrincipal[0]}`;
    }

    else{
        return `Principalmente se compra en ${proveedorPrincipal[0]}, pero tambien lo podes comprar en ${proveedoresSecundarios} `
    }
   

    
}

function buscarMarcasPorProveedor(proveedor) {
    const workbook = XLSX.readFile(excelFilePath);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const data = XLSX.utils.sheet_to_json(sheet, { header: 1 });

    const proveedorIndex = data[0].indexOf(proveedor);
    if (proveedorIndex === -1) {
        return console.log(`No se encontro proveedor`); // Proveedor no encontrado
    }

    const marcas = [];
    for (let i = 1; i < data.length; i++) {
        if (data[i][proveedorIndex] === 'P' || data[i][proveedorIndex] === 'S') {
            marcas.push(data[i][0]);
        }
    }

    return console.log(`Las marcas asociadas al proveedor ${proveedor} son: ${marcas}`);;
}

// Ejemplo de uso
const proveedor = 'ALFA RODAMIENTOS SRL';
buscarMarcasPorProveedor(proveedor);

function search() {
    // Obtener el valor del input
    userInput = document.getElementById('searchInput').value;

    console.log('Input:', userInput);
    buscarMarcasPorProveedor(userInput);
    
}