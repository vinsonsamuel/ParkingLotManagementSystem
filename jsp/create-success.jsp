<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Parking Lot</title>
</head>
<body>
<jsp:useBean id="obj" class="com.vinson.plms.ParkingBean"/>
<jsp:setProperty name="obj" property="*"/>
<%
    int status = ParkingDAO.registerUser(obj);
    if(status>0){
        String site = "login.jsp";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
    else{
        out.print("Register Failed Please Check Your Credentials");
    }
%>
</body>
</html>
