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
        <title>Two Wheeler</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
    <%
        String uname = (String) session.getAttribute("user");
        boolean member = ParkingDAO.memberCheck(uname);
        if(member) {%>
            <a href="member-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <%} else {%>
            <a href="user-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <%}%>
    <a href="2sec-confirmation.jsp"><button class="back">&#8249;</button></a>
    <a href="index.jsp"><button class="logout">LOGOUT</button></a>
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="dd">
                    <h2>TWO-WHEELER PARKING</h2>
                    <%
                        int status = ParkingDAO.twoWheeler();
                        if(status > 0){
                            out.print("<p>Your Slot Number is " + status + ". Kindly check-in and park your vehicle.</p>");
                            out.print("<div class=\"center-button\">" +
                                    "<form action=\"two-checkin.jsp\">\n" + "" +
                                    "<button class=\"cin\"/>CHECK-IN</button>\n" + "" +
                                    "</form>" + "</div>");
                        }
                        else {
                            out.print("<p>Every slots are full. Kindly wait until someone checks-out.</p>");
                        }
                    %>
                </div>
    </body>
</html>
