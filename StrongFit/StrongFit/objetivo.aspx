<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="StrongFit.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Definir Objetivo - StrongFit</title>
    <link rel="stylesheet" href="Resources/objetivo.css" />
    <script type="text/javascript">
        function limitarAltura(input) {
            if (input.value.length > 3) {
                input.value = input.value.slice(0, 3);
            }
        }

        function limitarPeso(input) {
            if (input.value.length > 3) {
                input.value = input.value.slice(0, 3);
            }
        }

        function validarFormulario() {
            var genero = document.getElementById("<%= ddlGenero.ClientID %>").value;
            var altura = document.getElementById("<%= txtAltura.ClientID %>").value.trim();
            var peso = document.getElementById("<%= txtPeso.ClientID %>").value.trim();
            var preferencia = document.getElementById("<%= ddlPreferencia.ClientID %>").value;
            var objetivo = document.getElementById("<%= ddlObjetivo.ClientID %>").value;
            var fechaNacimiento = document.getElementById("<%= txtFechaNacimiento.ClientID %>").value.trim();
            var botonGuardar = document.getElementById("<%= btnGuardar.ClientID %>");

            if (genero !== "" && altura !== "" && peso !== "" && preferencia !== "" && objetivo !== "" && fechaNacimiento !== "") {
                botonGuardar.disabled = false;
            } else {
                botonGuardar.disabled = true;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Define tu Objetivo</h2>
        <form id="form1" runat="server">

            <div class="input-group">
                <label for="ddlGenero">Género</label>
                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="input-field" onchange="validarFormulario();">
                    <asp:ListItem Text="Selecciona..." Value="" />
                    <asp:ListItem Text="Masculino" Value="Masculino" />
                    <asp:ListItem Text="Femenino" Value="Femenino" />
                    <asp:ListItem Text="Otro" Value="Otros" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlGenero" InitialValue="" ErrorMessage="*" ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="txtAltura">Altura (cm)</label>
                <asp:TextBox ID="txtAltura" runat="server" CssClass="input-field" MaxLength="3" oninput="limitarAltura(this); validarFormulario();" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAltura" ErrorMessage="*" ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="txtPeso">Peso (kg)</label>
                <asp:TextBox ID="txtPeso" runat="server" CssClass="input-field" MaxLength="3" oninput="limitarPeso(this); validarFormulario();" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPeso" ErrorMessage="*" ForeColor="Red" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPeso" ValidationExpression="^\d{1,3}$" ErrorMessage="El peso debe tener solo 3 dígitos." ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="ddlPreferencia">Preferencia</label>
                <asp:DropDownList ID="ddlPreferencia" runat="server" CssClass="input-field" onchange="validarFormulario();">
                    <asp:ListItem Text="Selecciona..." Value="" />
                    <asp:ListItem Text="Aumentar Fuerza" Value="1" />
                    <asp:ListItem Text="Aumentar Resistencia" Value="2" />
                    <asp:ListItem Text="Equilibrado" Value="3" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlPreferencia" InitialValue="" ErrorMessage="*" ForeColor="Red" />
            </div>

            <div class="input-group">
                <label for="ddlObjetivo">Objetivo</label>
                <asp:DropDownList ID="ddlObjetivo" runat="server" CssClass="input-field" onchange="validarFormulario();">
                    <asp:ListItem Text="Selecciona..." Value="" />
                    <asp:ListItem Text="Subir de Peso" Value="1" />
                    <asp:ListItem Text="Bajar de Peso" Value="2" />
                    <asp:ListItem Text="Mantener Peso" Value="3" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlObjetivo" InitialValue="" ErrorMessage="*" ForeColor="Red" />
            </div>

            <!-- New Date of Birth Field -->
            <div class="input-group">
                <label for="txtFechaNacimiento">Fecha de Nacimiento</label>
                <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="input-field" type="date" oninput="validarFormulario();" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtFechaNacimiento" ErrorMessage="*" ForeColor="Red" />
            </div>

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="submit-button" Enabled="false" OnClick="btnGuardar_Click" />
        </form>
    </div>
</body>
</html>
