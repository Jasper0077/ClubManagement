<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="ClubManagement.ProfilePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
        .content-table {
            border-collapse: collapse;
            font-size: 1.5em;
            margin-left: 350px;
            margin-bottom: 20px;
            margin-top: 20px;
            width: 60%;
            border-radius: 10px;
            border: 2px solid #a0a0a0;
        }
        .content-table th,
        .content-table td {
            padding: 15px 12px;

        }
        .content-table tr {
            border: none;
            background: #eee;

        }
         .content-table tr:nth-of-type(even) {
            background-color: white;
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
            min-width: 120px;
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
        .grid-view {
            padding: 15px;
            font-size: 1.5em;
            width: 80%;
            min-height: 600px; 
            margin-top: 50px;
            letter-spacing: 1px;
            text-align:center;
            margin-left: 200px;
            background: #d5d5d5;

        }
        .grid-view tr:nth-of-type(even) {
            background-color: white;
        }
        .grid-view tr:nth-of-type(1) {
            background-color: #808080;
            color: white;
            font-size:1.2em;
        }
        .title {
            text-align:center; 
            font-size:2em; 
            font-weight:900; 
            padding:30px; 
            color: black;
            border-bottom: 2px solid black;
        }
        i {
            margin: 10px;
            padding: 10px;
            color: #a0a0a0;
        }
        .auto-style1 {
            max-width: 80px;
        }
        .auto-style2 {
            max-width: 80px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div class="title">
            Profile Page
        </div>
        <table class="content-table">
            <tr>
                <td class="auto-style1"><i class="fa fa-user fa-2x"></i><strong> : </strong></td>
                <td>
                    <asp:Label ID="Username" runat="server" Text="Label" CssClass="text"></asp:Label>
                </td>
                <td class="auto-style2"><strong>Age:</strong></td>
                <td>
                    <asp:Label ID="Age" runat="server" CssClass="text"></asp:Label>
                </td>
                <td><i class="fa fa-venus-mars fa-2x"></i><strong> : </strong></td>
                <td>
                    <asp:Label ID="Gender" runat="server" CssClass="text"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1"><strong>First Name:</strong></td>
                <td>
                    <asp:Label ID="FirstName" runat="server" CssClass="text"></asp:Label>
                </td>
                <td class="auto-style2"><strong>Last Name:</strong></td>
                <td>
                   <asp:Label ID="LastName" runat="server" CssClass="text"></asp:Label>
                </td>
                <td></td>
                <td></td>
            <tr>
                <td class="auto-style1"><i class="fa fa-envelope fa-2x"></i><strong> : </strong></td>
                <td>
                    <asp:Label ID="Email" runat="server" CssClass="text"></asp:Label>
                </td>
                 <td class="auto-style2"><i class="fa fa-phone fa-2x"></i><strong> : </strong></td>
                <td>
                    <asp:Label ID="Phone" runat="server" CssClass="text"></asp:Label>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style1"><i class="fa fa-briefcase fa-2x"></i><strong> : </strong></td>
                <td>
                    <asp:Label ID="Occupation" runat="server" CssClass="text"></asp:Label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style1"><i class="fa fa-map-marker fa-2x"></i><strong> : </strong></td>
                <td>
                    <asp:Label ID="Address" runat="server" CssClass="text"></asp:Label>
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
        <div style="margin: 50px auto; width:800px; text-align:center">
            <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" CssClass="btn" OnClick="btnEditProfile_Click" />
        </div>
    </div>

    <div class="content">
        <div class="title">
            Booked Facilities
        </div>
            <asp:GridView CssClass="grid-view" ID="FacilitiesList" runat="server" BorderStyle="None" HorizontalAlign="Center"></asp:GridView>
        <div style="margin: 50px auto; width: 800px; text-align:center">
            <asp:Button ID="btnEditBookedFacilities" runat="server" Text="Edit Booked Facilities" CssClass="btn" OnClick="btnEditBookedFacilities_Click"/>
        </div>
    </div>

     <div class="content">
        <div class="title">
            Booked Training Class
        </div>
            <asp:GridView ID="TrainingClassList" runat="server" CssClass="grid-view" BorderStyle="None" HorizontalAlign="Center"></asp:GridView>
        <div style="margin: 50px auto; width: 800px; text-align:center">
            <asp:Button ID="Button2" runat="server" Text="Edit Booked Training Class" CssClass="btn" OnClick="btnEditBookedTrainingClass_Click"/>
        </div>
    </div>
</asp:Content>
