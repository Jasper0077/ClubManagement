<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBookedFacilities.aspx.cs" Inherits="ClubManagement.EditBookedFacilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .title {
            text-align:center; 
            font-size:2em; 
            font-weight:900; 
            padding:30px; 
            color: black;
            border-bottom: 2px solid black;
        }
        .content-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 1.5em;
            min-width: 400px;
            border: 2px solid black;
            border-radius: 10px;
        }
        .content-table th,
        .content-table td {
            padding: 12px 15px;

        }
        .content-table tr {
            border-bottom: 1px solid #dddddd;

        }
        .content-table tr:nth-of-type(even) {
            background-color: #f3f3f3;
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
        .list-box {
            font-size: 2em;
            font-family: sans-serif;
            word-spacing: 3px;
            border-radius: 3px;
            margin: 20px;
            padding: 10px;
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
    </style>

    <div class="title">
        Edit Booked Facilities
    </div>

    <table style="width:100%; margin-bottom: 50px">
        <tr>
            <td style="width:50%">
                <asp:ListBox ID="ListBox1" CssClass="list-box" runat="server" AutoPostBack="true" Height="340px" Width="665px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
            </td>
            <td style="width:50%; vertical-align:top; font-size:1.2em;">
                <table class="content-table">
                    <tr>
                        <td>Username</td>
                        <td>
                            <asp:Label ID="Username" runat="server" Text="-"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Facility</td>
                        <td>
                            <asp:Label ID="Facility" runat="server" Text="-"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Day</td>
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
                    </tr>
                    <tr>
                        <td>Time Slot</td>
                        <td>
                            <asp:DropDownList ID="TimeSlotDropDown"  runat="server" CssClass="drop-down-box">
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
                        <td>
                            <asp:Button ID="BtnEditBookedFacility" runat="server" class="btn" Text="Confirm Edit" OnClick="BtnEditBookedFacility_Click" />
                        </td>
                        <td>
                            <asp:Button ID="BtnDeleteBookedFacility" runat="server" class="btn" Text="Delete" OnClick="BtnDeleteBookedFacility_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
