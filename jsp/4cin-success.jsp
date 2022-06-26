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
    <title>CHECK-IN</title>
</head>
<body>
<jsp:useBean id="obj" class="com.vinson.plms.ParkingBean"/>
<jsp:setProperty name="obj" property="*"/>
<%
    String uname = (String) session.getAttribute("user");
    int status = ParkingDAO.fourCheckin(obj, uname);
    if(status>0){
        ParkingDAO.logFile("Check-In "+obj.getSlot() + " " + uname + " " + obj.getTime());
        String site = "four-checkout.jsp";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
    else{
        out.print("Check-In Failed Please Check Your Credentials");
    }
%>
</body>
</html>
