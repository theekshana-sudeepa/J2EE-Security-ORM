package com.thikka.servlet;

import jakarta.annotation.security.DeclareRoles;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Test Servlet - Protected resource at /test
 *
 * Only accessible by users with role ADMIN or USER.
 * The @ServletSecurity annotation enforces this — unauthenticated
 * users are redirected to the login page by AuthMechanism.
 */
@WebServlet("/test")
@DeclareRoles({"ADMIN", "USER"})
@ServletSecurity(
        @HttpConstraint(rolesAllowed = {"ADMIN", "USER"})
)
public class Test extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        System.out.println("Test Servlet: Accessed by -> " + req.getUserPrincipal().getName());

        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        String user = req.getUserPrincipal().getName();

        // Use separate print() calls to safely inject the dynamic username
        out.print("<!DOCTYPE html>");
        out.print("<html lang='en'><head>");
        out.print("<meta charset='UTF-8'>");
        out.print("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        out.print("<title>J2EE Security ORM | Test</title>");
        out.print("<style>");
        out.print("body { font-family: Arial, sans-serif; background: #f0f0f0; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }");
        out.print(".box { background: #fff; padding: 30px 35px; border: 1px solid #ccc; width: 320px; }");
        out.print("h2 { margin: 0 0 10px 0; font-size: 18px; color: #222; }");
        out.print("p { font-size: 13px; color: #555; margin-bottom: 16px; }");
        out.print("a.btn { display: block; width: 100%; padding: 9px; background: #333; color: #fff; font-size: 13px; text-decoration: none; text-align: center; box-sizing: border-box; }");
        out.print("a.btn:hover { background: #555; }");
        out.print("</style></head><body>");
        out.print("<div class='box'>");
        out.print("<h2>/test Servlet</h2>");
        out.print("<p>This is a protected resource. You are authenticated.</p>");
        out.print("<p>Logged in as: <strong>" + user + "</strong></p>");
        out.print("<a href='index.jsp' class='btn'>Back to Home</a>");
        out.print("</div></body></html>");
    }
}
