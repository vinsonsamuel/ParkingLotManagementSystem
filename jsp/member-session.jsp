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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>body{background-image: url("Images/member.jpg"); color: #FFFFFF;}</style>
    </head>
    <body>
        <%
            String str = (String) session.getAttribute("user");
            String user = "";
            if (str != null) {
                char c = str.charAt(0);
                user = Character.toString(c).toUpperCase(Locale.ROOT) + str.substring(1);
            }
        %>
        <a href="#"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <h2>Welcome <%=user%>, You're a Member</h2>
        <p>Choose an option to continue using the application</p>
        <div style="margin-left: auto; margin-right: auto; padding-top: 20px;">
            <a href="cin-session.jsp"><button style="margin-right: 5px;" class="member">CHECK-IN</button></a>
            <a href="cout-session.jsp"><button style="margin-left: 5px;" class="member">CHECK-OUT</button></a>
        </div>
        <h2 style="margin-top: 150px;">Membership Feature</h2>
        <p>Use auto-park feature to park your vehicle instantly</p>
        <div style="margin-left: auto; margin-right: auto; padding-top: 20px;">
            <a href="auto-park.jsp"><button class="auto">AUTO-PARK</button></a>
        </div>
    </body>
</html>
