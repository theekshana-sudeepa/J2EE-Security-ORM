<%--
  Created by IntelliJ IDEA.
  User: PraveenLakshan
  Date: 8/7/2026
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>J2EE Security ORM | Log In</title>
</head>
<body>
<h1>Login</h1>
<form method="POST" action="${pageContext.request.contextPath}/login">
    <table>
        <tr>
            <th>Username :</th>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <th>Password :</th>
            <td><input type="password" name="password"/></td>
        </tr>

        <tr>
            <td></td>
            <td><input type="submit" value="Login"/></td>
        </tr>
    </table>
</form>
</body>
</html>
