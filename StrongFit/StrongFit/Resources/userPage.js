let currentSection = ''; // Variable to track the current section

// Load different sections and update the current section tracker
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

// Toggle visibility of the selected section
function toggleVisibility(selector) {
    // Hide all sections
    document.querySelectorAll(".rutina, .dieta, .userpage__calendar").forEach(div => {
        div.style.display = 'none';
    });

    // Show the selected section
    const targetElement = document.querySelector(selector);
    if (targetElement) {
        targetElement.style.display = 'block';
    } else {
        console.error("Element not found:", selector);
    }
}

// Function to update the section content based on the selected day
function setDay(day) {
    const currentSectionElement = document.querySelector(`.${currentSection} p`);
    if (currentSectionElement) {
        if (currentSection === 'rutina') {
            currentSectionElement.innerText = `Información sobre la rutina de entrenamiento para ${day}.`;
        } else if (currentSection === 'dieta') {
            currentSectionElement.innerText = `Información sobre la dieta para ${day}.`;
        }
    }
}

// Toggles the side menu visibility
function toggleMenu() {
    let sidebar = document.getElementById("sidebar");
    if (sidebar.style.width === "250px") {
        sidebar.style.width = "0";
    } else {
        sidebar.style.width = "250px";
    }
}

// Function to show the date picker when the "Añadir al calendario" button is clicked
function submitForm(exerciseId, selectedDate) {
    // Create a hidden form dynamically
    var form = document.createElement("form");
    form.method = "POST";
    form.action = window.location.href;

    // Create hidden input for exerciseId
    var exerciseInput = document.createElement("input");
    exerciseInput.type = "hidden";
    exerciseInput.name = "exerciseId";
    exerciseInput.value = exerciseId;

    // Create hidden input for selectedDate
    var dateInput = document.createElement("input");
    dateInput.type = "hidden";
    dateInput.name = "selectedDate";
    dateInput.value = selectedDate;

    // Append inputs to the form
    form.appendChild(exerciseInput);
    form.appendChild(dateInput);

    // Submit the form
    document.body.appendChild(form); // Append the form to the body
    form.submit(); // Submit the form
}

// Function to send the date and exercise ID to the backend (ASP.NET backend)
function sendDateToBackend(exerciseId, selectedDate) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "userPage.aspx/SaveExerciseToCalendar", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            alert("Ejercicio añadido al calendario para la fecha: " + selectedDate);
        }
    };

    // Send the exerciseId and the selected date to the server in JSON format
    var data = JSON.stringify({
        exerciseId: exerciseId,
        selectedDate: selectedDate
    });

    xhr.send(data);
}

// Function to handle form submission when the user selects a date for an exercise
function submitFormWithFetch(exerciseId, selectedDate) {
    // Using fetch to submit the form data via AJAX
    const formData = new FormData();
    formData.append('exerciseId', exerciseId);
    formData.append('selectedDate', selectedDate);

    fetch(window.location.href, {
        method: 'POST',
        body: formData
    }).then(response => {
        if (response.ok) {
            console.log("Exercise added to calendar successfully!");
        } else {
            console.error("Failed to add exercise to calendar.");
        }
    });
}

// Function to highlight the dates on the calendar based on fetched training dates
function highlightEntrenamiento(entrenamientosDates) {
    if (Array.isArray(entrenamientosDates)) {
        const allCalendarDays = document.querySelectorAll(".calendar-day");

        allCalendarDays.forEach(function (dayElement) {
            const dayDate = dayElement.dataset.date;

            // Check if the day is in the entrenamientosDates array
            if (entrenamientosDates.includes(dayDate)) {
                dayElement.classList.add("highlighted"); // Highlight the selected date
            }
        });
    }
}
