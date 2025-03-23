<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Diseño Básico</title>
    <!-- Load CSS -->
    <link rel="stylesheet" href="Resources/userPage.css" />
</head>
<body>
<div class="btnContainer">
    <button onclick="loadRutina()">Rutina</button>
    <button onclick="loadDieta()">Dieta</button>
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
</div>

<!-- Shared Buttons for Hoy / Mañana -->
<div class="dayButtons">
    <button onclick="setDay('hoy')">Hoy</button>
    <button onclick="setDay('manana')">Mañana</button>
</div>


    <!-- Load JavaScript -->
    <script src="Resources/userPageJs.js" defer></script>
</body>
</html>
