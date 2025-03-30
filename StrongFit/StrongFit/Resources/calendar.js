document.addEventListener("DOMContentLoaded", function () {
    generateCalendar();
});

// Generate the calendar dynamically
function generateCalendar() {
    const calendarContainer = document.getElementById("calendarSection");
    const currentDate = new Date();
    const month = currentDate.getMonth(); // current month (0-11)
    const year = currentDate.getFullYear(); // current year

    const firstDayOfMonth = new Date(year, month, 1); // First day of the month
    const lastDayOfMonth = new Date(year, month + 1, 0); // Last day of the month
    const numberOfDays = lastDayOfMonth.getDate(); // Number of days in the month

    const calendarTable = document.createElement("table");
    calendarTable.classList.add("calendar-table");

    // Table header with day names
    const headerRow = document.createElement("tr");
    const daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    daysOfWeek.forEach(day => {
        const th = document.createElement("th");
        th.textContent = day;
        headerRow.appendChild(th);
    });
    calendarTable.appendChild(headerRow);

    // Table body with the days of the month
    let row = document.createElement("tr");
    let currentDay = 1;

    // Fill empty spaces before the first day of the month
    for (let i = 0; i < firstDayOfMonth.getDay(); i++) {
        const td = document.createElement("td");
        row.appendChild(td);
    }

    // Add the days of the month
    for (let i = firstDayOfMonth.getDay(); currentDay <= numberOfDays; i++) {
        if (i === 7) {
            // Start a new row after Saturday
            calendarTable.appendChild(row);
            row = document.createElement("tr");
            i = 0;
        }

        const td = document.createElement("td");
        td.textContent = currentDay;
        td.classList.add("calendar-day");
        td.dataset.date = `${year}-${month + 1}-${currentDay}`;

        row.appendChild(td);
        currentDay++;
    }

    // Add the last row if necessary
    if (row.childElementCount > 0) {
        calendarTable.appendChild(row);
    }

    // Append the generated calendar table to the container
    calendarContainer.innerHTML = ""; // Clear any existing content
    calendarContainer.appendChild(calendarTable);
}

// Highlight the days that have workouts (from the server-side data)
function highlightEntrenamientos(entrenamientosDates) {
    if (Array.isArray(entrenamientosDates)) {
        const allCalendarDays = document.querySelectorAll(".calendar-day");

        allCalendarDays.forEach(function (dayElement) {
            const dayDate = dayElement.dataset.date;

            if (entrenamientosDates.includes(dayDate)) {
                dayElement.classList.add("highlighted");
            }
        });
    }
}
