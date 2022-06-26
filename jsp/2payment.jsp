<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.vinson.plms.*" %>
<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<%
    String ses = (String) session.getAttribute("user");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>Payment</title>
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
        <a href="cout-session.jsp"><button class="back">&#8249;</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <jsp:useBean id="obj" class="com.vinson.plms.ParkingBean"/>
        <jsp:setProperty name="obj" property="*"/>
        <%
            int slot = Integer.parseInt(request.getParameter("slot"));
            String coutTime = request.getParameter("time");
            String cinTime = ParkingDAO.twoCheckinTime(slot);
            ParkingDAO.logFile("Check-Out "+slot + " " + uname + " " + coutTime);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
            Date date1 = null;
            Date date2 = null;
            try {
                date1 = simpleDateFormat.parse(coutTime);
                date2 = simpleDateFormat.parse(cinTime);
            } catch (ParseException e) {
                System.out.println(e);
            }
            assert date2 != null;
            long milliSeconds = Math.abs(date2.getTime() - date1.getTime());
            long hours = (milliSeconds / (60 * 60 * 1000)) % 24;
            long minutes = (milliSeconds / (60 * 1000)) % 60;
            float amount = ((((float)(hours)*60) + (float)minutes)/60)*10;
            int status = ParkingDAO.twoPayment(obj);
            if(status>0){%>
                <h2>Payment Information</h2>
                <div>
                    <p>Total Parking Time - <%=hours%>hrs <%=minutes%>mins</p>
                    <p>Amount to Pay (in rupees) - <%="\u20B9"+(int)amount%></p>
                    <p>Thank-you for Parking</p>
                </div>
            <%} else{
                out.print("CheckOut Failed");
        }%>
    </body>
</html>