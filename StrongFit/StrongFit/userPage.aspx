<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rutina de Entrenamiento</title>
    <!-- Load CSS -->
    <link rel="stylesheet" href="Resources/userPage.css" />
      <link rel="stylesheet" href="Resources/calendar.css" />
        <script src="Resources/userPage.js"></script> <!-- Include your calendar.js script -->
            <script src="Resources/calendar.js"></script> <!-- Include your calendar.js script -->
</head>
<body>

    <!-- Botón de menú hamburguesa -->
    <button class="menu-btn" onclick="toggleMenu()">☰</button>

    <!-- Menú lateral -->
    <div id="sidebar" class="sidebar">
        <button onclick="loadRutina()">Rutina</button>
<button onclick="loadDieta()">Dieta</button>
        <button onclick="loadCalendar()">Calendario</button> <!-- New Calendar Button -->
        <button onclick="window.location.href='homePage.aspx'">Ir a Inicio</button>
    </div>

    <!-- Contenido -->
    <div class="content">
        <div id="rutina" class="rutina">
            <h3>Rutina de Entrenamiento</h3>
            <ul id="exerciseList">
                <!-- This Literal will dynamically display exercise list -->
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


</body>
</html>