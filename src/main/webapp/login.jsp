<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J2EE Security ORM | Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .box {
            background: #fff;
            padding: 30px 35px;
            border: 1px solid #ccc;
            width: 320px;
        }
        h2 {
            margin: 0 0 20px 0;
            font-size: 18px;
            color: #222;
        }
        label {
            display: block;
            font-size: 13px;
            color: #444;
            margin-bottom: 4px;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 14px;
            border: 1px solid #ccc;
            font-size: 13px;
            box-sizing: border-box;
        }
        input[type="submit"], button[type="submit"] {
            width: 100%;
            padding: 9px;
            background: #333;
            color: #fff;
            border: none;
            font-size: 14px;
            cursor: pointer;
        }
        input[type="submit"]:hover, button[type="submit"]:hover {
            background: #555;
        }
        .msg-success {
            background: #e6f9ee;
            border: 1px solid #a3d9b1;
            color: #2d7a4f;
            padding: 8px 10px;
            font-size: 12px;
            margin-bottom: 14px;
        }
        .footer {
            margin-top: 14px;
            font-size: 12px;
            color: #666;
            text-align: center;
        }
        .footer a {
            color: #333;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Login</h2>

    <% if ("true".equals(request.getParameter("registered"))) { %>
        <div class="msg-success">Account created. Please login.</div>
    <% } %>

    <form method="POST" action="${pageContext.request.contextPath}/login">
        <label for="username">Email</label>
        <input type="email" id="username" name="username" placeholder="your@email.com" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Password" required />

        <input type="submit" value="Login" />
    </form>

    <div class="footer">
        No account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
    </div>
</div>
</body>
</html>
