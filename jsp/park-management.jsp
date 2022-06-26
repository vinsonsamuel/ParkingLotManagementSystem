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
        <title>Parking Management</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <style>
            body {background-color: beige;}
            table,th,tr,td {text-align: center; padding: 5px; border-color: black; border-collapse: collapse;}
            .margin {margin-left: auto; margin-right: auto;}
            .reserve {background-color: blueviolet; color: #FFFFFF; font-family: Arial, Helvetica, sans-serif; border: none; border-radius: 5px; padding: 12px; cursor: pointer;}
            input {font-family: Arial, Helvetica, sans-serif; background-color: beige;}
            .log {position:fixed;right:110px;top:5px;font-family: Arial, Helvetica, sans-serif;padding: 10px;background-color: orange; border: none; color: #FFFFFF;cursor: pointer;}
        </style>
    </head>
    <body>
        <a href="sec-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="sec-session.jsp"><button class="back">&#8249;</button></a>
        <a href="security-log.jsp"><button class="log">VIEW LOG</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
        <div>
            <h2>TWO WHEELER</h2>
        </div>
        <div style="display:inline-block;">
            <h3 style="display: inline-block; float: left; margin-left: 350px; margin-right: 100px">First Floor</h3>
            <h3 style="display: inline-block; float: left; margin-left: 430px; margin-right: 100px">Second Floor</h3>
        </div>
            <%
                Statement statement = ParkingDAO.getStatement();
                ResultSet resultSet = null;
            %>
        <div style="display: inline-block;">
            <table class="margin" style="float: left; margin-left: 200px; margin-right: 100px" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql21 = "select*from twoWheeler order by slot";
                    try{
                        int slot21=0, status21=0; String state21="";
                        resultSet = statement.executeQuery(sql21);
                        while(resultSet.next()){
                            slot21 = resultSet.getInt("slot");
                            state21 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot21)==1 && state21.equals("Occupied")){
                                status21=slot21;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot21%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state21 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot21)==1 && state21.equals("Reserved")){
                                status21=slot21;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot21%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state21 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot21)==1 && state21.equals("Free")){
                                status21=slot21;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot21%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state21 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                            </tr>
                        <%}
                        }%>
                    <tr>
                        <td></td>
                        <td><a href="increase.jsp?slot=<%=status21%>"><button class="inc-dec">INCREASE</button></a></td>
                        <td><a href="decrease.jsp?slot=<%=status21%>"><button class="inc-dec">DECREASE</button></a></td>
                        <td></td>
                    </tr>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <table style="float: right; margin-right: 200px; margin-left: 100px; margin-top: -210px;" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql22 = "select*from twoWheeler order by slot";
                    try{
                        int slot22=0, status22=0; String state22="";
                        resultSet = statement.executeQuery(sql22);
                        while(resultSet.next()){
                            slot22 = resultSet.getInt("slot");
                            state22 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot22)==2 && state22.equals("Occupied")){
                                status22=slot22;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot22%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state22 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot22)==2 && state22.equals("Reserved")){
                                status22=slot22;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot22%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state22 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot22)==2 && state22.equals("Free")){
                                status22=slot22;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot22%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state22 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                    <tr>
                        <td></td>
                        <td><a href="increase.jsp?slot=<%=status22%>"><button class="inc-dec">INCREASE</button></a></td>
                        <td><a href="decrease.jsp?slot=<%=status22%>"><button class="inc-dec">DECREASE</button></a></td>
                        <td></td>
                    </tr>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div style="display:inline-block;">
            <h3 style="display: inline-block; float: left; margin-left: 350px; margin-right: 100px">Third Floor</h3>
            <h3 style="display: inline-block; float: left; margin-left: 430px; margin-right: 100px">Fourth Floor</h3>
        </div>
        <div style="display: inline-block;">
            <table class="margin" style="float: left; margin-left: 200px; margin-right: 100px" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql23 = "select*from twoWheeler order by slot";
                    try{
                        int slot23=0, status23=0; String state23="";
                        resultSet = statement.executeQuery(sql23);
                        while(resultSet.next()){
                            slot23 = resultSet.getInt("slot");
                            state23 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot23)==3 && state23.equals("Occupied")){
                                status23=slot23;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot23%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state23 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot23)==3 && state23.equals("Reserved")){
                                status23=slot23;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot23%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state23 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot23)==3 && state23.equals("Free")){
                                status23=slot23;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot23%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state23 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status23%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status23%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                <%
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <table style="float: right; margin-right: 200px; margin-left: 100px; margin-top: -210px;" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql24 = "select*from twoWheeler order by slot";
                    try{
                        int slot24=0, status24=0; String state24="";
                        resultSet = statement.executeQuery(sql24);
                        while(resultSet.next()){
                            slot24 = resultSet.getInt("slot");
                            state24 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot24)==4 && state24.equals("Occupied")){
                                status24=slot24;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot24%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state24 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot24)==4 && state24.equals("Reserved")){
                                status24=slot24;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot24%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state24 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot24)==4 && state24.equals("Free")){
                                status24=slot24;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot24%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state24 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}}%>
                            <tr>
                                <td></td>
                                <td><a href="increase.jsp?slot=<%=status24%>"><button class="inc-dec">INCREASE</button></a></td>
                                <td><a href="decrease.jsp?slot=<%=status24%>"><button class="inc-dec">DECREASE</button></a></td>
                                <td></td>
                            </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>
        <div style="display:inline-block;">
            <h3 style="display: inline-block; float: left; margin-left: 350px; margin-right: 100px">Fifth Floor</h3>
            <h3 style="display: inline-block; float: left; margin-left: 430px; margin-right: 100px"></h3>
        </div>
        <div style="display: inline-block;">
            <table class="margin" style="float: left; margin-left: 200px; margin-right: 100px" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql25 = "select*from twoWheeler order by slot";
                    try{
                        int slot25=0, status25=0; String state25="";
                        resultSet = statement.executeQuery(sql25);
                        while(resultSet.next()){
                            slot25 = resultSet.getInt("slot");
                            state25 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot25)==5 && state25.equals("Occupied")){
                                status25=slot25;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot25%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state25 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot25)==5 && state25.equals("Reserved")){
                                status25=slot25;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot25%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state25 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot25)==5 && state25.equals("Free")){
                                status25=slot25;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot25%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state25 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status25%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status25%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <div style="display: inline-block; margin-left: 180px; margin-top: 50px; text-align: left;">
                <form action="reserve.jsp">
                    <input style="padding: 12px;" type="text" name="slot" placeholder="Slot Number">
                    <button class="reserve">RESERVE</button>
                </form>
                <form action="unreserve.jsp">
                    <input style="padding: 12px;" type="text" name="slot" placeholder="Slot Number">
                    <button class="reserve">UN-RESERVE</button>
                </form>
            </div>
        </div>
        <div style="float: contour;">
            <h2>FOUR WHEELER</h2>
        </div>
        <div>
            <h3 style="float: left; margin-left: 350px; margin-right: 100px">First Floor</h3>
            <h3 style="float: left; margin-left: 430px; margin-right: 100px">Second Floor</h3>
        </div>
        <div>
            <table style="float: left; margin-left: 200px; margin-right: 100px;" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql41 = "select*from fourWheeler order by slot";
                    try{
                        int slot41=0, status41=0; String state41="";
                        resultSet = statement.executeQuery(sql41);
                        while(resultSet.next()){
                            slot41 = resultSet.getInt("slot");
                            state41 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot41)==1 && state41.equals("Occupied")){
                                status41=slot41;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot41%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state41 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot41)==1 && state41.equals("Reserved")){
                                status41=slot41;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot41%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state41 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot41)==1 && state41.equals("Free")){
                                status41=slot41;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot41%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state41 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                            </tr>
                        <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status41%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status41%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <table style="float: right; margin-right: 200px; margin-left: 100px; margin-top: -210px;" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql42 = "select*from fourWheeler order by slot";
                    try{
                        int slot42=0, status42=0; String state42="";
                        resultSet = statement.executeQuery(sql42);
                        while(resultSet.next()){
                            slot42 = resultSet.getInt("slot");
                            state42 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot42)==2 && state42.equals("Occupied")){
                                status42=slot42;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot42%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state42 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot42)==2 && state42.equals("Reserved")){
                                status42=slot42;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot42%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state42 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot42)==2 && state42.equals("Free")){
                                status42=slot42;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot42%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state42 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status42%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status42%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }%>
            </table>
        </div>
        <div style="display:inline-block;">
            <h3 style="display: inline-block; float: left; margin-left: 350px; margin-right: 100px">Third Floor</h3>
            <h3 style="display: inline-block; float: left; margin-left: 430px; margin-right: 100px">Fourth Floor</h3>
        </div>
        <div style="display: inline-block;">
            <table class="margin" style="float: left; margin-left: 200px; margin-right: 100px;" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql43 = "select*from fourWheeler order by slot";
                    try{
                        int slot43=0, status43=0; String state43="";
                        resultSet = statement.executeQuery(sql43);
                        while(resultSet.next()){
                            slot43 = resultSet.getInt("slot");
                            state43 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot43)==3 && state43.equals("Occupied")){
                                status43=slot43;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot43%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state43 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot43)==3 && state43.equals("Reserved")){
                                status43=slot43;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot43%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state43 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot43)==3 && state43.equals("Free")){
                                status43=slot43;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot43%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state43 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status43%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status43%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }%>
            </table>
            <table style="float: right; margin-right: 200px; margin-left: 100px; margin-top: -210px;" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql44 = "select*from fourWheeler order by slot";
                    try{
                        int slot44=0, status44=0; String state44="";
                        resultSet = statement.executeQuery(sql44);
                        while(resultSet.next()){
                            slot44 = resultSet.getInt("slot");
                            state44 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot44)==4 && state44.equals("Occupied")){
                                status44=slot44;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot44%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state44 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot44)==4 && state44.equals("Reserved")){
                                status44=slot44;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot44%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state44 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot44)==4 && state44.equals("Free")){
                                status44=slot44;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot44%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state44 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status44%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status44%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }%>
            </table>
        </div>
        <div style="display:inline-block;">
            <h3 style="display: inline-block; float: left; margin-left: 350px; margin-right: 100px">Fifth Floor</h3>
            <h3 style="display: inline-block; float: left; margin-left: 500px; margin-right: 100px"></h3>
        </div>
        <div style="display: inline-block;">
            <table class="margin" style="float: left; margin-left: 200px; margin-right: 100px" border="1">
                <tr>
                    <th>Slot Number</th>
                    <th>User Name</th>
                    <th>State of Parking</th>
                    <th>Check-In Time</th>
                </tr>
                <%
                    String sql45 = "select*from fourWheeler order by slot";
                    try{
                        int slot45=0, status45=0; String state45="";
                        resultSet = statement.executeQuery(sql45);
                        while(resultSet.next()){
                            slot45 = resultSet.getInt("slot");
                            state45 = resultSet.getString("state");
                            if (ParkingDAO.floorExtract(slot45)==5 && state45.equals("Occupied")){
                                status45=slot45;%>
                                <tr style="background-color: paleturquoise">
                                    <td><%=slot45%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state45 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if(ParkingDAO.floorExtract(slot45)==5 && state45.equals("Reserved")){
                                status45=slot45;%>
                                <tr style="background-color: palevioletred">
                                    <td><%=slot45%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state45 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%} else if (ParkingDAO.floorExtract(slot45)==5 && state45.equals("Free")){
                                status45=slot45;%>
                                <tr style="background-color: palegreen">
                                    <td><%=slot45%></td>
                                    <td><%=resultSet.getString("username") %></td>
                                    <td><%=state45 %></td>
                                    <td><%=resultSet.getString("time") %></td>
                                </tr>
                            <%}
                        }%>
                        <tr>
                            <td></td>
                            <td><a href="increase.jsp?slot=<%=status45%>"><button class="inc-dec">INCREASE</button></a></td>
                            <td><a href="decrease.jsp?slot=<%=status45%>"><button class="inc-dec">DECREASE</button></a></td>
                            <td></td>
                        </tr>
                    <%} catch (Exception e) {
                        e.printStackTrace();
                    }%>
            </table>
            <div style="display: inline-block; margin-left: 180px; margin-top: 50px; text-align: left;">
                <form action="reserve.jsp">
                    <input style="padding: 12px;" type="text" name="slot" placeholder="Slot Number">
                    <button class="reserve">RESERVE</button>
                </form>
                <form action="unreserve.jsp">
                    <input style="padding: 12px;" type="text" name="slot" placeholder="Slot Number">
                    <button class="reserve">UN-RESERVE</button>
                </form>
            </div>
        </div>
    </body>
</html>
