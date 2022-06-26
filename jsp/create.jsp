<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create an Account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="form-bg">
<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>REGISTER</h3>
                <p>Enter your credentials to register</p>
            </div>
        </div>
        <form action="create-success.jsp" class="login-form">
            <input name="email" type="email" placeholder="email"/>
            <input name="username" type="text" placeholder="username"/>
            <input name="password" type="password" placeholder="password"/>
            <button>register</button>
            <p class="message">Have an account? <a href="login.jsp">Login to your account</a></p>
        </form>
    </div>
</div>
</body>
</html>
