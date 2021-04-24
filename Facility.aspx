<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facility.aspx.cs" Inherits="ClubManagement.Facility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        h2 {
            margin: 20px;
            font-size:16px;
            font-family: sans-serif;
            font-weight:200;
            text-align:center;
            color: rgb(128, 128, 128);
        }
        p {
            margin: 20px;
            text-align: left;
            font-family: sans-serif;
            color: rgb(128, 128, 128);
            text-align:center;
        }
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
            font-size: 1.2em;
            margin-left: 100px;
            margin-bottom: 20px;
            width: 30%;
            position:relative;
            left:30px;
            border: 2px solid black;
            border-radius: 10px;
            display: none;
        }
        .content-table th,
        .content-table td {
            padding: 8px 10px;

        }
        .content-table tr {
            border: none;

        }
        .input {
            width: 80%;
            padding: 0 5px;
            height: 40px;
            font-size: 12px;
            background: white;
            outline: none;
            margin-right: 20px;
            border: 2px solid #808080;
            border-radius: 5px;
        }
        .drop-down-box {
            min-width: 160px;
            font-size: 12px;
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
        .card {
            display: grid;
            grid-template-columns: 240px;
            grid-template-rows: 160px 160px 100px;
            grid-template-areas: "image" "text" "button";

            font-family: sans-serif;
            border-radius: 10px;
            background: white;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.9);
            text-align: center;
        }
        .card:hover {
            transform: scale(1.1);
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.6);
        }
        .card-image {
            grid-area: image;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background-color:#808080;
            padding-top:20px;
            background-size: cover;

        }
        .card-text {
            grid-area: text;
            margin: 25px;
            font-size: 25px;
        }
        .card-button {
            grid-area: button;
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
       <table class="content-table">
           <tr>
               <td>
                   <h3>Image Upload</h3>
               </td>
               <td>
                   <asp:DropDownList ID="ddlFacility" runat="server" CssClass="drop-down-box"></asp:DropDownList>
               </td>
           </tr>
           <tr>
               <td>
                   <asp:Label ID="Filename" runat="server" Text="Label"></asp:Label>
               </td>
               <td>
                   <asp:FileUpload ID="FileUpload" runat="server"  CssClass="input" />
               </td>
           </tr>
           <tr>
               <td></td>
               <td>
                   <asp:Button ID="btnUpload" runat="server" Text="Button" OnClick="btnUpload_Click" CssClass="card-button" />
               </td>
           </tr>
       </table>
    </div>
    <div>
        <div class="title">Facility Page</div>
        <h2>These are the facilities that are available for this week. Kindly click on the button below to check for the time slot.</h2>
        <asp:DataList ID="DataList1" runat="server" CellPadding="10" CellSpacing="10" HorizontalAlign="Center" RepeatColumns="5" RepeatDirection="Horizontal" Height="200px" Width="800px" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="card">
                    <div class="card-image">
                            <image src="image/<%#Eval("imageName") %>" height="120" width="150" />
                    </div>
                    <div class="card-text">
                        <strong><%# Eval("fName") %></strong>
                    </div>
                    <div>
                            <asp:Button ID="Button1" runat="server" Text="Click to Book" CommandName="bookFacilities" CommandArgument='<%#Eval("fName") %>' CssClass="card-button" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <p>If you have any question, please contact us. The contact number is provided in the footer below.</p>
    </div>
</asp:Content>
