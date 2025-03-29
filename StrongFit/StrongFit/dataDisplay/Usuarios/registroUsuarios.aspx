<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="StrongFit.dataDisplay.Usuarios.RegistroUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h2><asp:Label ID="lblAccion" runat="server" Text="" /></h2>
    <table>
        <tr>
            <td><asp:Label ID="lblNombre" runat="server" Text="Nombre del Usuario" AssociatedControlID="txtNombre" /></td>
            <td><asp:TextBox ID="txtNombre" runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator
                    id="rfvNombre"
                    runat="server"
                    ControlToValidate="txtNombre"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblCorreo" runat="server" Text="Correo Electrónico" AssociatedControlID="txtCorreo" /></td>
            <td><asp:TextBox ID="txtCorreo" runat="server" MaxLength="100" />
                <asp:RequiredFieldValidator
                    id="rfvCorreo"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator
                    id="revCorreo"
                    runat="server"
                    ControlToValidate="txtCorreo"
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                    ErrorMessage="Formato de correo inválido"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblTipoUsuario" runat="server" Text="Tipo de Usuario" AssociatedControlID="ddlTipoUsuario" /></td>
            <td><asp:DropDownList ID="ddlTipoUsuario" runat="server">
                    <asp:ListItem Value="0">Seleccionar</asp:ListItem>
                    <asp:ListItem Value="1">Administrador</asp:ListItem>
                    <asp:ListItem Value="2">Usuario</asp:ListItem>
                <asp:ListItem Value="3">Entrenador</asp:ListItem>
                <asp:ListItem Value="4">Nutricionista</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    id="rfvTipoUsuario"
                    runat="server"
                    ControlToValidate="ddlTipoUsuario"
                    InitialValue="0"
                    ErrorMessage="Seleccione el tipo de usuario"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:left">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir Usuario" OnClick="btnAñadir_Click" UseSubmitBehavior="true" />
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Usuario" OnClick="btnActualizar_Click" UseSubmitBehavior="true" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" Visible="true" OnClientClick="window.location.href='Usuarios.aspx'; return false;" />
            </td>
        </tr>
    </table>
</asp:Content>
