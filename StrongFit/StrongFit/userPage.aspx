<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rutina de Entrenamiento</title>
    <link rel="stylesheet" href="Resources/userPage.css" />
    <link rel="stylesheet" href="Resources/calendar.css" />
    <script src="Resources/userPage.js"></script>
    <script src="Resources/calendar.js"></script>
</head>
<body onload="mostrarBienvenida()">

    <button class="menu-btn" onclick="toggleMenu()">☰</button>

    <div id="sidebar" class="sidebar">
        <button onclick="loadRutina()">Rutina</button>
        <button onclick="loadDieta()">Dieta</button>
        <button onclick="loadCalendar()">Calendario</button>
        <button onclick="window.location.href='homePage.aspx'">Cerrar sesión</button>
    </div>

    <div class="content">
        <p class="welcome-message">¡Bienvenido! Esperamos que tengas un gran día. 💪🔥</p>

        <div id="rutina" class="rutina">
            <h3>Rutina de Entrenamiento</h3>
            <ul id="exerciseList">
                <asp:Literal ID="exerciseListLiteral" runat="server"></asp:Literal>
            </ul>
        </div>

        <div id="dieta" class="dieta">
            <h3>Dieta</h3>
            <ul id="dietaList">
                <asp:Literal ID="dietaListLiteral" runat="server"></asp:Literal>
            </ul>
        </div>

        <div id="calendarSection" class="userpage__calendar"></div>
    </div>

</body>
</html>
