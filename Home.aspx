<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ClubManagement.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .banner {
            width: 100%;
            height: 120vh;
            background-size: cover;
            background-position: center;
            background-image: linear-gradient(rgba(15,25,35,0.35), rgba(15,25,35,0.35)), url(gym.jpg);
        }
        .content {
            width: 100%;
        }
         h1 {
            font-size: 50px;
            padding-top: 50px;
            color: #fff;

        }
        p {
            font-weight: 200;
            line-height: 15px;
            font-size: 18px;
            color: white;
        }
        .col {
            flex-basis: 50%;
            margin-top: 300px;
            margin-left: 50px;
        }
        .row {
            display: flex;
            height:88%;
            align-items: center;
        }
        .btn{
            font-family: "Roboto", sans-serif;
            font-size: 12px;
            background: #80c0e0;
            min-width: 120px;
            margin-top: 35px;
            padding: 15px;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            color: #fff;
            border: none;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            cursor: pointer;
        }
        .card1{
            width: 300px;
            height: 400px;
            display: inline-grid;
            border-radius: 10px;
            padding: 15px 25px;
            box-sizing: border-box;
            cursor: pointer;
            margin: 15px 15px;
            background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url(facility.jpg);
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1);
            background-position: center;
            background-size: cover;
            transition: transform 0.5s;
        }
        .card2{
            width: 300px;
            height: 400px;
            border-radius: 10px;
            display: inline-grid;
            padding: 15px 25px;
            box-sizing: border-box;
            cursor: pointer;
            margin: 15px 15px;
            background-image: linear-gradient(rgba(0,0,0,0.25), rgba(0,0,0,0.25)), url(training-class.jpg);
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1);
            background-position: center;
            background-size: cover;
            transition: transform 0.5s;
        }
        
        .card1:hover{
            transform:translateY(-10px)
        }
        .card2:hover{
            transform:translateY(-10px)
        }
        h3 {
            color: #fff;
            font-size: 22px;
            text-shadow: 0 0 5px #999;
        }
        a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="banner">
        <div class="content">
            <div class="row">
                <div class="col">
                    <h1>Welcome to Club One</h1>
                    <p>Here, you can check on our facilities and make your booking.
                        <br /><br />Click here to book facilities and training class.
                    </p>
                    <button class="btn">Contact us</button>
                </div>

                <div class="col">
                    <a href="Facility.aspx">
                        <div class="card1">
                            <h3>Book Facilities</h3>
                            <p style="margin-top: -30px">Check our facilities here.</p> 
                        </div>
                    </a>
                    <a href="TrainingClass.aspx">
                        <div class="card2">
                            <h3>Book Training Class</h3>
                            <p style="margin-top: -30px">Check our training class and make your booking.</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>    
</asp:Content>
