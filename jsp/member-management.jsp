<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("security");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>Member Management</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {background-color: beige;}
            table,th,tr,td {text-align: center; padding: 5px; border-color: black}
            .de-promote {background-color: darkred; color: #FFFFFF; cursor: pointer; border: none; padding: 6px;}
            .accept {background-color: blueviolet; color: #FFFFFF; cursor: pointer; border: none; padding: 6px;}
        </style>
    </head>
    <body>
        <a href="sec-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="sec-session.jsp"><button class="back">&#8249;</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <h2>MEMBER MANAGEMENT</h2>
        <h3>List of Members</h3>
        <div>
            <%
                Statement statement = ParkingDAO.getStatement();
                ResultSet resultSet = null;
            %>
            <table class="margin" style="margin-left: 540px;" border="1">
                <tr>
                    <th>Number</th>
                    <th>User Name</th>
                    <th>Email ID</th>
                    <th>De-Promote</th>
                </tr>
                <%
                    String sql = "select*from userLogin order by username";
                    try{
                        resultSet = statement.executeQuery(sql);
                        int i=1; String uname="", email=""; boolean member=false;
                        while(resultSet.next()){
                            uname = resultSet.getString("username");
                            email = resultSet.getString("email");
                            member = resultSet.getBoolean("member");
                            if (member){%>
                                <tr>
                                    <td><%=i%></td>
                                    <td><%=uname%></td>
                                    <td><%=email%></td>
                                    <td><a href="de-promote.jsp?uname=<%=uname%>"><button class="de-promote">DE-PROMOTE</button></a></td>
                                </tr>
                            <%i++;}}%>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <h3 style="padding-top: 40px;">Membership Requests</h3>
        <%
            String sql1 = "select*from userLogin order by username";
            try{
                resultSet = statement.executeQuery(sql1);
                int i=1; String uname=""; boolean member=false, req=false;
                while(resultSet.next()){
                    uname = resultSet.getString("username");
                    member = resultSet.getBoolean("member");
                    req = resultSet.getBoolean("request");
                    if (!member && req){%>
                        <table style="font-family: Arial, Helvetica, sans-serif; margin-left: 675px; border-collapse: collapse;" border="1">
                            <tr style="padding: 10px;">
                                <th>User Name</th>
                                <th>Accept</th>
                            </tr>
                            <tr>
                                <td><%=uname%></td>
                                <td><a href="accept.jsp?uname=<%=uname%>"><button class="accept">ACCEPT</button></a></td>
                            </tr>
                        </table>
                    <%i++;}}
                if(i==1){%>
                    <p>There are no membership requests pending...</p>
                <%}%>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
