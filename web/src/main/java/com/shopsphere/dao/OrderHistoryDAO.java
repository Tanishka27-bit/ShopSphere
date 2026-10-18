package com.shopsphere.dao;

import com.shopsphere.model.OrderHistory;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderHistoryDAO {

    public List<OrderHistory> getOrdersByUserId(int userId) {

        List<OrderHistory> orders = new ArrayList<>();

        String sql =
                "SELECT order_id, total_amount, discount, " +
                "payment_method, payment_status, order_status, created_at " +
                "FROM orders " +
                "WHERE user_id = ? " +
                "ORDER BY order_id DESC";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                    ps.executeQuery();

            while (rs.next()) {

                OrderHistory order =
                        new OrderHistory();

                order.setOrderId(
                        rs.getInt("order_id")
                );

                order.setTotalAmount(
                        rs.getDouble("total_amount")
                );

                order.setDiscount(
                        rs.getDouble("discount")
                );

                order.setPaymentMethod(
                        rs.getString("payment_method")
                );

                order.setPaymentStatus(
                        rs.getString("payment_status")
                );

                order.setOrderStatus(
                        rs.getString("order_status")
                );

                order.setCreatedAt(
                        rs.getString("created_at")
                );

                orders.add(order);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return orders;
    }
}

