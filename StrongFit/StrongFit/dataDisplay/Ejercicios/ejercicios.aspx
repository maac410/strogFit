<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Ejercicios.aspx.cs" Inherits="WebApplication1_StrongFit.Entrenamientos.Entrenamientos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="../../Resources/tablas.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h1>Listado de Entrenamientos</h1>
    <h2><asp:HyperLink ID="hlRegistroEntrenamiento" runat="server" NavigateUrl="registroEjercicios.aspx" Text="Registrar Entrenamiento" /></h2>

    <asp:GridView ID="gvDatosEntrenamientos" runat="server" AutoGenerateColumns="False" CssClass="custom-gridview" HeaderStyle-CssClass="header" RowStyle-CssClass="row" AlternatingRowStyle-CssClass="alt-row"
        OnRowCommand="gvDatosEntrenamientos_RowCommand" DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID Entrenamiento" />
            <asp:BoundField DataField="tipo_objetivo" HeaderText="Tipo de Objetivo" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="series" HeaderText="Series" />
            <asp:BoundField DataField="repeticiones" HeaderText="Repeticiones" />
            <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="guia" HeaderText="Guía" />
            <asp:TemplateField HeaderText="Acciones">
                <ItemTemplate>
                    <asp:LinkButton ID="lblActualizar" runat="server" Text="Actualizar" CommandName="Actualizar"
                        CommandArgument='<%# Eval("id") %>' />
                    &nbsp;&nbsp;
                    <asp:LinkButton ID="lblEliminar" runat="server" Text="Eliminar" CommandName="Eliminar"
                        CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('¿Está seguro de eliminar el registro?')" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
