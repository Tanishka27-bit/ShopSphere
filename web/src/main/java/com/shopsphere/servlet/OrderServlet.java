package com.shopsphere.servlet;

import com.shopsphere.dao.AddressDAO;
import com.shopsphere.dao.OrderDAO;
import com.shopsphere.dao.OrderItemDAO;

import com.shopsphere.model.Address;
import com.shopsphere.model.Order;
import com.shopsphere.model.OrderItem;
import com.shopsphere.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        // Check login
        if (user == null) {

            response.getWriter().println(
                "Please login before placing an order."
            );

            return;
        }


        // =========================
        // ADDRESS DETAILS
        // =========================

        String addressLine =
                request.getParameter("address");

        String city =
                request.getParameter("city");

        String state =
                request.getParameter("state");

        String pincode =
                request.getParameter("pincode");


        // =========================
        // ORDER DETAILS
        // =========================

        String payment =
                request.getParameter("payment");

        String total =
                request.getParameter("total");


        // =========================
        // SAVE ADDRESS
        // =========================

        Address address = new Address();

        address.setUserId(user.getUserId());
        address.setAddressLine(addressLine);
        address.setCity(city);
        address.setState(state);
        address.setPincode(pincode);


        AddressDAO addressDAO =
                new AddressDAO();

        int addressId =
                addressDAO.saveAddress(address);


        if (addressId == 0) {

            response.getWriter().println(
                "Address saving failed!"
            );

            return;
        }


        // =========================
        // CREATE ORDER
        // =========================

        Order order = new Order();

        order.setUserId(user.getUserId());
        order.setAddressId(addressId);

        order.setTotalAmount(
                Double.parseDouble(total)
        );

        order.setDiscount(0);

        order.setPaymentMethod(payment);

        order.setPaymentStatus("PENDING");

        order.setOrderStatus("PLACED");


        // =========================
        // SAVE ORDER
        // =========================

        OrderDAO orderDAO =
                new OrderDAO();

        int orderId =
                orderDAO.placeOrderAndGetId(order);


        if (orderId == 0) {

            response.getWriter().println(
                "Order placement failed!"
            );

            return;
        }


        // =========================
        // GET CART PRODUCTS
        // =========================

        String[] productIds =
                request.getParameterValues("productId");

        String[] quantities =
                request.getParameterValues("quantity");

        String[] prices =
                request.getParameterValues("price");


        // =========================
        // SAVE ORDER ITEMS
        // =========================

        if (productIds != null) {

            OrderItemDAO orderItemDAO =
                    new OrderItemDAO();


            for (int i = 0;
                 i < productIds.length;
                 i++) {

                OrderItem item =
                        new OrderItem();


                item.setOrderId(orderId);


                item.setProductId(
                        Integer.parseInt(productIds[i])
                );


                item.setQuantity(
                        Integer.parseInt(quantities[i])
                );


                item.setPrice(
                        Double.parseDouble(prices[i])
                );


                orderItemDAO.saveOrderItem(item);
            }
        }


        // =========================
        // ORDER SUCCESS
        // =========================

        response.sendRedirect(
                "order-success.jsp"
        );
    }
}
