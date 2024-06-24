document.addEventListener('DOMContentLoaded', async () => {
    const searchInput = document.getElementById('searchInput');
    const resultsDiv = document.getElementById('results');

    let data;
    
    try {
        // Obtener datos iniciales de proveedores
        data = await window.api.obtenerProveedores();
    } catch (error) {
        console.error('Error al obtener datos iniciales:', error);
        
        return;
    }

    // Agregar event listener al input de búsqueda
    searchInput.addEventListener('input', async () => {
        const userInput = searchInput.value;
        
        let resultados;

        if (data.includes(userInput)) {
            // Buscar marcas por proveedor
            resultados = await window.api.buscarMarcasPorProveedor(userInput);
        } else {
            // Buscar proveedor principal
            resultados = await window.api.buscarProveedorPrincipal(userInput);
        }

        // Mostrar resultados en la interfaz
        resultsDiv.innerText = resultados.length > 0 ? resultados.join('\n') : 'No se encontraron resultados';
    });
});