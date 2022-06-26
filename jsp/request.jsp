<%@ page import="com.vinson.plms.ParkingDAO" %>
<%
  String uname = request.getParameter("uname");
  ParkingDAO.sendRequest(uname);
  response.sendRedirect("user-session.jsp");
%>