﻿﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="StrongFit.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
<link rel="stylesheet" href="Resources/home.css" /> <!-- Your custom CSS should come after Bootstrap -->

    <script src="Resources\homePage.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet" />

    <title>StrongFit</title>
</head>
<body>
    <section class="section1">
    <!-- Navigation Bar -->
          <img class="logo" src="Resources\images\logo2.png" alt="Imagen 1"/>
    <div class="navBar">
      
        <button class="home" onclick="window.location.href='homePage.aspx'">Inicio</button>
       <button class="Informacion" onclick="toggleList()">Informacion</button>

    <!-- Hidden list of options -->
 
        <button class="acerca" onclick="scrollToSection3()">Acerca</button> <!-- Acerca Button -->
        <input class="search" type="text" placeholder="Buscar..." />
    </div>

           <ul id="optionsList" class="InformacionList">
       <li><button class="Informacion" onclick="window.location.href='mapaNavegacion.html'">Ir a Mapa Navegación</button></li>
   </ul>

    <!-- Title and Description -->
    <div class="contTitle">
        <p class="mainTitle">Strong Fit</p><hr class="Linea" />
        <p class="subTitle">Alcanza tus metas</p>
        <p class="text">Controla, optimiza tu alimentación y ejercicio con información precisa y herramientas tecnológicas avanzadas. Ideal para personas modernas y ocupadas que buscan mejorar su bienestar físico y mental. ¡Empieza a cuidar de ti mismo hoy!</p>
    </div>

<!-- Contenedor de imagen -->
<div class="imgContMain">
    <img id="mainImage" src="ruta/de/imagen.jpg" alt="Imagen principal" />
    <div class="border"></div>
</div>

    <!-- Button Container -->
    <div class="buttonCont">
        <button class="logInBtn" onclick="toggleLoginForm()">Iniciar Sesión</button>
        <button class="suscribe" onclick="window.location.href='suscriptionPage.aspx'"> Suscribirse </button>
    </div>

    <!-- Hidden Login Form -->
    <form id="form1" runat="server" class="logInCont">
        <table>
            <tr>
                <td><asp:Label ID="lblUsuario" runat="server" Text="Id Usuario"></asp:Label></td></tr> 
            <tr>
                <td><asp:TextBox ID="txtUsuario" runat="server" AutoCompleteType="Disabled" Style="width:90%" CssClass="button"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator
                    runat="server"
                    ID="rfvUsuario"
                    ControlToValidate="txtUsuario"
                    ErrorMessage="*"
                    ForeColor="Red"
                    Display="Dynamic"
                    />
                </td>
            </tr>

            <tr>
                <td><asp:Label ID="lblContrasena" runat="server" Text="Contrasena"></asp:Label></td></tr>
            <tr>
                <td><asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" Style="width:90%" CssClass="button"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator
                    runat="server"
                    ID="rfvContrasena"
                    ControlToValidate="txtContrasena"
                    ErrorMessage="*"
                    ForeColor="Red"
                    Display="Dynamic"
                    />
                </td>
            </tr>
            <tr>

                <td colspan="2"><asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" CssClass="button" /></td>

            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblEstado" runat="server" ForeColor="Red" ></asp:Label></td>

            </tr>

        </table>

    </form>

   <!-- Add the down arrow button to trigger the scroll -->
<button id="downArrow" class="dropArrow"></button>

        </section>
    <section id="section-2" class="section-2">
    <header class="heading">¡Suscribete y obten!</header>
    <div class="contentWrapper">
        <div class="charTable1">
            <h3>Contador de Calorias</h3>
            <h4>En StrongFit, nuestro Contador de Calorías es una herramienta esencial para gestionar tu alimentación de manera inteligente y alcanzar tus objetivos de salud. Registra y monitorea fácilmente las calorías que consumes a diario, ajustando tus planes de alimentación según tus metas, ya sea perder peso, ganar masa muscular o simplemente mantenerte saludable.</h4>
            <div class="image-container">
                <img src="Resources/images/contCalories1.jpg" class="img-thumbnail" alt="Imagen 1"/>
                <img src="Resources/images/contCalories2.jpg" class="img-thumbnail" alt="Imagen 2"/>
            </div>
        </div>
        <div class="charTable2">
            <h3>Entrenamientos Personalizados</h3>
            <h4>En StrongFit, nuestros Entrenamientos Personalizados están diseñados para adaptarse a tus necesidades, nivel de condición física y metas específicas. Ya sea que quieras perder peso, ganar fuerza, aumentar tu resistencia o simplemente mantenerte activo, encontrarás planes que se ajustan perfectamente a ti.</h4>
            <div class="image-container">
                <img src="Resources/images/perTraining1.jpg" class="img-thumbnail" alt="Imagen 1"/>
                <img src="Resources/images/perTraining2.jpg" class="img-thumbnail" alt="Imagen 2"/>
            </div>
        </div>
    </div>
</section>
    <section id="section-3" class="section-3">

<div class="contentWrapper2">
    <div class="charTable1_5">
        <img src="Resources/images/logo2.png" alt="Imagen 1"/>
    </div>
    <div class="charTable2_5">
        <h1 class="subTitle">Quienes somos</h1>
        <h1>En StrongFit, somos un equipo apasionado por la salud, el bienestar y la tecnología. Nuestra misión es ayudarte a alcanzar tus objetivos de condición física a través de una plataforma integral que combina planes nutricionales, entrenamientos personalizados y herramientas de seguimiento, todo diseñado pensando en ti.</h1>
    </div>
</div>


        
  <div class="footer">
    <ul class="footer-links">
        <li><a href="#">Preguntas frecuentes</a></li>
        <li><a href="#">Centro de ayuda</a></li>
        <li><a href="#">Cuenta</a></li>
        <li><a href="#">Términos de uso</a></li>
        <li><a href="#">Privacidad</a></li>
        <li><a href="#">Preferencias de cookies</a></li>
        <li><a href="#">Avisos legales</a></li>
    </ul>
</div>
    </section>
    <script src="Resources/mapaNavegacion.js"></script>
    <script src="Resources/mapaNavegacion.js"></script>



</body>
</html>