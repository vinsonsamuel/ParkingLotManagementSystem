<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ses = (String) session.getAttribute("user");
    if (ses==null){
        response.sendRedirect("index.jsp");
    }
%>
<html>
<head>
    <title>CHECK-OUT</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="form-bg">
<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>CHECK-OUT</h3>
                <p>Please enter the details</p>
            </div>
        </div>
        <form action="4payment.jsp" class="login-form">
            <input name="slot" type="text" placeholder="Slot Number"/>
            <input name="time" type="text" placeholder="Check-Out Time"/>
            <button>check-out</button>
        </form>
    </div>
</div>
</body>
</html>
