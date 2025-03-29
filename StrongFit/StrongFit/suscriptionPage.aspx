<<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="suscriptionPage.aspx.cs" Inherits="StrongFit.suscriptionPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Suscribirse - StrongFit</title>
    <link rel="stylesheet" href="Resources/suscriptionPage.css" />
</head>
<body>
    <div class="container">
        <div class="form-box">
            <img src="Resources/images/logo2.png" alt="StrongFit Logo" class="logo" />
            <h2>Únete a StrongFit</h2>
            <form id="form1" runat="server" class="register-form">
                <div class="input-group">
                    <label for="txtUsuario">Nombre de Usuario</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="input-field" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUsuario" ErrorMessage="*" ForeColor="Red" />
                </div>
                <div class="input-group">
                    <label for="txtCorreo">Correo Electrónico</label>
                    <asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" CssClass="input-field" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtCorreo" ErrorMessage="*" ForeColor="Red" />
                </div>
                <div class="input-group">
                    <label for="txtContrasena">Contraseña</label>
                    <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="input-field" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtContrasena" ErrorMessage="*" ForeColor="Red" />
                </div>
                <asp:Button ID="btnRegister" runat="server" Text="Continuar" OnClick="btnRegister_Click" CssClass="Continuar" />
                <asp:Label ID="lblEstado" runat="server" ForeColor="Red" />
            </form>
        </div>
    </div>
</body>
</html>
