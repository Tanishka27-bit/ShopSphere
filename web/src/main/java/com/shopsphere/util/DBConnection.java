package com.shopsphere.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/shopsphere1";

    private static final String USER = "root";

    private static final String PASSWORD = "";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("Database connected successfully!");

            return con;

        } catch (Exception e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Database Connection Failed: " + e.getMessage()
            );
        }
    }
}