<%@ page import="com.vinson.plms.ParkingDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.nio.file.StandardOpenOption" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.io.FileWriter" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    int status = ParkingDAO.validateSecurityLogin(username, password);
    String pattern = "dd-MM-yyyy";
    String date =new SimpleDateFormat(pattern).format(new Date());
    if(status>0){
        try {
            File myObj = new File("C:\\Users\\vinso\\IdeaProjects\\ParkingLot\\src\\main\\files\\log-file.txt");
            Scanner log = new Scanner(myObj);
            Path obj = Path.of("C:\\Users\\vinso\\IdeaProjects\\ParkingLot\\src\\main\\files\\log-file.txt");
            if (!date.equals(log.next())){
                Files.newBufferedWriter(obj , StandardOpenOption.TRUNCATE_EXISTING);
                FileWriter fw = new FileWriter("C:\\Users\\vinso\\IdeaProjects\\ParkingLot\\src\\main\\files\\log-file.txt", true);
                fw.write(date);
                fw.write(System.getProperty( "line.separator" ));
                fw.close();
            }
            log.close();
        } catch (Exception e){
            System.out.println(e);
        }
        String uname = request.getParameter("username");
        session.setAttribute("security", uname);
        response.sendRedirect("sec-session.jsp");
    }
    else {
        out.print("Please check your login credentials.");
    }
%>