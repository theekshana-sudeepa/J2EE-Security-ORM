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

        System.out.println("Test Servlet: Accessed by → " + req.getUserPrincipal().getName());

        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        out.println("""
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>J2EE Security ORM | Test</title>
                <style>
                    * { margin: 0; padding: 0; box-sizing: border-box; }
                    body {
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                        background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
                        min-height: 100vh;
                        display: flex; align-items: center; justify-content: center;
                    }
                    .card {
                        background: rgba(255,255,255,0.05);
                        backdrop-filter: blur(20px);
                        border: 1px solid rgba(255,255,255,0.1);
                        border-radius: 20px;
                        padding: 48px 40px;
                        max-width: 500px; width: 100%;
                        text-align: center;
                        box-shadow: 0 25px 45px rgba(0,0,0,0.4);
                    }
                    .badge {
                        display: inline-block;
                        background: linear-gradient(135deg, #e94560, #0f3460);
                        color: white; font-size: 11px; font-weight: 600;
                        padding: 4px 14px; border-radius: 20px;
                        letter-spacing: 1px; text-transform: uppercase; margin-bottom: 20px;
                    }
                    .icon { font-size: 60px; margin-bottom: 16px; }
                    h1 { color: #fff; font-size: 28px; font-weight: 700; margin-bottom: 10px; }
                    p { color: rgba(255,255,255,0.55); font-size: 14px; line-height: 1.6; margin-bottom: 24px; }
                    .user-info {
                        background: rgba(233,69,96,0.1); border: 1px solid rgba(233,69,96,0.3);
                        border-radius: 10px; padding: 14px; color: #ff7f9a;
                        font-size: 13px; margin-bottom: 24px;
                    }
                    .btn {
                        display: inline-block; padding: 12px 28px;
                        background: linear-gradient(135deg, #e94560, #c0392b);
                        color: white; text-decoration: none; border-radius: 10px;
                        font-weight: 600; font-size: 14px; transition: all 0.3s;
                    }
                    .btn:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(233,69,96,0.35); }
                </style>
            </head>
            <body>
            <div class="card">
                <div class="badge">🔒 Protected Resource</div>
                <div class="icon">✅</div>
                <h1>/test Servlet</h1>
                <p>You have successfully accessed this <strong style="color:white;">protected page</strong>.<br/>
                   Jakarta Security confirmed your identity and role.</p>
                <div class="user-info">
                    👤 Logged in as: <strong>""" + req.getUserPrincipal().getName() + """
                    </strong>
                </div>
                <a href="index.jsp" class="btn">← Back to Home</a>
            </div>
            </body>
            </html>
        """);
    }
}

