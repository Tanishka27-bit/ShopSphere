package com.shopsphere.dao;

import com.shopsphere.model.Order;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderDAO {

    public int placeOrderAndGetId(Order order) {

        String sql = "INSERT INTO orders " +
                     "(user_id, address_id, total_amount, discount, " +
                     "payment_method, payment_status, order_status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    sql,
                    PreparedStatement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getAddressId());
            ps.setDouble(3, order.getTotalAmount());
            ps.setDouble(4, order.getDiscount());
            ps.setString(5, order.getPaymentMethod());
            ps.setString(6, order.getPaymentStatus());
            ps.setString(7, order.getOrderStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {

                int orderId = rs.getInt(1);

                rs.close();
                ps.close();
                con.close();

                return orderId;
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return 0;
    }
}
