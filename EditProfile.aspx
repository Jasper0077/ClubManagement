<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="ClubManagement.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .content-table {
            border-collapse: collapse;
            font-size: 1.5em;
            margin-left: 200px;
            margin-bottom: 20px;
            width: 80%;
            border-radius: 10px;
        }
        .content-table th,
        .content-table td {
            padding: 12px 15px;

        }
        .content-table tr {
            border: none;

        }
        .drop-down-box {
            min-width: 160px;
            font-size: 14px;
            border-radius: 5px;
            padding: 10px;
        }
        .drop-down-box select {
            height: 45px;
            padding: 10px 15px;
            line-height: 22px;
            font-size: 16px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .drop-down-box:after {
            content: "";
            position: absolute;
            right: 8px;
            top:50%;
            margin-top: -4px;
            border-top: 8px solid #ccc;
            border-left: 6px solid transparent;
            border-right: 6px solid transparent;
            pointer-events: none;
        }
        .drop-down-box select:focus {
            border: 2px solid #808080;
        }
        .input {
            width: 100%;
            padding: 0 5px;
            height: 40px;
            font-size: 16px;
            background: white;
            outline: none;
            border: 2px solid #808080;
        }
        .text {
            font-size: 18px;
            font-family: sans-serif;
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
        }
        .title {
            text-align:center; 
            font-size:2em; 
            font-weight:900; 
            padding:20px; 
            border-bottom:2px solid black;
        }
    </style>
    <div class="content">
        <div class="title">
            Profile Page
        </div>
        <table class="content-table">
            <tr>
                <td>Username</td>
                <td>
                    <asp:Label ID="Username" runat="server" Text="Label" CssClass="text"></asp:Label>
                </td>
                <td>Age</td>
                <td>
                    <asp:TextBox ID="Age"  runat="server" CssClass="input"></asp:TextBox>
                </td>
                <td width="50px">Gender: </td>
                <td>
                    <asp:DropDownList ID="GenderDropDown" CssClass="drop-down-box" runat="server">
                         <asp:ListItem Value="Male">Male</asp:ListItem>
                         <asp:ListItem Value="Female">Female</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>First Name</td>
                <td>
                    <asp:TextBox ID="FirstName" runat="server" CssClass="input"></asp:TextBox>
                </td>
                <td>Last Name</td>
                <td class="auto-style2">
                   <asp:TextBox ID="LastName" runat="server" CssClass="input"></asp:TextBox>
                </td>
            <tr>
                <td>Email</td>
                <td>
                    <asp:TextBox ID="Email" runat="server" CssClass="input"></asp:TextBox>
                </td>
                 <td>Phone</td>
                <td>
                    <asp:TextBox ID="Phone" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Occupation</td>
                <td>
                    <asp:TextBox ID="Occupation" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td>
                    <asp:TextBox ID="Address" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="btnConfirmEdit" runat="server" CssClass="btn" Text="Confirm Edit" OnClick="btnConfirmEdit_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
