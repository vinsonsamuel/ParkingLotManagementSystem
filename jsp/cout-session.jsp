<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("user");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>Check-Out</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            table,th,tr,td {text-align: center; padding: 5px; border-color: mediumseagreen; border-collapse: collapse; }
        </style>
    </head>
    <body>
    <%
        String user = (String) session.getAttribute("user");
        boolean member = ParkingDAO.memberCheck(user);
        if(member) {%>
            <a href="member-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
            <a href="member-session.jsp"><button class="back">&#8249;</button></a>
        <%} else {%>
            <a href="user-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
            <a href="user-session.jsp"><button class="back">&#8249;</button></a>
        <%}%>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
    <%
        String uname = (String) session.getAttribute("user");
        int status = ParkingDAO.checkOutConfirm(uname);
        if(status>0){%>
            <h2>You've vehicles Checked-in</h2>
            <p>Kindly check-out using below credentials</p>
            <div style="margin-top: 50px;">
                <table style="margin-left: auto; margin-right: auto;" border="1">
                    <tr>
                        <th>Number</th>
                        <th>Slot Number</th>
                        <th>Check-In Time</th>
                        <th>Check-Out</th>
                    </tr>
                <%
                    int[] arr = ParkingDAO.checkOutVehicles(uname);
                    int j=1;
                    for(int i=0; i<arr.length; i++){
                        if (arr[i]!=0){
                            String vehType = ParkingDAO.vehicleType(arr[i]);
                            try{
                                String sql = "select*from " + vehType +  "Wheeler order by slot";
                                Statement statement = ParkingDAO.getStatement();
                                ResultSet resultSet = statement.executeQuery(sql);
                                while(resultSet.next()){
                                    int slot = resultSet.getInt("slot");
                                    String time = resultSet.getString("time");
                                    if (arr[i]==slot && vehType.equals("two")){%>
                                        <tr>
                                            <td><%=j++%></td>
                                            <td><%=slot%></td>
                                            <td><%=time%></td>
                                            <td><a href="2cout-success.jsp"><button style="padding: 4px;" class="cin">CHECK-OUT</button></a></td>
                                        </tr>
                                    <%} else if (arr[i]==slot && vehType.equals("four")){%>
                                        <tr>
                                            <td><%=j++%></td>
                                            <td><%=slot%></td>
                                            <td><%=time%></td>
                                            <td><a href="4cout-success.jsp"><button style="padding: 4px;" class="cin">CHECK-OUT</button></a></td>
                                        </tr>
                                    <%}
                                }
                            } catch (Exception e){
                                System.out.println(e);
                            }
                        }
                    }%>
                </table>
            </div>
        <%} else {%>
            <h2>You've no vehicles Checked-in</h2>
            <p>Kindly check-in to continue</p>
            <div style="margin-left: auto; margin-right: auto; padding-top: 20px;">
                <a href="cin-session.jsp"><button class="cin">CHECK-IN</button></a>
            </div>
        <%}%>
    </body>
</html>