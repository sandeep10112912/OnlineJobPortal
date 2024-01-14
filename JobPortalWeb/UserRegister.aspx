<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="JobPortalWeb.UserRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
</head>
<body style="background-color:blueviolet">
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
                    <td>Type</td>
                    <td>
                        <asp:DropDownList ID="UserType" runat="server">
                            <asp:ListItem Text="Select User" Value="select" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="User" Value="User"></asp:ListItem>
                            <asp:ListItem Text="HR" Value="HR"></asp:ListItem>
                            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" />
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
            <li class="nav-item"><a class="nav-link" runat="server" style="color: white" href="Login.aspx">Login</a></li>
        </ul>
    </form>
</body>
</html>
