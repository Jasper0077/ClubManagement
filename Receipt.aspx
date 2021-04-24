<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Receipt.aspx.cs" Inherits="ClubManagement.Receipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn{
            font-family: "Roboto", sans-serif;
            font-size: 12px;
            background: #808080;
            min-width: 100px;
            margin-left: 450px;
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
    <div style="width:60%; border-radius:25px; height:800px; margin: 40px auto; padding:50px; border:solid black">
        <div style="margin:30px auto; text-align:center; font-size:1.5em">
            <strong><b>Receipt</b></strong>
        </div>
        <div style="width:100%; margin:0 auto; height:250px; ">
            <div>
                 <table style="width:100%; margin:10px auto;  border:solid black;">
                    <tr style="height:50px; width:50%; margin:0 auto; background-color:black; border-radius:25px; border:solid black">
                        <td>
                            <p style="font-size:1.4em; color:white">Payment</p>
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
            </div>
            <div>
                 <table style="width:100%">
                     <tr style="height:50px; margin:0 auto; background-color:black; border-radius:25px; border:solid black">
                        <td>
                            <p style="font-size:1.4em; color:white; text-align:center"><b>Booked Training Class</b></p>
                        </td>
                    </tr>
                    <tr>
                        <asp:GridView ID="TrainingClassList" runat="server" BorderStyle="None" style="text-align:center; height:300px" GridLines="Horizontal" HorizontalAlign="Center" Width="90%" AutoGenerateColumns="false">
                            <Columns>
                                     <asp:BoundField DataField="trainingclassID" HeaderText="Training Class ID" />
                                     <asp:BoundField DataField="trainingclassName" HeaderText="Class Name" />
                                     <asp:BoundField DataField="amount" HeaderText="Price"/>
                                </Columns>
                        </asp:GridView>
                    </tr>
                </table>
            </div>
            <div style="margin-top:400px; display:flex">
                   <asp:Button ID="Confirm" runat="server" Text="Confirm" CssClass="btn" OnClick="Confirm_Click"/>
            </div>
        </div> 
</div>
</asp:Content>
