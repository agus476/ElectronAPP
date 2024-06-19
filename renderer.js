let data = [];

document.addEventListener('DOMContentLoaded', async () => {
    // Obtener datos iniciales al cargar la página
    data = await window.api.obtenerDatosIniciales();
    console.log('Datos iniciales:', data);
});

async function search() {
    const userInput = document.getElementById('searchInput').value;

    let resultados;
    if (data.includes(userInput)) {
        resultados = await window.api.buscarMarcasPorProveedor(userInput);
    } else {
        resultados = await window.api.buscarProveedorPrincipal(userInput);
    }

    // Mostrar resultados en la interfaz
    document.getElementById('results').innerText = JSON.stringify(resultados, null, 2);
}

document.getElementById('searchButton').addEventListener('click', search);