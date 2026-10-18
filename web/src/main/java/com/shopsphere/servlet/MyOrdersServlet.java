package com.shopsphere.servlet;

import com.shopsphere.dao.OrderHistoryDAO;
import com.shopsphere.model.OrderHistory;
import com.shopsphere.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/myOrders")
public class MyOrdersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession();

        User user =
                (User) session.getAttribute("user");

        if (user == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int userId =
                user.getUserId();

        OrderHistoryDAO dao =
                new OrderHistoryDAO();

        List<OrderHistory> orders =
                dao.getOrdersByUserId(userId);

        request.setAttribute(
                "orders",
                orders
        );

        request.getRequestDispatcher(
                "my-orders.jsp"
        ).forward(request, response);
    }
}
