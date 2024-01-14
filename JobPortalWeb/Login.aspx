<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JobPortalWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <p>
            <table class="auto-style1">
                <tr>
                    <td>Name :</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="BtnSave" runat="server" Text="Login" OnClick="BtnSave_Click" />
                    </td>
                     <td>
                        <asp:Button ID="Register" runat="server" Text="Register" OnClick="Register_Click" />
                    </td>
                </tr>
            </table>
        </p>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <asp:Label ID="messageText" Text="" runat="server"></asp:Label>
            </div>
        </div>
        <ul class="navbar-nav flex-grow-1">
            <li class="nav-item"><a class="nav-link" runat="server" style="color: white" href="UserRegister.aspx">Register Here</a></li>
        </ul>
    </form>
</body>
</html>
