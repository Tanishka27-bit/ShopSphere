package com.shopsphere.dao;

import com.shopsphere.model.Address;
import com.shopsphere.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AddressDAO {

    public int saveAddress(Address address) {

        String sql = "INSERT INTO addresses " +
                     "(user_id, address_line, city, state, pincode) " +
                     "VALUES (?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    sql,
                    PreparedStatement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, address.getUserId());
            ps.setString(2, address.getAddressLine());
            ps.setString(3, address.getCity());
            ps.setString(4, address.getState());
            ps.setString(5, address.getPincode());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                int addressId = rs.getInt(1);

                rs.close();
                ps.close();
                con.close();

                return addressId;
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


