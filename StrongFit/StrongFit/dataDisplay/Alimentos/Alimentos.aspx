<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alimentos.aspx.cs" Inherits="WebApplication1_StrongFit.Alimentos.Alimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../Resources/tablasCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h1>listado de Alimentos</h1>
    <h2><asp:HyperLink ID="hlRegisroAlimento" runat="server" NavigateUrl="~/dataDisplay/Alimentos/RegistroAlimento.aspx" Text="Registrar Alimento" /></h2>

    <asp:GridView ID="gvDatosAlimentos" runat="server" AutoGenerateColumns="False" CssClass="custom-gridview" HeaderStyle-CssClass="header" RowStyle-CssClass="row" AlternatingRowStyle-CssClass="alt-row"
        OnRowCommand="gvDatosAlimentos_RowCommand" DataKeyNames="idAlimentos">
        <Columns>
            <asp:BoundField DataField="idAlimentos" HeaderText="id Alimento" />
            <asp:BoundField DataField="Alimento" HeaderText="Nombre del alimento" />
            <asp:BoundField DataField="Calorias" HeaderText="Calorias" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:LinkButton ID="lblActualizar" runat="server" Text="Actualizar" CommandName="Actualizar"
                        CommandArgument='<%# Eval("idAlimentos") %>' />
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lblEliminar" runat="server" Text="Eliminar" CommandName="Eliminar"
                        CommandArgument='<%# Eval("idAlimentos") %>' OnClientClick="return confirm('¿Esta seguro de eliminar el registro?')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>