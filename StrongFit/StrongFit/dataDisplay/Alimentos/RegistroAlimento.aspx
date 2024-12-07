<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroAlimento.aspx.cs" Inherits="StrongFit.dataDisplay.Alimentos.RegistroAlimento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h2><asp:Label ID="lblAccion" runat="server" Text="" /></h2>
    <table>
        <tr>
            <td><asp:Label ID="lblAlimento" runat="server" Text="Nombre del Alimento" AssociatedControlID="txtAlimento" /></td>
            <td><asp:TextBox ID="txtAlimento" runat="server" MaxLength="50" />
                <asp:RequiredFieldValidator
                    id="rfvAlimento"
                    runat="server"
                    ControlToValidate="txtAlimento"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
                
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblCantidad" runat="server" Text="Cantidad" AssociatedControlID="txtCantidad" /></td>
            <td><asp:TextBox ID="txtCantidad" runat="server" />
                <asp:RequiredFieldValidator
                    id="rfvCantidad"
                    runat="server"
                    ControlToValidate="txtCantidad"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblPorcion" runat="server" Text="seleccione unidad de medida" AssociatedControlID="ddlPorcion" /></td>
            <td><asp:DropDownList ID="ddlPorcion" runat="server" />
                <asp:RequiredFieldValidator
                    id="rfvPorcion"
                    runat="server"
                    ControlToValidate="ddlPorcion"
                    InitialValue="0"
                    ErrorMessage="Agregue unidad de medida"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>   

        </tr>
        <tr>
            <td colspan="2" style="text-align:left">
                <asp:Button ID="btnAñadir" runat="server" Text="Añadir" OnClick="btnAñadir_Click" UseSubmitBehavior="true" Visible="false" />
                <asp:Button ID="btnUpdate" runat="server" Text="Actualizar Alimento" OnClick="btnUpdate_Click" UseSubmitBehavior="true" Visible="false" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" Visible="true" OnClientClick="window.location.href='Alimentos.aspx'; return false;" />
            </td>
                
        </tr>
    </table>







</asp:Content>
