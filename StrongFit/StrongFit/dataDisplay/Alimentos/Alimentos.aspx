<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Alimentos.aspx.cs" Inherits="WebApplication1_StrongFit.Alimentos.Alimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h2>listado de Alimentos</h2>
    <asp:GridView ID="gvDatosAlimentos" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="idAlimentos" HeaderText="id Alimento" />
            <asp:BoundField DataField="Alimento" HeaderText="Nombre del alimento" />
            <asp:BoundField DataField="Calorias" HeaderText="Calorias" />
        </Columns>
    </asp:GridView>
</asp:Content>
