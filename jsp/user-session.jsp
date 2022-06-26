<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("user");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>User Session</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <a href="#"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
    <%
        String str = (String) session.getAttribute("user");
        String user="";
        if (str!=null){
            char c = str.charAt(0);
            user = Character.toString(c).toUpperCase(Locale.ROOT) + str.substring(1);
        }
    %>
        <h2>Welcome <%=user%> !!!</h2>
        <p>Choose an option to continue using the application</p>
        <div style="margin-left: auto; margin-right: auto; padding-top: 20px;">
            <a href="cin-session.jsp"><button style="margin-right: 5px;" class="cin">CHECK-IN</button></a>
            <a href="cout-session.jsp"><button style="margin-left: 5px;" class="cin">CHECK-OUT</button></a>
        </div>
        <%
            String uname = (String) session.getAttribute("user");
            boolean req = ParkingDAO.requestCheck(uname);
            if (req){%>
                <div style="margin-top: 100px;">
                    <h2>Upgrade to Pro</h2>
                    <p>Your request have been sent to the security, kindly wait until then.</p>
                </div>
            <%} else {%>
                <div style="margin-top: 100px;">
                    <h2>Upgrade to Pro</h2>
                    <p>Request Security to become a Member and get access to Membership features</p>
                </div>
                <div style="margin-left: auto; margin-right: auto; padding-top: 20px;">
                    <a href="request.jsp?uname=<%=uname%>"><button style="margin-right: 5px;" class="cin">REQUEST</button></a>
                </div>
            <%}
        %>

    </body>
</html>
