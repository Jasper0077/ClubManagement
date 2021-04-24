<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBookedTrainingClass.aspx.cs" Inherits="ClubManagement.EditBookedTrainingClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-view {
            padding: 15px;
            font-size: 1.5em;
            width: 80%;
            min-height: 400px; 
            margin-top: 20px;
            margin-bottom: 20px;
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
    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">    
        <div class="title">
            Booked Training Class
        </div>
        <asp:GridView ID="GridView1" runat="server" BorderStyle="None" CssClass="grid-view" AutoGenerateColumns="false" OnRowDeleting="GridView1_RowDeleting" HorizontalAlign="Center" DataKeyNames="btID">
            <Columns>
                    <asp:BoundField DataField="btID" HeaderText="ID" />
                    <asp:BoundField DataField="className" HeaderText="Class Name"/>
                    <asp:BoundField DataField="days" HeaderText="Days"/>
                    <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                    <asp:BoundField DataField="status" HeaderText="Status"/>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="delete" runat="server" CssClass="btn" Text="Delete" CommandName="Delete"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
        </asp:GridView>
    </div>
</asp:Content>
