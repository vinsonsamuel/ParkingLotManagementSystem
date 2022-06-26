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
        <style>
            form {font-family: Arial, Helvetica, sans-serif; font-size: 10px; margin-left: 520px; padding: 15px;}
            input, select, label, option, tr, td {padding: 10px;}
        </style>
    </head>
    <body>
        <a href="member-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="member-session.jsp"><button class="back">&#8249;</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <h2>AUTO - PARK</h2>
        <p>Park your vehicles instantly using the auto-park feature</p>
        <p style="margin-top: 120px;">Kindly Choose Your Preference</p>
    <form action="autopark-success.jsp">
        <table>
            <tr>
                <td>
                    <label>Vehicle Type</label>
                </td>
                <td>
                    <label>
                        <input type="radio" value="two" name="wheel"> Two Wheeler</label>
                    <label>
                        <input value="four" type="radio" name="wheel"> Four Wheeler</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="floor">Preferred Floor</label>
                </td>
                <td>
                    <select style="margin-left: 18px;" id="floor" name="floor">
                        <option value="0" selected>Default Floor</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                   <button style="margin-left: 18px;" class="member">AUTO - PARK</button>
                </td>
            </tr>
        </table>
    </form>
    </body>
</html>
