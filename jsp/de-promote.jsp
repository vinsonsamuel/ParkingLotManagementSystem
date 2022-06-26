<%@ page import="com.vinson.plms.ParkingDAO" %>
<%
    String uname = request.getParameter("uname");
    ParkingDAO.dePromote(uname);
    response.sendRedirect("member-management.jsp");
%>