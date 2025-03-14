<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="suscriptionPage.aspx.cs" Inherits="StrongFit.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
       <!-- Hidden Login Form -->
    <form id="form2" runat="server" class="registerUser">
        <table>
            <tr>
                <td><asp:Label ID="rUsuario" runat="server" Text="Nombre/Usuario"></asp:Label> </td></tr>
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
                <td><asp:Label ID="rCorreo" runat="server" Text="Correo"></asp:Label></td></tr>
            <tr>
                <td><asp:TextBox ID="txtCorreo" runat="server" TextMode="Email" Style="width:90%" CssClass="button"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator
                    runat="server"
                    ID="RequiredFieldValidator1"
                    ControlToValidate="txtCorreo"
                    ErrorMessage="*"
                    ForeColor="Red"
                    Display="Dynamic"
                    />
                </td>
            </tr>
         <tr>
             <td><asp:Label ID="rContraseña" runat="server" Text="Contraseña"></asp:Label></td></tr>
         <tr>
             <td><asp:TextBox ID="txtContraseña" runat="server" TextMode="Password" Style="width:90%" CssClass="button"></asp:TextBox></td>
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
                <td colspan="2"><asp:Button ID="btnContinuar" runat="server" Text="Continuar" CssClass="button" /></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblEstado" runat="server" ForeColor="Red" ></asp:Label></td>

            </tr>

        </table>

    </form>
</body>
</html>
