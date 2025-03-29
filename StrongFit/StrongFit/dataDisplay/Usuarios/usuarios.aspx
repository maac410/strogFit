<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WebApplication1_StrongFit.Usuarios.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../Resources/tablas.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h1>Listado de Usuarios</h1>
    <h2><asp:HyperLink ID="hlRegistroUsuario" runat="server" NavigateUrl="registroUsuarios.aspx" Text="Registrar Usuario" /></h2>

    <asp:GridView ID="gvDatosUsuarios" runat="server" AutoGenerateColumns="False" CssClass="custom-gridview" HeaderStyle-CssClass="header" RowStyle-CssClass="row" AlternatingRowStyle-CssClass="alt-row"
        OnRowCommand="gvDatosUsuarios_RowCommand" DataKeyNames="usuario_id">
        <Columns>
            <asp:BoundField DataField="usuario_id" HeaderText="ID Usuario" />
            <asp:BoundField DataField="rol" HeaderText="Rol" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="correo" HeaderText="Correo" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:LinkButton ID="lblActualizar" runat="server" Text="Actualizar" CommandName="Actualizar"
                        CommandArgument='<%# Eval("usuario_id") %>' />
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lblEliminar" runat="server" Text="Eliminar" CommandName="Eliminar"
                        CommandArgument='<%# Eval("usuario_id") %>' OnClientClick="return confirm('¿Está seguro de eliminar el registro?')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
