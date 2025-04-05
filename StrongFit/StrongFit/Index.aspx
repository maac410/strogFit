<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1_StrongFit.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Inicio | StrongFit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta name="description" content="Bienvenido a StrongFit, tu plataforma para mejorar tu salud con planes de nutrición y entrenamiento personalizados.">
    <link rel="stylesheet" href='<%= ResolveUrl("~/Resources/Master.css") %>' />

<script type="text/javascript">
    window.onpageshow = function (event) {
        if (event.persisted || (window.performance && window.performance.navigation.type === 2)) {
            window.location.reload();
        }
    };
</script>

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
                Hola, 
                <asp:Label ID="lblUsuario" runat="server" CssClass="fw-bold"></asp:Label> 
                (<asp:Label ID="lblRol" runat="server" CssClass="text-muted"></asp:Label>) 👋
            </h4>
        </div>

        <!-- Botones de navegación -->
        <div class="mt-4">
            <!-- Botón Registro de Usuarios -->
            <asp:HyperLink ID="hlRegistroUsuarios" runat="server" NavigateUrl="~/dataDisplay/Usuarios/usuarios.aspx" 
                           CssClass="explore-button" aria-label="Registro de Usuarios">
                Registro de Usuarios
            </asp:HyperLink>

            <!-- Botón Registro de Dietas -->
            <asp:HyperLink ID="hlRegistroDietas" runat="server" NavigateUrl="~/dataDisplay/Recetas/recetas.aspx" 
                           CssClass="explore-button" aria-label="Editar Recetas">
                Editar Recetas
            </asp:HyperLink>

            <!-- Botón Registro de Entrenamientos -->
            <asp:HyperLink ID="hlRegistroEntrenamientos" runat="server" NavigateUrl="~/dataDisplay/Ejercicios/ejercicios.aspx" 
                           CssClass="explore-button" aria-label="Editar Ejercicios">
                Editar Ejercicios
            </asp:HyperLink>

            <!-- Botón Perfil -->
            <asp:HyperLink ID="hlPerfil" runat="server" NavigateUrl="userPage.aspx" 
                           CssClass="explore-button" aria-label="Perfil">
                Perfil
            </asp:HyperLink>

        </div>
    </div>
</asp:Content>

