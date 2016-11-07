<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ReporteVentaVehiculos.Presentacion.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                Marca:
            </td>
            <td>
                <asp:TextBox ID="textMarca" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Modelo:
            </td>
            <td>
                <asp:TextBox ID="textModelo" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Tipo Combustible:
            </td>
            <td>
                <asp:TextBox ID="textTipoC" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Anio:
            </td>
            <td>
                <asp:TextBox ID="textAnio" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID ="btnInsert" runat="server" Text ="Insertar" OnClick="btnInsert_Click"/>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView AutoGenerateColumns="true" runat="server" ID ="gridAuto"
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
