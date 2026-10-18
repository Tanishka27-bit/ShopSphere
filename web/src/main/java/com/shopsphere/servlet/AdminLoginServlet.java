package com.shopsphere.servlet;

import com.shopsphere.dao.UserDAO;
import com.shopsphere.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(email, password);

        if (user != null) {

            if ("ADMIN".equalsIgnoreCase(user.getRole())) {

                HttpSession session = request.getSession();

                session.setAttribute("user", user);
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("role", user.getRole());

                response.sendRedirect("admin/dashboard.jsp");

            } else {

                response.getWriter().println(
                    "This account is not an Admin."
                );
            }

        } else {

            response.getWriter().println(
                "Email or Password is incorrect."
            );
        }
    }
}
