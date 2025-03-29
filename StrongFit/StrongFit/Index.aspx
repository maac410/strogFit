<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1_StrongFit.Index" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Inicio | StrongFit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Bienvenido a StrongFit, tu plataforma para mejorar tu salud con planes de nutrición y entrenamiento personalizados.">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Resources/Master.css") %>' />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <div class="container text-center mt-5">
        <!-- Título Principal -->
        <h1 class="fw-bold text-neon">Bienvenido a StrongFit</h1>
        <p class="lead">
            La mejor plataforma para gestionar tu dieta y entrenamientos de manera personalizada.
        </p>

        <!-- Bienvenida al usuario -->
        <div class="mt-4">
            <h4>
                Hola, <%= Session["usuario"] != null ? System.Web.HttpUtility.HtmlEncode(Session["usuario"].ToString()) : "Invitado" %> 👋
            </h4>
        </div>

        <!-- Botón Mejorado -->
        <div class="mt-4">
            <asp:HyperLink runat="server" NavigateUrl="~/dataDisplay/Alimentos/Alimentos.aspx" 
                           CssClass="explore-button"
                           aria-label="Explorar el Plan Nutricional">
                Explorar Plan Nutricional
            </asp:HyperLink>
        </div>
    </div>
</asp:Content>
