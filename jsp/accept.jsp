<%@ page import="com.vinson.plms.ParkingDAO" %>
<%
    String uname = request.getParameter("uname");
    ParkingDAO.acceptRequest(uname);
    response.sendRedirect("member-management.jsp");
%>