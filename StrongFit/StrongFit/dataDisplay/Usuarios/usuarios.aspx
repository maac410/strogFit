<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WebApplication1_StrongFit.Usuarios.Usuarios" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../Resources/tablas.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h1 class="page-title">Listado de Usuarios</h1>
    <h2>
        <asp:HyperLink ID="hlRegistroUsuario" runat="server" NavigateUrl="registroUsuarios.aspx" Text="Registrar Usuario" CssClass="register-link" />
    </h2>

    <div class="table-container">
        <asp:GridView ID="gvDatosUsuarios" runat="server" AutoGenerateColumns="False" CssClass="custom-gridview"
            HeaderStyle-CssClass="header" RowStyle-CssClass="row" AlternatingRowStyle-CssClass="alt-row"
            HeaderStyle-HorizontalAlign="Center"
            GridLines="None" TableLayout="Fixed"
            OnRowCommand="gvDatosUsuarios_RowCommand" DataKeyNames="usuario_id">
            
            <Columns>
                <asp:BoundField DataField="usuario_id" HeaderText="____ID______" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" />
                <asp:BoundField DataField="rol" HeaderText="_____Rol____" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="nombre" HeaderText="___Nombre___" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
                <asp:BoundField DataField="correo" HeaderText="___Correo__" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30%" />
                
                <asp:TemplateField HeaderText="Acciones">
                    <ItemStyle HorizontalAlign="Center" Width="20%" />
                    <ItemTemplate>
                        <asp:LinkButton ID="lblActualizar" runat="server" Text="Actualizar" CssClass="btn-action update"
                            CommandName="Actualizar" CommandArgument='<%# Eval("usuario_id") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="lblEliminar" runat="server" Text="Eliminar" CssClass="btn-action delete"
                            CommandName="Eliminar" CommandArgument='<%# Eval("usuario_id") %>' 
                            OnClientClick="return confirm('¿Está seguro de eliminar el registro?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
