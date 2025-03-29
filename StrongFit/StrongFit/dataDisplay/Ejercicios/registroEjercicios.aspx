<%@ Page Title="Registro de Entrenamiento" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registroEjercicios.aspx.cs" Inherits="StrongFit.dataDisplay.Entrenamientos.RegistroEntrenamiento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="main" runat="server">
    <h2><asp:Label ID="lblAccion" runat="server" Text="Registrar Entrenamiento" /></h2>
    <table>
        <tr>
            <td><asp:Label ID="lblNombre" runat="server" Text="Nombre del Entrenamiento" AssociatedControlID="txtNombre" /></td>
            <td><asp:TextBox ID="txtNombre" runat="server" MaxLength="64" />
                <asp:RequiredFieldValidator
                    id="rfvNombre"
                    runat="server"
                    ControlToValidate="txtNombre"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblTipoObjetivo" runat="server" Text="Tipo de Objetivo" AssociatedControlID="ddlTipoObjetivo" /></td>
            <td><asp:DropDownList ID="ddlTipoObjetivo" runat="server">
                    <asp:ListItem Value="Aumentar fuerza">Aumentar fuerza</asp:ListItem>
                    <asp:ListItem Value="Aumentar resistencia">Aumentar resistencia</asp:ListItem>
                    <asp:ListItem Value="Equilibrado">Equilibrado</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator
                    id="rfvTipoObjetivo"
                    runat="server"
                    ControlToValidate="ddlTipoObjetivo"
                    InitialValue="0"
                    ErrorMessage="Seleccione un tipo de objetivo"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblSeries" runat="server" Text="Series" AssociatedControlID="txtSeries" /></td>
            <td><asp:TextBox ID="txtSeries" runat="server" />
                <asp:RequiredFieldValidator
                    id="rfvSeries"
                    runat="server"
                    ControlToValidate="txtSeries"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblRepeticiones" runat="server" Text="Repeticiones" AssociatedControlID="txtRepeticiones" /></td>
            <td><asp:TextBox ID="txtRepeticiones" runat="server" />
                <asp:RequiredFieldValidator
                    id="rfvRepeticiones"
                    runat="server"
                    ControlToValidate="txtRepeticiones"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblDescripcion" runat="server" Text="Descripción" AssociatedControlID="txtDescripcion" /></td>
            <td><asp:TextBox ID="txtDescripcion" runat="server" MaxLength="255" TextMode="MultiLine" />
                <asp:RequiredFieldValidator
                    id="rfvDescripcion"
                    runat="server"
                    ControlToValidate="txtDescripcion"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td><asp:Label ID="lblGuia" runat="server" Text="Guía" AssociatedControlID="txtGuia" /></td>
            <td><asp:TextBox ID="txtGuia" runat="server" MaxLength="255" TextMode="MultiLine" />
                <asp:RequiredFieldValidator
                    id="rfvGuia"
                    runat="server"
                    ControlToValidate="txtGuia"
                    ErrorMessage="Campo Obligatorio"
                    ForeColor="Red"
                    Display="Dynamic" />
            </td>
        </tr>

        <tr>
            <td colspan="2" style="text-align:left">
                <asp:Button ID="btnRegistrar" runat="server" Text="Registrar Entrenamiento" OnClick="btnRegistrar_Click" UseSubmitBehavior="true" />
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Entrenamiento" OnClick="btnActualizar_Click" UseSubmitBehavior="true" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" OnClientClick="window.location.href='ejercicios.aspx'; return false;" />
            </td>
        </tr>
    </table>
</asp:Content>
