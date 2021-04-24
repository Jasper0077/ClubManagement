<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ClubManagement.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-view {
            padding: 0px;
            font-size: 1em;
            min-width: 100%;
            min-height: 100px;
            margin: 0 auto;
            letter-spacing: 1px;
            text-align:center;
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
    <div style="width:80%; border-radius:25px; margin: 40px auto; padding:50px; border:solid black">
        <div style="width:100%; height:120px">
            <div style="width:50%; height:100%; float:left; font-size:2.0em">
                <p>Checkout</p>
            </div>
            <div style="width:50%; height:100%; float:right">
                <p style="font-size:1.8em">Your Booking Summary</p>
                <table style="width:100%">
                    <tr style="font-size:1.4em">
                        <td>Booking Fee (RM):</td>
                        <td>
                            <asp:Label ID="TotalAmount" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <div>
                                <asp:Button style="height:40px; width:100px; float:right; border-radius: 10px; border: 2px solid black; cursor:pointer; background-color:black; color:white; font-size:1.2em" ID="Pay" runat="server" Text="Pay" OnClick="Pay_Click"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="width:100%; margin:0 auto;">
            <table style="width:100%; margin:10px auto;  border:solid black;">
                <tr style="height:50px; width:50%; margin:0 auto; background-color:black; border-radius:25px; border:solid black">
                    <td>
                        <p style="font-size:1.4em; padding-left: 15px; color:white"><b>Your Training Class Booking</b></p>
                    </td>
                    <td>
                        <table style="width:50%; float:right">
                            <tr style="height:50px; ">
                                <td style="color:white; width:70%">
                                    PRICE (RM):
                                </td>
                                <td>
                                    <asp:Label style="color:white" ID="Price" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                 <tr style="height:150px;">
                    <td style="text-align:left; padding:20px"">
                        <p style="height:30px;font-size:1.3em"><b>User Information</b></p>
                        <p style="height:30px; font-size:1.2em">Name: <asp:Label ID="Name" runat="server" Text=""></asp:Label></p>
                        <p style="height:30px; font-size:1.2em">Phone: <asp:Label ID="Phone" runat="server" Text=""></asp:Label></p>
                        <p style="height:30px; font-size:1.2em">Address: <asp:Label ID="Address" runat="server" Text=""></asp:Label></p>
                    </td>
                </tr>
            </table>
            <table style="width:100%">
                 <tr style="height:50px; margin:0 auto; background-color:black; border-radius:25px; border:solid black">
                    <td>
                        <p style="font-size:1.4em; color:white; text-align:center"><b>Booked Training Class</b></p>
                    </td>
                </tr>
                <tr>
                    <asp:GridView ID="TrainingClassList" runat="server" CssClass="grid-view" AutoGenerateColumns="false" CellPadding="3" CellSpacing="2">
                        <Columns>
                            <asp:BoundField DataField="btID" HeaderText="Booking ClassID" />
                            <asp:BoundField DataField="className" HeaderText="Class Name" />
                            <asp:BoundField DataField="price" HeaderText="Price"/>
                        </Columns>
                    </asp:GridView>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
