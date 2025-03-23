<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="objetivo.aspx.cs" Inherits="StrongFit.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Definir Objetivo - StrongFit</title>
    <link rel="stylesheet" href="Resources/objetivo.css" />
</head>
<body>
    <div class="container">
        <h2>Define tu Objetivo</h2>
        <form id="form1" runat="server">
            <div class="input-group">
                <label for="txtEdad">Edad</label>
                <asp:TextBox ID="txtEdad" runat="server" CssClass="input-field" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEdad" ErrorMessage="*" ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="ddlGenero">Género</label>
                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="input-field">
                    <asp:ListItem Text="Selecciona..." Value="" />
                    <asp:ListItem Text="Masculino" Value="Masculino" />
                    <asp:ListItem Text="Femenino" Value="Femenino" />
                    <asp:ListItem Text="Otro" Value="Otro" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGenero" InitialValue="" ErrorMessage="*" ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="txtAltura">Altura (cm)</label>
                <asp:TextBox ID="txtAltura" runat="server" CssClass="input-field" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAltura" ErrorMessage="*" ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="txtPeso">Peso (kg)</label>
                <asp:TextBox ID="txtPeso" runat="server" CssClass="input-field" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPeso" ErrorMessage="*" ForeColor="Red" />
            </div>

         <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClientClick="window.location.href='userPage.aspx'; return false;" CssClass="submit-button" />

        </form>
    </div>
</body>
</html>
