<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alimentos.aspx.cs" Inherits="WebApplication1_StrongFit.Alimentos.Alimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Listado de Alimentos
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../Resources/tablasCss.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h1 class="page-title">Listado de Alimentos</h1>
    <h2>
        <asp:HyperLink ID="hlRegistroAlimento" runat="server" NavigateUrl="~/dataDisplay/Alimentos/RegistroAlimento.aspx" 
            CssClass="register-link" Text="Registrar Alimento" />
    </h2>

    <div class="table-container">
        <asp:GridView ID="gvDatosAlimentos" runat="server" AutoGenerateColumns="False" CssClass="custom-gridview"
            HeaderStyle-CssClass="header" RowStyle-CssClass="row" AlternatingRowStyle-CssClass="alt-row"
            OnRowCommand="gvDatosAlimentos_RowCommand" DataKeyNames="idAlimentos">
            <Columns>
                <asp:BoundField DataField="idAlimentos" HeaderText="ID Alimento" ItemStyle-CssClass="centered-column" />
                <asp:BoundField DataField="Alimento" HeaderText="Nombre del Alimento" />
                <asp:BoundField DataField="Calorias" HeaderText="Calorías" ItemStyle-CssClass="centered-column" />
                <asp:TemplateField HeaderText="Acciones">
                    <ItemTemplate>
                        <asp:LinkButton ID="lblActualizar" runat="server" CssClass="btn-action update" Text="Actualizar" 
                            CommandName="Actualizar" CommandArgument='<%# Eval("idAlimentos") %>' />
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="lblEliminar" runat="server" CssClass="btn-action delete" Text="Eliminar" 
                            CommandName="Eliminar" CommandArgument='<%# Eval("idAlimentos") %>' 
                            OnClientClick="return confirm('¿Está seguro de eliminar el registro?')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
