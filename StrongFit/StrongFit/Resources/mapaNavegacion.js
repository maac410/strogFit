document.addEventListener("DOMContentLoaded", function () {
    function scrollToSection(sectionId) {
        setTimeout(function () {
            const targetSection = document.getElementById(sectionId);
            if (targetSection) {
                targetSection.scrollIntoView({ behavior: "smooth" });
            }
        }, 500); // Pequeño retraso para asegurar que la página cargó
    }

    // Detectar si la URL contiene un hash y hacer scroll automático al cargar la página
    if (window.location.hash) {
        scrollToSection(window.location.hash.substring(1)); // Elimina el "#" y usa el ID
    }

    // Función para manejar los clics en los botones de navegación
    function setupNavigationButton(selector, sectionId) {
        const button = document.querySelector(selector);
        if (button) {
            button.addEventListener("click", function (event) {
                event.preventDefault(); // Evita la navegación predeterminada

                if (window.location.pathname.includes("homePage.aspx")) {
                    scrollToSection(sectionId);
                } else {
                    window.location.href = `homePage.aspx#${sectionId}`;
                }
            });
        }
    }

    // Configurar el botón "Quiénes Somos" para ir a la sección 3
    setupNavigationButton('.menu-item[href="homePage.aspx#section-3"]', "section-3");

    // Configurar el botón "Información de la Aplicación" para ir a la sección 2
    setupNavigationButton('.menu-item[href="homePage.aspx#section-2"]', "section-2");
});
