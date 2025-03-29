<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Rutina de Entrenamiento</title>
    <!-- Load CSS -->
    <link rel="stylesheet" href="Resources/userPage.css" />
</head>
<body>

    <!-- Botón de menú hamburguesa -->
    <button class="menu-btn" onclick="toggleMenu()">☰</button>

    <!-- Menú lateral -->
    <div id="sidebar" class="sidebar">
        <button onclick="toggleSection('rutina')">Rutina</button>
        <button onclick="toggleSection('dieta')">Dieta</button>
        <button onclick="loadCalendar()">Calendario</button> <!-- New Calendar Button -->
        <button onclick="window.location.href='homePage.aspx'">Ir a Inicio</button>
    </div>

    <!-- Contenido -->
    <div class="content">
        <div id="rutina" class="rutina">
            <h3>Rutina de Entrenamiento</h3>
            <!-- Literal control to dynamically display the exercises -->
            <ul id="exerciseList">
                <asp:Literal ID="exerciseListLiteral" runat="server"></asp:Literal>
            </ul>
        </div>

        <div id="dieta" class="dieta">
            <h3>Dieta</h3>
            <p>Aquí irá la información sobre la dieta.</p>
        </div>

        <div id="calendarSection" class="userpage__calendar">
            <!-- Calendar will be injected here -->
        </div>
    </div>

    <!-- JavaScript para el menú y las secciones -->
    <script>
        function toggleMenu() {
            let sidebar = document.getElementById("sidebar");
            if (sidebar.style.width === "250px") {
                sidebar.style.width = "0";
            } else {
                sidebar.style.width = "250px";
            }
        }

        function toggleSection(sectionId) {
            let sections = document.querySelectorAll('.rutina, .dieta, .userpage__calendar');
            sections.forEach(section => {
                section.style.display = section.id === sectionId ? 'block' : 'none';
            });
        }

        function loadCalendar() {
            toggleSection('calendarSection'); // Show calendar section when the Calendar button is clicked
        }
    </script>

    <script src="Resources/calendar.js"></script> <!-- Include your calendar.js script -->

</body>
</html>
