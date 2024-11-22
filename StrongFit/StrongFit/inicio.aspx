<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1_StrongFit.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>El usuario ingreso <%=Session["usuario"] %></h1><hr />
            <asp:Button ID="btnSalir" runat="server" Text="Salir" OnClick="btnSalir_Click"/>
        </div>
    </form>
</body>
</html>
