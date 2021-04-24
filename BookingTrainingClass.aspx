<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingTrainingClass.aspx.cs" Inherits="ClubManagement.BookingTrainingClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .grid-view {
            padding: 10px;
            font-size: 1.5em;
            width: 80%;
            min-height: 450px; 
            margin-top: 20px;
            margin-bottom: 20px;
            letter-spacing: 1px;
            text-align:center;
            margin-left: 150px;
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
        .table-menu {
           margin-left: 350px;
           width: 100%;
           padding: 10px;
           margin-top: 20px;
           text-align: center;

        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content">
        <div class="title">
            Training Class
        </div>
        <asp:Menu ID="Menu1" HorizontolAlign="Center" runat="server"  CssClass="table-menu" Orientation="Horizontal" StaticEnableDefaultPopOutImage="False" OnMenuItemClick="Menu1_MenuItemClick">
            <StaticMenuItemStyle BorderWidth="2px" ItemSpacing="10px" BorderColor="Black" BorderStyle="Solid" HorizontalPadding="30px" BackColor="White" VerticalPadding="10px" Font-Size="Large" />
            <StaticSelectedStyle BorderWidth="2px" ItemSpacing="10px" BorderColor="Black" BorderStyle="Solid" HorizontalPadding="30px" VerticalPadding="10px" BackColor="#555555" ForeColor="White" Font-Size="Large" />
            <Items>
                <asp:MenuItem Text="Monday" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="Tuesday" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="Wednesday" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="Thursday" Value="3"></asp:MenuItem>
                <asp:MenuItem Text="Friday" Value="4"></asp:MenuItem>
                <asp:MenuItem Text="Saturday" Value="5"></asp:MenuItem>
                <asp:MenuItem Text="Sunday" Value="6"></asp:MenuItem>
                
            </Items>
        </asp:Menu>
        <asp:MultiView ID="mvBookingTrainingClass" runat="server" ActiveViewIndex="0">
            <asp:View ID="Monday" runat="server">
                <asp:GridView ID="GridView1" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="Book" runat="server" CssClass="btn" Text="Book" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                 </asp:GridView>           
            </asp:View>
            <asp:View ID="Tuesday" runat="server">
                <asp:GridView  ID="GridView2" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView2_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="book" runat="server" Text="Book"  CssClass="btn" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
             <asp:View ID="Wednesday" runat="server">
                <asp:GridView  ID="GridView3" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView3_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="book" runat="server" Text="Book" CssClass="btn" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
             <asp:View ID="Thursday" runat="server">
                <asp:GridView  ID="GridView4" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView4_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="book" runat="server" Text="Book" CssClass="btn" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
             <asp:View ID="Friday" runat="server">
                <asp:GridView  ID="GridView5" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView5_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="book" runat="server" Text="Book" CssClass="btn" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
             <asp:View ID="Saturday" runat="server">
                <asp:GridView  ID="GridView6" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView6_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="book" runat="server" Text="Book" CssClass="btn" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
             <asp:View ID="Sunday" runat="server">
                <asp:GridView  ID="GridView7" runat="server" CssClass="grid-view" HorizontalAlign="Center" AutoGenerateColumns="false" OnRowCommand="GridView7_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="className" HeaderText="Class Name"/>
                        <asp:BoundField DataField="name" HeaderText="Tutor Name"/>
                        <asp:BoundField DataField="timeSlot" HeaderText="Time"/>
                        <asp:BoundField DataField="price" HeaderText="Price"/>
                        <asp:TemplateField HeaderText="Booking">
                            <ItemTemplate>
                                <asp:Button ID="book" runat="server" Text="Book" CssClass="btn" CommandName="Book" CommandArgument='<%# Eval("tcID") + ","+Eval("timeSlot") + ","+Eval("days")%>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
        <div style="margin:30px auto;width:100px">
            <asp:Label ID="Label1" runat="server" Text="" style="margin:0 auto; text-align:center"></asp:Label>
        </div>
         <div class="content">
        <div class="title">
            Booked Training Class
        </div>

            <asp:GridView ID="TrainingClassList" runat="server" GridLines="Horizontal" CssClass="grid-view"></asp:GridView>

        <div style="margin: 50px auto; width: 100%; text-align:center">
            <asp:Button ID="Button2" runat="server" Text="Edit Booked Training Class" CssClass="btn" OnClick="btnEditBookedTrainingClass_Click"/>
        </div>
    </div>
    </div>
</asp:Content>
