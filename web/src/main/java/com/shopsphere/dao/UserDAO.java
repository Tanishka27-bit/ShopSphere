package com.shopsphere.dao;

import com.shopsphere.model.User;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {

    public boolean registerUser(User user) {

        String sql = "INSERT INTO users " +
                     "(name, email, password, mobile, role, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getRole());
            ps.setString(6, user.getStatus());

            int rows = ps.executeUpdate();

            return rows > 0;

        } 
            catch (Exception e) {

    e.printStackTrace();
    throw new RuntimeException(e);
}
        }

public User loginUser(String email, String password) {

    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, email);
        ps.setString(2, password);

        var rs = ps.executeQuery();

        if (rs.next()) {

            User user = new User();

            user.setUserId(rs.getInt("user_id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setMobile(rs.getString("mobile"));
            user.setRole(rs.getString("role"));
            user.setStatus(rs.getString("status"));

            return user;
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return null;
}


    }

