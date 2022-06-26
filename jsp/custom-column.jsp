<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String arr[] = new String[4];
    arr[0] = request.getParameter("activity");
    arr[1] = request.getParameter("slot");
    arr[2] = request.getParameter("uname");
    arr[3]= request.getParameter("time");
    session.setAttribute("array", arr);
    response.sendRedirect("security-log.jsp");
%>