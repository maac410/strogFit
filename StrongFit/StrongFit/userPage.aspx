<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Rutina de Entrenamiento</title>
    <!-- Load CSS -->
    <link rel="stylesheet" href="Resources/userPage.css" />
</head>
<body onload="mostrarBienvenida()">

    <!-- Botón de menú hamburguesa -->
    <button class="menu-btn" onclick="toggleMenu()">☰</button>

    <!-- Menú lateral -->
    <div id="sidebar" class="sidebar">
        <button onclick="toggleSection('rutina')">Rutina</button>
        <button onclick="toggleSection('dieta')">Dieta</button>
        <button onclick="loadCalendar()">Calendario</button>
        <button onclick="window.location.href='homePage.aspx'">Cerrar Sesion</button>
    </div>

    <!-- Contenido -->
    <div class="content">
        <!-- Bienvenida al usuario -->
        <p class="welcome-message">¡Bienvenido! Esperamos que tengas un gran día. 💪🔥</p>



        <div id="rutina" class="rutina">
            <h3>Rutina de Entrenamiento</h3>
            <ul id="exerciseList">
                <asp:Literal ID="exerciseListLiteral" runat="server"></asp:Literal>
            </ul>
        </div>

        <div id="dieta" class="dieta">
            <h3>Dieta</h3>
            <p>Aquí irá la información sobre la dieta.</p>
        </div>

        <div id="calendarSection" class="userpage__calendar"></div>
    </div>

    <!-- JavaScript -->
    <script>
        function mostrarBienvenida() {
            const nombreUsuario = "Usuario"; // Aquí puedes personalizar el nombre si lo obtienes de sesión o BD
            const mensaje = `¡Bienvenido, ${nombreUsuario}! Prepárate para tu entrenamiento.`;
            document.getElementById("mensajeBienvenida").innerText = mensaje;
        }

        function toggleMenu() {
            let sidebar = document.getElementById("sidebar");
            sidebar.style.width = (sidebar.style.width === "250px") ? "0" : "250px";
        }

        function toggleSection(sectionId) {
            let sections = document.querySelectorAll('.rutina, .dieta, .userpage__calendar');
            sections.forEach(section => {
                section.style.display = section.id === sectionId ? 'block' : 'none';
            });
        }

        function loadCalendar() {
            toggleSection('calendarSection');
        }
    </script>

    <script src="Resources/calendar.js"></script>

</body>
</html>
