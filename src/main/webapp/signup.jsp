<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J2EE Security ORM | Sign Up</title>
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

        .signup-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.4);
        }

        .signup-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .signup-header h1 {
            color: #ffffff;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .signup-header p {
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
            letter-spacing: 0.5px;
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

        .btn-signup {
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
            letter-spacing: 0.5px;
            margin-top: 8px;
        }

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(233, 69, 96, 0.4);
        }

        .btn-signup:active {
            transform: translateY(0);
        }

        .error-message {
            background: rgba(233, 69, 96, 0.15);
            border: 1px solid rgba(233, 69, 96, 0.4);
            border-radius: 10px;
            color: #ff7f9a;
            padding: 12px 16px;
            font-size: 13px;
            margin-bottom: 20px;
            text-align: center;
        }

        .login-link {
            text-align: center;
            margin-top: 24px;
            color: rgba(255, 255, 255, 0.5);
            font-size: 13px;
        }

        .login-link a {
            color: #e94560;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .login-link a:hover {
            color: #ff7f9a;
        }

        .divider {
            border: none;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            margin: 24px 0;
        }

        .hash-info {
            background: rgba(15, 52, 96, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 10px;
            padding: 12px 14px;
            margin-bottom: 20px;
        }

        .hash-info p {
            color: rgba(255, 255, 255, 0.5);
            font-size: 11px;
            line-height: 1.6;
        }

        .hash-info span {
            color: #4fc3f7;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="signup-container">
    <div class="signup-header">
        <div class="badge">J2EE Security ORM</div>
        <h1>Create Account</h1>
        <p>Register to access the secure system</p>
    </div>

    <%-- Show error message if any validation failed --%>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error-message">
            ⚠️ <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <%-- Signup Form - POST to /signup servlet --%>
    <form method="POST" action="${pageContext.request.contextPath}/signup">

        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"
                   placeholder="your@email.com"
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                   required />
        </div>

        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name"
                   placeholder="Your full name"
                   value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>"
                   required />
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Enter a strong password"
                   required />
        </div>

        <div class="form-group">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword"
                   placeholder="Repeat your password"
                   required />
        </div>

        <div class="hash-info">
            <p>🔐 Your password is stored as a <span>SHA-256 hash</span> — the original password is never saved to the database.</p>
        </div>

        <button type="submit" class="btn-signup">Create Account</button>
    </form>

    <hr class="divider"/>

    <div class="login-link">
        Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Login here</a>
    </div>
</div>

</body>
</html>
