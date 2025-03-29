function generateCalendar(year, monthIndex) {
    // Ensure the calendar div exists
    const calendarDiv = document.getElementById('calendarSection');

    if (!calendarDiv) {
        console.error("Calendar container (#calendarSection) not found.");
        return;
    }

    const firstDay = new Date(year, monthIndex, 1);
    const lastDay = new Date(year, monthIndex + 1, 0);
    const totalDays = lastDay.getDate();
    const startOffset = firstDay.getDay();
    const endOffset = 7 - lastDay.getDay();

    const calendarDays = Array.from({ length: totalDays }, (_, i) => ({
        date: new Date(year, monthIndex, i + 1),
        isEnabled: true,
    }));

    const calendarDaysPrevious = Array.from({ length: startOffset }, (_, i) => ({
        date: new Date(year, monthIndex, -i),
        isEnabled: false,
    }));

    const calendarDaysNext = Array.from({ length: endOffset }, (_, i) => ({
        date: new Date(year, monthIndex + 1, i + 1),
        isEnabled: false,
    }));

    const calendarArray = [
        ...calendarDaysPrevious.reverse(),
        ...calendarDays,
        ...calendarDaysNext,
    ];

    // Clear previous calendar content
    calendarDiv.innerHTML = '';

    const table = document.createElement('table');
    const headerRow = document.createElement('tr');
    ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'].forEach(day => {
        const th = document.createElement('th');
        th.innerText = day;
        headerRow.appendChild(th);
    });
    table.appendChild(headerRow);

    let row;
    calendarArray.forEach((dayObj, index) => {
        if (index % 7 === 0) {
            row = document.createElement('tr');
            table.appendChild(row);
        }

        const td = document.createElement('td');
        td.innerText = dayObj.date.getDate();
        // Only add the 'disabled' class if the day is not enabled
        if (!dayObj.isEnabled) {
            td.classList.add('disabled');
        }
        row.appendChild(td);
    });

    calendarDiv.appendChild(table); // Append the table to the calendar container
}

// Call the function to generate the calendar for a specific month and year
generateCalendar(2025, 3); // Example for April 2025
