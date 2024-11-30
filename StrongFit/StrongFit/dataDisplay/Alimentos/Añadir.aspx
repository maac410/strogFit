<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Añadir.aspx.cs" Inherits="WebApplication1_StrongFit.Alimentos.Añadir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h2>Ingresar Alimeto</h2>
    <table>
        <tr>
            <td class="auto-style1"><asp:Label ID="lblNombre" runat="server" Text="Nombre del Alimento: " AssosiatedControlID="txtNombre"/></td>
            <td class="auto-style1"><asp:TextBox ID="txtNombre" runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator
                    ID="rfvNombre"
                    runat="server"
                    ControlValidate="txtNombre"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator
                    ID="revNombre"
                    runat="server"
                    ControlValidate="txtNombre"
                    ForeColor="Red"
                    Display="Dynamic"
                    ValidationExpression="^[A-Z]{2}$"
                    ErrorMessage="El Nombre debe tener dos letras mayusculas" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCantidad" runat="server" Text="Cantidad: " AssosiatedControlID="txtCantidad"/>
                <asp:TextBox ID="txtCantidad" runat="server"/>
                <asp:RequiredFieldValidator
                    id="rfvCantidad"
                    runat="server"
                    ControlValidate="txtCantidad"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />


            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblRacion" runat="server" Text="Tamaño de ración" AssociatedControlID="ddlRacion"></asp:Label></td>
                <asp:DropDownList ID="ddlRacion" runat="server" /><td></td>
            <td>
                <asp:RequiredFieldValidator
                    id="rfvRacion"
                    runat="server"
                    ControlValidate="ddlRacion"
                    ErrorMessage="Selecione unidad de medida"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:left"><asp:Button ID="Registrar" runat="server" Text="Registrar Alimento" OnClick="Registrar_Click" UseSubmitBehavior="true" /></td>
        </tr>

    </table>


</asp:Content>
