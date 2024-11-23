<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homePage.aspx.cs" Inherits="StrongFit.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Resources\homeCss.css">
    <script src="Resources\Js.js"></script> <!-- Corrected to use <script> for JS file -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <title>StrongFit</title>
</head>
<body>

    <!-- Navigation Bar -->
    <div class="navBar">
        <button class="home">Home</button>
        <button class="Informacion">Informacion</button>
        <button class="acerca">Acerca</button>
        <input class="search" type="text" placeholder="search...">
    </div>

    <!-- Title and Description -->
    <div class="contTitle">
        <p class="mainTitle">Strong Fit</p><hr class="Linea">
        <p class="subTitle">Alcanza tus metas</p>
        <p class="text">Controla, optimiza tu alimentación y ejercicio con información precisa y herramientas tecnológicas avanzadas. Ideal para personas modernas y ocupadas que buscan mejorar su bienestar físico y mental. ¡Empieza a cuidar de ti mismo hoy!</p>
    </div>

<<<<<<< HEAD
      <h1>Iniciar Sesión</h1>
<form id="form1" runat="server" class="logInCont">
    <table>
        <tr>
            <td><asp:Label ID="lblUsuario" runat="server" Text="Id Usuario"></asp:Label></td>
            <td><asp:TextBox ID="txtUsuario" runat="server" AutoCompleteType="Disabled"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator
                runat="server"
                ID="rfvUsuario"
                ControlToValidate="txtUsuario"
                ErrorMessage="El campo usuario es obligatorio"
                ForeColor="Red"
                Display="Dynamic"
                />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblContraseña" runat="server" Text="Contraseña"></asp:Label></td>
            <td><asp:TextBox ID="txtContraseña" runat="server" TextMode="Password"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator
                runat="server"
                ID="rfvContraseña"
                ControlToValidate="txtContraseña"
                ErrorMessage="El campo contraseña es obligatorio"
                ForeColor="Red"
                Display="Dynamic"
                />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center"><asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" /></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center"><asp:Label ID="lblEstado" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>
=======
    <!-- Image Container -->
    <div class="imgContMain">
        <img src="Resources\images\homeImg1.jpg" alt="">
        <div class="border"></div>
    </div>
>>>>>>> fe491ff32e3bb968b1915736a7e9c1d2fb31ecb3

    <!-- Button Container -->
    <div class="buttonCont">
        <button class="logInBtn" onclick="toggleLoginForm()">Iniciar Seción</button>
        <button class="suscribe"> Suscribirse </button>
    </div>

    <!-- Hidden Login Form -->
    <form id="form1" runat="server" class="logInCont">
        <table>
            <tr>
                <td><asp:Label ID="lblUsuario" runat="server" Text="Id Usuario"></asp:Label></td></tr>
            <tr>
                <td><asp:TextBox ID="txtUsuario" runat="server" AutoCompleteType="Disabled" Style="width:90%"></asp:TextBox></td>
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
                <td><asp:Label ID="lblContraseña" runat="server" Text="Contraseña"></asp:Label></td></tr>
            <tr>
                <td><asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" Style="width:90%"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator
                    runat="server"
                    ID="rfvContraseña"
                    ControlToValidate="txtContraseña"
                    ErrorMessage="*"
                    ForeColor="Red"
                    Display="Dynamic"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblEstado" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>
    </form>

    <button class="dropArrow"></button>
</body>
</html>
