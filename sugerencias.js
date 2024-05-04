const XLSX = require('xlsx');
const path = require('path');

const excelFilePath = path.join(__dirname, './MARCA X PROVEEDOR.xlsx');
const workbook = XLSX.readFile(excelFilePath);
const sheetName = workbook.SheetNames[0];
const sheet = workbook.Sheets[sheetName];
const data = XLSX.utils.sheet_to_json(sheet, { header: 1 });

// Obtener todas las palabras del Excel
const palabrasExcel = new Set();
data.forEach((fila) => {
    fila.forEach((celda) => {
        if (typeof celda === 'string') {
            const palabras = celda.split(' ');
            palabras.forEach((palabra) => {
                palabrasExcel.add(palabra.toLowerCase());
            });
        }
    });
});



function calcularSimilitud(palabra1, palabra2) {
    const matriz = [];
    for (let i = 0; i <= palabra1.length; i++) {
        matriz[i] = [i];
    }
    for (let j = 0; j <= palabra2.length; j++) {
        matriz[0][j] = j;
    }

    for (let i = 1; i <= palabra1.length; i++) {
        for (let j = 1; j <= palabra2.length; j++) {
            const sustitucionCosto = palabra1[i - 1] === palabra2[j - 1] ? 0 : 1;
            matriz[i][j] = Math.min(
                matriz[i - 1][j] + 1,
                matriz[i][j - 1] + 1,
                matriz[i - 1][j - 1] + sustitucionCosto
            );
        }
    }

    return 1 - matriz[palabra1.length][palabra2.length] / Math.max(palabra1.length, palabra2.length);
}

function esSimilar(palabra, palabrasExcel, umbral) {
    const sugerencias = [];
    palabrasExcel.forEach((palabraExcel) => {
        const similitud = calcularSimilitud(palabra.toLowerCase(), palabraExcel.toLowerCase());
        if (similitud >= umbral) {
            sugerencias.push(palabraExcel);
        }
    });
    return sugerencias;
}

const palabra = 'rodami';
const umbral = 0.5; // Umbral de similitud
const sugerencias = esSimilar(palabra, palabrasExcel, umbral);
console.log(`Sugerencias para "${palabra}": ${sugerencias.join(', ')}`);