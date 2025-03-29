<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Diseño Básico</title>
    <!-- Load CSS -->
    <link rel="stylesheet" href="Resources/userPage.css" />
        <link rel="stylesheet" href="Resources/userPage.css" />
    <!-- Include Vue.js CDN (optional, based on your setup) -->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
</head>
<body>
<div class="btnContainer">
    <button onclick="loadRutina()">Rutina</button>
    <button onclick="loadDieta()">Dieta</button>
     <button onclick="loadCalendar()">Calendario</button> <!-- New Calendar Button -->
</div>

<div class="bxContainer">
    <!-- Rutina Content -->
    <div class="rutina">
        <h3>Rutina de Entrenamiento</h3>
        <p>Aquí irá la información sobre la rutina de entrenamiento.</p>
    </div>

    <!-- Dieta Content -->
    <div class="dieta">
        <h3>Dieta</h3>
        <p>Aquí irá la información sobre la dieta.</p>
    </div>
        
    <div class="userpage__calendar">
        <!-- Calendar will be injected here -->
    </div>

<!-- Shared Buttons for Hoy / Mañana -->
<div class="dayButtons">
    <button onclick="setDay('hoy')">Hoy</button>
    <button onclick="setDay('manana')">Mañana</button>
</div>

<!-- Load JavaScript -->
<script src="Resources/userPage.js" defer></script>
<!-- Move calendar.js script here -->
<script src="Resources/calendar.js"></script>

</body>
</html>
