function displayCalendar(year, monthIndex) {
    const firstDay = new Date(year, monthIndex, 1);
    const lastDay = new Date(year, monthIndex + 1, 0);
    const totalDays = lastDay.getDate() - firstDay.getDate() + 1;
    console.log('firstDate ', firstDay);
    console.log('lastDay ', lastDay);
    console.log('totalDays', totalDays);
    const startOffset = firstDay.getDay() - 1;
    const endOffset = 7 - lastDay.getDay();

    const calendarDays = Array.from({ length: totalDays }, (_, i) => ({
        date: new Date(year, monthIndex, i + 1),
        isEnabled: true,
        monthIndexPosition: 0,
    }));

    const calendarDaysPrevious = Array.from({ length: startOffset }, (_, i) => ({
        date: new Date(year, monthIndex, -i),
        isEnabled: true,
        monthIndexPosition: -1,
    }));

    const calendarDaysNext = Array.from({ length: endOffset }, (_, i) => ({
        date: new Date(year, monthIndex + 1, i + 1),
        isEnabled: true,
        monthIndexPosition: 1,
    }));

    return [...calendarDaysPrevious.reverse(), ...calendarDays, ...calendarDaysNext];
}

// Assuming you're calling this function to display the calendar
function generateCalendar(year, monthIndex) {
    const calendarDiv = document.querySelector('.userpage__calendar');
    const calendarArray = displayCalendar(year, monthIndex);

    // Clear the previous calendar content
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
        td.classList.add(dayObj.isEnabled ? '' : 'disabled');
        row.appendChild(td);
    });

    calendarDiv.appendChild(table);
}

// Call this when you want to generate the calendar for a specific month
generateCalendar(2025, 3); // Example: Generate calendar for March 2025
