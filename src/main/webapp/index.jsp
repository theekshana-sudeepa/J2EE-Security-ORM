<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J2EE Security ORM | Home</title>
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
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #222;
        }
        p {
            font-size: 13px;
            color: #555;
            margin-bottom: 20px;
        }
        a.btn {
            display: block;
            width: 100%;
            padding: 9px;
            background: #333;
            color: #fff;
            border: none;
            font-size: 13px;
            text-decoration: none;
            text-align: center;
            margin-bottom: 8px;
            box-sizing: border-box;
        }
        a.btn:hover {
            background: #555;
        }
        a.btn-outline {
            display: block;
            width: 100%;
            padding: 9px;
            background: #fff;
            color: #333;
            border: 1px solid #ccc;
            font-size: 13px;
            text-decoration: none;
            text-align: center;
            box-sizing: border-box;
        }
        a.btn-outline:hover {
            background: #f5f5f5;
        }
    </style>
</head>
<body>
<div class="box">
    <h2>Welcome</h2>
    <p>You are logged in. Password is stored as SHA-256 hash in the database.</p>

    <a href="${pageContext.request.contextPath}/test" class="btn">Go to /test (Protected)</a>
    <a href="${pageContext.request.contextPath}/signup" class="btn-outline">Register New Account</a>
</div>
</body>
</html>
