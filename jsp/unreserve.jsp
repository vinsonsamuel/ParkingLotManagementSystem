<%@ page import="com.vinson.plms.ParkingDAO" %>
<%
    int slot = Integer.parseInt(request.getParameter("slot"));
    ParkingDAO.unReserveSlot(slot);
    response.sendRedirect("park-management.jsp");
%>