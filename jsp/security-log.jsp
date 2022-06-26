<%@ page import="java.io.File" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("security");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <title>Log File</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            table, tr, th, td {border-collapse: collapse; text-align: center; margin-left: 565px; padding: 15px;}
            input, label {padding: 10px; font-family: Arial, Helvetica, sans-serif; cursor: pointer;}
        </style>
    </head>
    <body>
        <a href="sec-session.jsp"><button class="home"><i class="fa fa-home"></i> HOME</button></a>
        <a href="park-management.jsp"><button class="back">&#8249;</button></a>
        <a href="index.jsp"><button class="logout">LOGOUT</button></a>
    <%
        String pattern = "dd-MM-yyyy";
        String date =new SimpleDateFormat(pattern).format(new Date());%>
        <h2><%=date%> DATA LOG</h2>
        <form style="text-align: center; padding: 20px;" action="custom-column.jsp">
            <input type="checkbox" id="activity" name="activity" value="Activity">
            <label for="activity">Activity</label>
            <input type="checkbox" id="slot" name="slot" value="Slot Number">
            <label for="slot">Slot</label>
            <input type="checkbox" id="uname" name="uname" value="Username">
            <label for="uname">Username</label>
            <input type="checkbox" id="time" name="time" value="Time">
            <label for="time">Time</label>
            <button style="padding: 8px; margin-left: 20px;" class="cin" type="submit">VIEW</button>
        </form>
        <table border="1">
            <%
                try{
                    String arr[] = (String[]) session.getAttribute("array");
                    int j=0;
                    for (int i=0; i<4; i++){
                        if (arr[i]!=null){%>
                            <th><%=arr[i]%></th>
                            <%j++;
                        }
                    }
                    File myObj = new File("C:\\Users\\vinso\\IdeaProjects\\ParkingLot\\src\\main\\files\\log-file.txt");
                    Scanner log = new Scanner(myObj);
                    log.skip(date);%>
                    <tr>
                        <%while (log.hasNextLine()){
                            for (int i=0; i<j; i++){%>
                                <td><%=log.next()%></td>
                            <%}
                            log.nextLine();%>
                    </tr>
                        <%}
                    log.close();
                } catch (Exception e){
                    System.out.println(e);
                }%>
        </table>
    </body>
</html>