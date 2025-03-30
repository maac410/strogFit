<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registroRecetas.aspx.cs" Inherits="StrongFit.dataDisplay.registroRecetas.registroRecetas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h2><asp:Label ID="lblAccion" runat="server" Text="" /></h2>
    <table>
        <tr>
            <td><asp:Label ID="lblNombreDieta" runat="server" Text="Nombre de la Dieta" AssociatedControlID="txtNombreDieta" /></td>
            <td><asp:TextBox ID="txtNombreDieta" runat="server" MaxLength="100" />
                <asp:RequiredFieldValidator
                    id="rfvNombreDieta"
                    runat="server"
                    ControlToValidate="txtNombreDieta"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblDescripcion" runat="server" Text="Descripción" AssociatedControlID="txtDescripcion" /></td>
            <td><asp:TextBox ID="txtDescripcion" runat="server" MaxLength="500" TextMode="MultiLine" Rows="4" />
                <asp:RequiredFieldValidator
                    id="rfvDescripcion"
                    runat="server"
                    ControlToValidate="txtDescripcion"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblCalorias" runat="server" Text="Calorías Totales" AssociatedControlID="txtCalorias" /></td>
            <td><asp:TextBox ID="txtCalorias" runat="server" MaxLength="10" />
                <asp:RequiredFieldValidator
                    id="rfvCalorias"
                    runat="server"
                    ControlToValidate="txtCalorias"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator
                    id="revCalorias"
                    runat="server"
                    ControlToValidate="txtCalorias"
                    ValidationExpression="^\d+$"
                    ErrorMessage="Solo se permiten números"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:left">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir Dieta" OnClick="btnAñadir_Click" UseSubmitBehavior="true" />
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Dieta" OnClick="btnActualizar_Click" UseSubmitBehavior="true" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" Visible="true" OnClientClick="window.location.href='recetas.aspx'; return false;" />
            </td>
        </tr>
    </table>
</asp:Content>
