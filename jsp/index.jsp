<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Parking Lot System</title>
        <style>
            body {background-image: url("Images/home.jpg");}
            h1{text-align: center; font-family: Arial, Helvetica, sans-serif; color: aliceblue; background-color: black;}
            button {background-color: azure; border-radius: 12px; color: black; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; cursor: pointer;}
            .container {height: 400px; position: relative;}
            .center {margin: 0; position: absolute; top: 50%; left: 50%; -ms-transform: translate(-50%, -50%); transform: translate(-50%, -50%);}
        </style>
    </head>
    <body>
        <h1>PARKING LOT MANAGEMENT SYSTEM</h1>
        <div class="container">
            <div class="center">
                <a href="login.jsp"><button>LOGIN TO PARK</button></a>
                <a href="security-login.jsp"><button>SECURITY LOGIN</button></a>
            </div>
        </div>
    </body>
</html>