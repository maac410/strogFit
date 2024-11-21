<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1_StrongFit.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio de sesión</title>
</head>
<body>
    <h1>Iniciar Sesión</h1>
    <form id="form1" runat="server">
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

    </form>
</body>
</html>
