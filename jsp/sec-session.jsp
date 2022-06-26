<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("security");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>Security Session</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .home {position:fixed;left:10px;top:5px;background-color: dodgerblue;color: #FFFFFF;border: none;padding: 10px;cursor: pointer;}
        </style>
    </head>
    <body>
        <a href="sec-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <h2>Welcome Parking Security</h2>
        <p>Choose an option to continue using the application</p>
        <div style="margin-left: auto; margin-right: auto; padding-top: 20px;">
            <a href="park-management.jsp"><button style="margin-right: 5px;" class="cin">PARK-MANAGEMENT</button></a>
            <a href="member-management.jsp"><button style="margin-left: 5px;" class="cin">MEMBER-MANAGEMENT</button></a>
        </div>
    </body>
</html>