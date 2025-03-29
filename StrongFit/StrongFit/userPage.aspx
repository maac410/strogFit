<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userPage.aspx.cs" Inherits="StrongFit.WebForm4" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Diseño Básico</title>
    <!-- Load CSS -->
    <link rel="stylesheet" href="Resources/userPage.css" />
    <style>
        /* Estilos para el menú lateral */
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.3s;
            padding-top: 60px;
        }

        .sidebar button {
            display: block;
            width: 100%;
            padding: 10px;
            color: white;
            background: none;
            border: none;
            text-align: left;
            cursor: pointer;
            font-size: 18px;
        }

        .sidebar button:hover {
            background-color: #575757;
        }

        /* Botón de menú hamburguesa */
        .menu-btn {
            font-size: 30px;
            cursor: pointer;
            position: fixed;
            top: 10px;
            left: 10px;
            background: none;
            border: none;
            color: white;
        }

        /* Contenido */
        .content {
            margin-left: 60px;
            padding: 20px;
        }

        /* Secciones ocultas */
        .rutina, .dieta {
            display: none;
            padding: 15px;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            margin-top: 10px;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
        }
    </style>
</head>
<body>

<!-- Botón de menú hamburguesa -->
<button class="menu-btn" onclick="toggleMenu()">☰</button>

<!-- Menú lateral -->
<div id="sidebar" class="sidebar">
    <button onclick="toggleSection('rutina')">Rutina</button>
    <button onclick="toggleSection('dieta')">Dieta</button>
    <button onclick="window.location.href='homePage.aspx'">Ir a Inicio</button>
</div>

<div class="content">
    <div id="rutina" class="rutina">
        <h3>Rutina de Entrenamiento</h3>
        <p>Aquí irá la información sobre la rutina de entrenamiento.</p>
    </div>

    <div id="dieta" class="dieta">
        <h3>Dieta</h3>
        <p>Aquí irá la información sobre la dieta.</p>
    </div>
        
    <div class="userpage__calendar">
        <!-- Calendar will be injected here -->
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
        let sections = document.querySelectorAll('.rutina, .dieta');
        sections.forEach(section => {
            section.style.display = section.id === sectionId ? (section.style.display === 'none' ? 'block' : 'none') : 'none';
        });
    }
</script>

</body>
</html>
