<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Security Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="form-bg">
<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>SECURITY LOGIN</h3>
                <p>Please enter your credentials to login.</p>
            </div>
        </div>
        <form action="sec-login-success.jsp" class="login-form">
            <input name="username" type="text" placeholder="username"/>
            <input name="password" type="password" placeholder="password"/>
            <button>login</button>
        </form>
    </div>
</div>
</body>
</html>
