let currentSection = ''; // Variable to track the current section

function loadRutina() {
    toggleVisibility(".rutina");
    currentSection = 'rutina'; // Track that the current section is 'rutina'
}

function loadDieta() {
    toggleVisibility(".dieta");
    currentSection = 'dieta'; // Track that the current section is 'dieta'
}

function loadCalendar() {
    toggleVisibility(".userpage__calendar"); // Show the calendar section
    currentSection = 'calendar'; // Track that the current section is 'calendar'
}

function toggleVisibility(selector) {
    // Hide all elements inside .bxContainer
    document.querySelectorAll(".bxContainer > div").forEach(div => {
        div.classList.remove("show");
    });

    // Show only the selected element
    const targetElement = document.querySelector(selector);
    if (targetElement) {
        targetElement.classList.add("show");
    } else {
        console.error("Element not found:", selector);
    }
}

function setDay(day) {
    // Check the current active section and update it accordingly
    if (currentSection === 'rutina') {
        document.querySelector('.rutina p').innerText = `Información sobre la rutina de entrenamiento para ${day}.`;
    } else if (currentSection === 'dieta') {
        document.querySelector('.dieta p').innerText = `Información sobre la dieta para ${day}.`;
    }
}
