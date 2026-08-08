<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J2EE Security ORM | Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.4);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            color: #ffffff;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .login-header p {
            color: rgba(255, 255, 255, 0.5);
            font-size: 14px;
        }

        .badge {
            display: inline-block;
            background: linear-gradient(135deg, #e94560, #0f3460);
            color: white;
            font-size: 11px;
            font-weight: 600;
            padding: 4px 12px;
            border-radius: 20px;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-bottom: 12px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            color: rgba(255, 255, 255, 0.7);
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 16px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 10px;
            color: #ffffff;
            font-size: 14px;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #e94560;
            background: rgba(233, 69, 96, 0.08);
            box-shadow: 0 0 0 3px rgba(233, 69, 96, 0.15);
        }

        .form-group input::placeholder {
            color: rgba(255, 255, 255, 0.3);
        }

        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #e94560, #c0392b);
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 8px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(233, 69, 96, 0.4);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .success-message {
            background: rgba(46, 213, 115, 0.15);
            border: 1px solid rgba(46, 213, 115, 0.4);
            border-radius: 10px;
            color: #2ed573;
            padding: 12px 16px;
            font-size: 13px;
            margin-bottom: 20px;
            text-align: center;
        }

        .signup-link {
            text-align: center;
            margin-top: 24px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 13px;
        }

        .signup-link a {
            color: #e94560;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .signup-link a:hover {
            color: #ff7f9a;
        }

        .divider {
            border: none;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin: 24px 0;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="login-header">
        <div class="badge">J2EE Security ORM</div>
        <h1>Welcome Back</h1>
        <p>Sign in to your account</p>
    </div>

    <%-- Show success message after successful registration --%>
    <% if ("true".equals(request.getParameter("registered"))) { %>
        <div class="success-message">
            ✅ Account created successfully! Please login.
        </div>
    <% } %>

    <%-- Login Form - POST to /login servlet --%>
    <form method="POST" action="${pageContext.request.contextPath}/login">

        <div class="form-group">
            <label for="username">Email Address</label>
            <input type="email" id="username" name="username"
                   placeholder="your@email.com"
                   required />
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Your password"
                   required />
        </div>

        <button type="submit" class="btn-login">Login</button>
    </form>

    <hr class="divider"/>

    <div class="signup-link">
        Don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a>
    </div>
</div>

</body>
</html>
