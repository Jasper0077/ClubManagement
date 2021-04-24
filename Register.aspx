<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ClubManagement.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .register-box {
            margin: 0 auto 20px auto;
            width: 600px;
            background: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);

        }
        .register-box h1{
            text-align:center;
            padding: 20px;
            border: none;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            background-color: #a0a0a0;
            color: white;
        }
        .register-table {
            margin: 50px auto 0px 100px;
        }
        .btn{
            font-family: "Roboto", sans-serif;
            font-size: 12px;
            background: #808080;
            width: 120px;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            color: #fff;
            border: none;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            margin-left: 50px;
            margin-top: 10px;
        }
        .login-btn {
            font-size: 12px;
            text-align:center;
            text-transform: uppercase;
            color:#505050;
            border: none;
            background: none;
            cursor: pointer;
        }
        .input {
            width: 100%;
            padding: 0 5px;
            height: 40px;
            font-size: 16px;
            background: none;
            outline: none;
            border: 2px solid #808080;
            margin-left: 5px;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .text {
            font-size: 18px;
            font-family: sans-serif;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        td {
            margin: 10px 0 10px 10px;
            padding-left: 10px;
        }
        .validation-msg {
            padding-left: 10px;
            margin: 10px 0 10px 10px;
        }
    </style>
</head>
<body>
   <form id="form1" runat="server">
        <div class="content">
            <div class="register-box">
                <h1>Register</h1>
                <div class="register-table">
                    <table>
                        <tr>
                            <td style="padding:5px" class="text">Username</td>
                            <td style="padding:5px">
                                <asp:TextBox ID="Username" runat="server" CssClass="input"></asp:TextBox> 
                            </td>
                            <td style="padding:5px">
                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px" class="text">Password</td>
                            <td style="padding:5px"><asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                           
                            </td>
                            <td style="padding:5px">
                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                            <tr>
                            <td style="padding:5px" class="text">Re-Password</td>
                            <td style="padding:5px"><asp:TextBox ID="RePassword" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                           
                            </td>
                            <td style="padding:5px">
                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label> 
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:5px">
                                <asp:Label ID="Ret" runat="server"></asp:Label>
                            </td>
                            <td style="padding:5px">
                                <asp:Button Text="Register" runat="server" OnClick="btn_register" CssClass="btn" />
                            </td>
                        </tr>
                        <tr>
                            <td style="padding:15px; font-family: sans-serif; color: black">Already have Account?</td>
                            <td style="padding:15px"><asp:Button Text="Login" CssClass="login-btn" runat="server" OnClick="btn_login"/></td>
                        </tr>
                    </table>
                </div>
             </div>
        </div>
    </form>
</body>
</html>
