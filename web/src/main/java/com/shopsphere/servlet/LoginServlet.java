package com.shopsphere.servlet;

import com.shopsphere.model.User;
import com.shopsphere.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import jakarta.servlet.http.Cookie;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserService service = new UserService();

        User user = service.loginUser(email, password);

        if (user != null) {

            // Session create karo
            HttpSession session = request.getSession();

            // Logged-in user ki information save karo
            session.setAttribute("user", user);

            // User ID separately bhi save kar rahe hain
            session.setAttribute("userId", user.getUserId());
            // User email ko cookie mein save karo
Cookie userCookie = new Cookie("userEmail", user.getEmail());

// Cookie 7 days tak rahegi
userCookie.setMaxAge(7 * 24 * 60 * 60);

// Browser ko cookie bhejo
response.addCookie(userCookie);

            response.sendRedirect("home.jsp");

        } else {

            response.getWriter().println(
                "Invalid Email or Password!"
            );
        }
    }
}