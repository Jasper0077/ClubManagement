<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ClubManagement.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-view {
            padding: 20px;
            font-size: 1.5em;
            width: 80%;
            min-height: 550px;
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
            min-width: 100px;
            height: 40px;
            padding: 10px;
            margin: 0 auto;
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
            Unpaid Training Class
        </div>  
        <asp:GridView ID="TrainingClassList" runat="server" CssClass="grid-view" HorizontalAlign="Center" allowpaging="true" autogeneratecolumns="false">
            <pagersettings mode="Numeric"
                position="Bottom"           
                pagebuttoncount="10"/>
            <Columns>
                <asp:BoundField DataField="btID" HeaderText="Booking ClassID" />
                <asp:BoundField DataField="className" HeaderText="Class Name"/>
                <asp:BoundField DataField="days" HeaderText="Days"/>
                <asp:BoundField DataField="timeSlot" HeaderText="Time Slot"/>
                <asp:BoundField DataField="status" HeaderText="Status"/>
            </Columns>
        </asp:GridView>
        <div style="margin: 30px auto; width: 40%; height:30px; text-align:center">
            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Make Payment" OnClick="Button1_Click"/>
        </div>
        <div class="title">
            <strong>Payment</strong>
        </div>      
        <asp:GridView ID="PaymentList" runat="server" CssClass="grid-view" HorizontalAlign="Center" allowpaging="true" autogeneratecolumns="false" OnSelectedIndexChanged="PaymentList_SelectedIndexChanged">
            <pagersettings mode="Numeric"
            position="Bottom"           
            pagebuttoncount="10"/>
            <Columns>
                <asp:BoundField DataField="pID" HeaderText="Payment ID" />
                <asp:BoundField DataField="amount" HeaderText="Total Amount"/>
                <asp:TemplateField HeaderText="Payment Details">
                    <ItemTemplate>
                        <asp:LinkButton ID="details" CssClass="btn" runat="server">Details</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>       
</asp:Content>
