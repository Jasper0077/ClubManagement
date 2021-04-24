<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrainingClass.aspx.cs" Inherits="ClubManagement.TrainingClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
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
        .card {
            display: grid;
            grid-template-columns: 240px;
            grid-template-rows: 200px 40px 40px 40px 40px;
            grid-template-areas: "image" "name" "exp" "email" "phone";
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

            font-family: sans-serif;
            border-radius: 10px;
            background: white;
            text-align: center;
        }
        .card-image {
            grid-area: image;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            background-color:#a0a0c0;
            background-size: cover;

        }
        .card-name {
            grid-area: name;
            margin: 15px;
            font-size: 18px;
        }
        .card-email {
            grid-area: email;
            margin: 15px;
            font-size: 14px;
            color: #a0a0c0;
        }
        .card-phone {
            grid-area: phone;
            margin: 15px;
            font-size: 14px;
            color: #a0a0c0;
        }
        .card-exp {
            grid-area: exp;
            margin: 15px;
            font-size: 14px;
            color: #a0a0c0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
     <div style="margin: 20px 0 20px 0">
        <div class="title">
               Training Class
        </div>
        <asp:DataList ID="dlTrainingClass" runat="server" CellPadding="10" CellSpacing="10" HorizontalAlign="Center" RepeatColumns="5" RepeatDirection="Horizontal" Height="200px" Width="800px">
            <ItemTemplate>
                <div class="card">
                    <div class="card-image">
                            <image src="training-class.jpg" height="200" width="240" />
                    </div>
                    <div class="card-name">
                        <strong><%# Eval("className") %></strong>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <div style="margin: 30px auto; width: 100%; text-align:center">
            <asp:Button ID="BookTrainingClass" CssClass="btn" runat="server" Text="Book Training Class" OnClick="BookingTrainingClass_Click" />
        </div>
               
            <div class="title">
               Tutor Information
            </div>
            <asp:DataList ID="dlTutor" runat="server"  CellPadding="10" CellSpacing="10" HorizontalAlign="Center" RepeatColumns="5" RepeatDirection="Horizontal" Height="200px" Width="800px">
            <ItemTemplate>
                <div class="card">
                    <div class="card-image">
                        <image src="nabi.jpg" height="200" width="240"></image>
                    </div>
                    <div class="card-name">
                        <%# Eval("name") %>
                    </div>
                    <div class="card-exp">
                        Experience: <%# Eval("experience") %>
                    </div>
                    <div class="card-email">
                        Email: <%# Eval("email") %>
                    </div>
                    <div class="card-phone">
                        Phone: <%# Eval("phone") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
