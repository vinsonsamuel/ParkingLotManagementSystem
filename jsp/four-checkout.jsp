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
        <title>CHECK-OUT</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
    <%
        String uname = (String) session.getAttribute("user");
        boolean status = ParkingDAO.memberCheck(uname);
        if(status) {%>
            <a href="member-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <%} else {%>
            <a href="user-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <%}%>
        <a href="fourwheeler.jsp"><button class="back">&#8249;</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <h2>You're currently Checked-In</h2>
        <div class="center-button">
            <form action="4cout-success.jsp">
                <button class="cout">CHECK-OUT</button>
            </form>
        </div>
    </body>
</html>
