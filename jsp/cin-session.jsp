<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("user");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>Session</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            div {text-align: justify;}
            div img {display: inline-block; width: 500px; height: 500px; padding: 20px;}
            div:after {content: ''; display: inline-block; width: 100%;}
        </style>
    </head>
    <body>
        <%
            String uname = (String) session.getAttribute("user");
            boolean status = ParkingDAO.memberCheck(uname);
            if(status) {%>
                <a href="member-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
                <a href="member-session.jsp"><button class="back">&#8249;</button></a>
            <%} else {%>
                <a href="user-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
                <a href="user-session.jsp"><button class="back">&#8249;</button></a>
            <%}%>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <h2>Choose Your Vehicle Type</h2>
        <div>
            <a href="2sec-confirmation.jsp"><img src="Images/2wheeler.jpg" alt=""  /></a>
            <a href="4sec-confirmation.jsp"><img src="Images/4wheeler.jpg" alt="" /></a>
        </div>
    </body>
</html>
