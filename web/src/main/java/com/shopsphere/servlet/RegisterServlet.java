package com.shopsphere.servlet;

import com.shopsphere.model.User;
import com.shopsphere.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String mobile = request.getParameter("mobile");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setMobile(mobile);
        user.setRole("USER");
        user.setStatus("1");

        UserService service = new UserService();

        boolean result = service.registerUser(user);

        if (result) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration failed!");
        }
    }
}