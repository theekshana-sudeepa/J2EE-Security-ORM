<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>J2EE Security ORM | Home</title>
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

        .card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 48px 40px;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.4);
            text-align: center;
        }

        .badge {
            display: inline-block;
            background: linear-gradient(135deg, #2ed573, #0f3460);
            color: white;
            font-size: 11px;
            font-weight: 600;
            padding: 4px 14px;
            border-radius: 20px;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .icon {
            font-size: 54px;
            margin-bottom: 16px;
        }

        h1 {
            color: #ffffff;
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        p {
            color: rgba(255, 255, 255, 0.55);
            font-size: 14px;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .btn {
            padding: 13px 20px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            display: block;
        }

        .btn-primary {
            background: linear-gradient(135deg, #e94560, #c0392b);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(233, 69, 96, 0.35);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.08);
            color: rgba(255, 255, 255, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.12);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.14);
            transform: translateY(-2px);
        }

        .divider {
            border: none;
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            margin: 24px 0;
        }

        .info-box {
            background: rgba(46, 213, 115, 0.08);
            border: 1px solid rgba(46, 213, 115, 0.2);
            border-radius: 10px;
            padding: 14px;
            color: #2ed573;
            font-size: 13px;
            margin-bottom: 24px;
        }
    </style>
</head>
<body>

<div class="card">
    <div class="badge">✅ Authenticated</div>
    <div class="icon">🏠</div>
    <h1>Welcome!</h1>
    <p>You are logged into the <strong style="color:white;">J2EE Security ORM</strong> system.<br/>
       Your password is stored securely using SHA-256 hashing.</p>

    <div class="info-box">
        🔐 Password hashing active — your credentials are never stored as plain text.
    </div>

    <div class="btn-group">
        <a href="${pageContext.request.contextPath}/test" class="btn btn-primary">
            🔒 Access Protected /test
        </a>
        <a href="${pageContext.request.contextPath}/signup" class="btn btn-secondary">
            ➕ Register New Account
        </a>
    </div>
</div>

</body>
</html>
