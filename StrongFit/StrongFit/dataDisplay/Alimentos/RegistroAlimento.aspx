<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroAlimento.aspx.cs" Inherits="StrongFit.dataDisplay.Alimentos.RegistroAlimento" %>



<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Registro de Alimento | StrongFit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../registrarAlimentos.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <h2><asp:Label ID="lblAccion" runat="server" CssClass="title-label" Text="" /></h2>

        <asp:Panel ID="pnlRegistro" runat="server" CssClass="form-panel">
            <table class="form-table">
                <tr>
                    <td>
                        <asp:Label ID="lblAlimento" runat="server" Text="Nombre del Alimento" AssociatedControlID="txtAlimento" CssClass="form-label" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAlimento" runat="server" MaxLength="50" CssClass="form-input" />
                        <asp:RequiredFieldValidator ID="rfvAlimento" runat="server" ControlToValidate="txtAlimento"
                            ErrorMessage="Campo Obligatorio" ForeColor="Red" Display="Dynamic" CssClass="error-message" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblCantidad" runat="server" Text="Cantidad" AssociatedControlID="txtCantidad" CssClass="form-label" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-input" />
                        <asp:RequiredFieldValidator ID="rfvCantidad" runat="server" ControlToValidate="txtCantidad"
                            ErrorMessage="Campo Obligatorio" ForeColor="Red" Display="Dynamic" CssClass="error-message" />
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lblPorcion" runat="server" Text="Seleccione unidad de medida" AssociatedControlID="ddlPorcion" CssClass="form-label" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPorcion" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Seleccione..." Value="0"></asp:ListItem>
                            <asp:ListItem Text="Gramos" Value="Gr"></asp:ListItem>
                            <asp:ListItem Text="Mililitros" Value="Ml"></asp:ListItem>
                            <asp:ListItem Text="Porciones" Value="Porcion"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPorcion" runat="server" ControlToValidate="ddlPorcion"
                            InitialValue="0" ErrorMessage="Agregue unidad de medida" ForeColor="Red" Display="Dynamic" CssClass="error-message" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="form-buttons">
                        <asp:Button ID="btnAñadir" runat="server" Text="Añadir" OnClick="btnAñadir_Click"
                            UseSubmitBehavior="true" CssClass="btn btn-primary" Visible="false" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Actualizar Alimento" OnClick="btnUpdate_Click"
                            UseSubmitBehavior="true" CssClass="btn btn-warning" Visible="false" />
                        <asp:Button ID="btnVolver" runat="server" Text="Volver" CssClass="btn btn-secondary"
                            OnClientClick="window.location.href='Alimentos.aspx'; return false;" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>




