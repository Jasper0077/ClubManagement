<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookFacilities.aspx.cs" Inherits="ClubManagement.BookFacilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .title {
            text-align:center; 
            font-size:2em; 
            font-weight:900; 
            padding:20px;
            color: black;
            border-bottom: 2px solid black;
        }
        .content-table {
            border-collapse: collapse;
            font-size: 16px;
            margin-left: 350px;
            margin-bottom: 20px;
            margin-top: 20px;
            width: 60%;
            left:30px;
            border: 2px solid black;
            border-radius: 10px;
        }
        .content-table th,
        .content-table td {
            padding: 8px 10px;
            font-weight: 600;
            font-size: 18px;

        }
        .content-table tr {
            border: none;

        }
        .input {
            width: 100%;
            padding: 0 5px;
            height: 40px;
            font-size: 16px;
            background: white;
            outline: none;
            margin-right: 20px;
            border: 2px solid #808080;
            border-radius: 5px;
        }
        .drop-down-box {
            min-width: 160px;
            font-size: 16px;
            border-radius: 5px;
            padding: 10px;
        }
        .drop-down-box select {
            height: 45px;
            padding: 10px 15px;
            line-height: 22px;
            font-size: 12px;
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
        .text {
            font-size: 18px;
            font-weight:300;
            font-family: sans-serif;
        }
        .btn {
            grid-area: button;
            font-family: "Roboto", sans-serif;
            font-size: 16px;
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin:0 auto; width:100%">
        <div class="title">
            Book Facilities
        </div>
        <table class="content-table";>
            <tr>
                <td>Username : </td>
                <td class="auto-style1">
                    <asp:Label ID="Username" runat="server" Text="Label" CssClass="text"></asp:Label>
                </td>
                <td>Facility : </td>
                <td class="auto-style1">
                    <asp:Label ID="facilityName" runat="server" Text="Label" CssClass="text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>Day : </td>
                <td>
                    <asp:DropDownList ID="DaysDropDown" runat="server" CssClass="drop-down-box">
                        <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                        <asp:ListItem Value="Monday">Monday</asp:ListItem>
                        <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                        <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                        <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                        <asp:ListItem Value="Friday">Friday</asp:ListItem>
                        <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>Time Slot : </td>
                <td>
                    <asp:DropDownList ID="TimeSlotDropDown" runat="server" CssClass="drop-down-box">
                        <asp:ListItem Value="08:00 to 10:00">08:00 to 10:00</asp:ListItem>
                        <asp:ListItem Value="10:00 to 12:00">10:00 to 12:00</asp:ListItem>
                        <asp:ListItem Value="12:00 to 14:00">12:00 to 14:00</asp:ListItem>
                        <asp:ListItem Value="14:00 to 16:00">14:00 to 16:00</asp:ListItem>
                        <asp:ListItem Value="16:00 to 18:00">16:00 to 18:00</asp:ListItem>
                        <asp:ListItem Value="18:00 to 20:00">18:00 to 20:00</asp:ListItem>
                        <asp:ListItem Value="20:00 to 22:00">20:00 to 22:00</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="chkConfirm" runat="server" Text="I agree with the terms and conditions." />
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn" /> 
                </td>
                <td>
                    <asp:Label ID="Result" runat="server" ForeColor="Red" CssClass="text"></asp:Label>
                </td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
