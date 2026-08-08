package com.thikka.servlet;

import com.thikka.service.SignupService;
import com.thikka.util.PasswordUtil;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Signup Servlet - Handles user registration at /signup.
 *
 * GET  /signup → shows the signup form (signup.jsp)
 * POST /signup → reads form data, hashes password, saves to DB, redirects to login
 */
@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Inject
    private SignupService signupService;

    /**
     * GET: Show the signup form page.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward the request to the signup JSP page
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
    }

    /**
     * POST: Process the signup form submission.
     *
     * Flow:
     *   1. Read email, name, password, confirmPassword from the form
     *   2. Validate inputs (empty check, password match)
     *   3. Check if email is already registered
     *   4. Hash the password using SHA-256
     *   5. Save the new user to the DB via SignupService
     *   6. Redirect to login page on success
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Step 1: Read form fields
        String email           = request.getParameter("email");
        String name            = request.getParameter("name");
        String password        = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Step 2: Basic validation
        if (email == null || email.isBlank() ||
            name == null || name.isBlank() ||
            password == null || password.isBlank()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }

        // Passwords must match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }

        // Step 3: Check for duplicate email
        if (signupService.emailExists(email)) {
            request.setAttribute("error", "This email is already registered. Please login.");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            return;
        }

        // Step 4: Hash the password using SHA-256 BEFORE saving to DB
        // "12345" → "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"
        String hashedPassword = PasswordUtil.hash(password);

        System.out.println("Signup: Hashing password for user → " + email);
        System.out.println("Signup: Stored hash → " + hashedPassword);

        // Step 5: Register (persist) the new user
        signupService.register(email, name, hashedPassword);

        // Step 6: Redirect to login page with a success message
        response.sendRedirect(request.getContextPath() + "/login.jsp?registered=true");
    }
}
