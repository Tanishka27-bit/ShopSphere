package com.shopsphere.servlet;

import com.shopsphere.dao.OrderItemDAO;
import com.shopsphere.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/saveOrderItem")
public class OrderItemServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String orderId =
                request.getParameter("orderId");

        String productId =
                request.getParameter("productId");

        String quantity =
                request.getParameter("quantity");

        String price =
                request.getParameter("price");


        OrderItem item = new OrderItem();

        item.setOrderId(
                Integer.parseInt(orderId)
        );

        item.setProductId(
                Integer.parseInt(productId)
        );

        item.setQuantity(
                Integer.parseInt(quantity)
        );

        item.setPrice(
                Double.parseDouble(price)
        );


        OrderItemDAO dao =
                new OrderItemDAO();

        boolean result =
                dao.saveOrderItem(item);


        if (result) {

            response.getWriter().println(
                "Order Item Saved Successfully!"
            );

        } else {

            response.getWriter().println(
                "Order Item Saving Failed!"
            );
        }
    }
}
