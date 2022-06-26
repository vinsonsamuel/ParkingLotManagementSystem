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
      <title>Auto-Park</title>
      <link rel="stylesheet" href="css/style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>
    <a href="member-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
    <a href="auto-park.jsp"><button class="back">&#8249;</button></a>
    <a href="index.jsp"><button class="logout">LOGOUT</button></a>
  <%
      String vehType = request.getParameter("wheel");
      String floor = request.getParameter("floor");
      String uname = (String) session.getAttribute("user");
      int slot = ParkingDAO.autoPark(vehType, floor, uname);
      if (slot>0){
          ParkingDAO.logFile("Check-In "+ slot + " " + uname + " " + ParkingDAO.currentTime());
  %>
            <h2>Check-In Details</h2>
            <p>Your vehicle have been parked successfully on Slot: <%=slot%></p>
            <%
                String vehicle = ParkingDAO.vehicleType(slot);
                if (vehicle.equals("two")){%>
                      <a href="2cout-success.jsp"><button style="margin-left: 700px; margin-top: 20px;" class="cout">CHECK-OUT</button></a>
                <%} else{%>
                        <a href="4cout-success.jsp"><button style="margin-left: 700px; margin-top: 20px;" class="cout">CHECK-OUT</button></a>
                <%}
      } else{%>
            <p>Every slots are full kindly wait until someone checks-out.</p>
      <%}%>
  </body>
</html>
