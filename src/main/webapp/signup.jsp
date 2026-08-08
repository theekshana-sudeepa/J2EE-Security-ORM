<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J2EE Security ORM | Sign Up</title>
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
        input[type="submit"] {
            width: 100%;
            padding: 9px;
            background: #333;
            color: #fff;
            border: none;
            font-size: 14px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #555;
        }
        .msg-error {
            background: #fdecea;
            border: 1px solid #f5a9a9;
            color: #a33;
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
        .hash-note {
            font-size: 11px;
            color: #888;
            margin-bottom: 14px;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Sign Up</h2>

    <% if (request.getAttribute("error") != null) { %>
        <div class="msg-error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form method="POST" action="${pageContext.request.contextPath}/signup">
        <label for="email">Email</label>
        <input type="email" id="email" name="email"
               placeholder="your@email.com"
               value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
               required />

        <label for="name">Full Name</label>
        <input type="text" id="name" name="name"
               placeholder="Your name"
               value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>"
               required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password"
               placeholder="Password"
               required />

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword"
               placeholder="Repeat password"
               required />

        <p class="hash-note">Password is stored as SHA-256 hash in the database.</p>

        <input type="submit" value="Create Account" />
    </form>

    <div class="footer">
        Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
    </div>
</div>
</body>
</html>
