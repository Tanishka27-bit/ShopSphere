package com.shopsphere.controller;

import com.shopsphere.model.Order;
import com.shopsphere.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/place-order")
public class OrderServlet extends HttpServlet {

    private OrderService orderService = new OrderService();

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String addressIdParam = request.getParameter("addressId");
        String totalAmountParam = request.getParameter("totalAmount");

        if (addressIdParam == null || totalAmountParam == null) {
            response.getWriter().println("Invalid order details!");
            return;
        }

        int addressId = Integer.parseInt(addressIdParam);
        double totalAmount = Double.parseDouble(totalAmountParam);

        Order order = new Order();

        order.setUserId(userId);
        order.setAddressId(addressId);
        order.setTotalAmount(totalAmount);
        order.setDiscount(0);
        order.setPaymentMethod("COD");
        order.setPaymentStatus("PENDING");
        order.setOrderStatus("PLACED");

        int orderId = orderService.placeOrderAndGetId(order);

        if (orderId > 0) {

            response.sendRedirect(
                "order-success.jsp?orderId=" + orderId
            );

        } else {

            response.getWriter().println(
                "Order placement failed!"
            );
        }
    }
}
