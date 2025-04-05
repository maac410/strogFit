<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="recetas.aspx.cs" Inherits="WebApplication1_StrongFit.recetas.recetas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../Resources/tablas.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <script type="text/javascript">
        window.onpageshow = function (event) {
            if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
                window.location.reload();
            }
        };
    </script>
    <h1 class="page-title">Listado de Dietas</h1>
    <h2>
        <asp:HyperLink ID="hlRegistroDieta" runat="server" NavigateUrl="registroRecetas.aspx" Text="Registrar Dieta" CssClass="register-link" />
    </h2>

    <div class="table-container">
       <asp:GridView ID="gvDatosDietas" runat="server" AutoGenerateColumns="False" CssClass="custom-gridview"
    HeaderStyle-CssClass="header" RowStyle-CssClass="row" AlternatingRowStyle-CssClass="alt-row"
    HeaderStyle-HorizontalAlign="Center"
    GridLines="None" TableLayout="Fixed"
    OnRowCommand="gvDatosDietas_RowCommand" DataKeyNames="id">

    <Columns>
        <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%" />
        <asp:BoundField DataField="nombre" HeaderText="Nombre" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20%" />
        <asp:BoundField DataField="calorias" HeaderText="Calorías" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" />
        <asp:BoundField DataField="proteinas" HeaderText="Proteínas" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" />
        <asp:BoundField DataField="carbohidratos" HeaderText="Carbohidratos" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" />
        <asp:BoundField DataField="grasas" HeaderText="Grasas" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="15%" />

        <asp:TemplateField HeaderText="Acciones">
            <ItemStyle HorizontalAlign="Center" Width="20%" />
            <ItemTemplate>
                <asp:LinkButton ID="lblActualizar" runat="server" Text="Actualizar" CssClass="btn-action update"
                    CommandName="Actualizar" CommandArgument='<%# Eval("id") %>' />
                &nbsp;&nbsp;
                <asp:LinkButton ID="lblEliminar" runat="server" Text="Eliminar" CssClass="btn-action delete"
                    CommandName="Eliminar" CommandArgument='<%# Eval("id") %>'
                    OnClientClick="return confirm('¿Está seguro de eliminar la dieta?')" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

    </div>
</asp:Content>
