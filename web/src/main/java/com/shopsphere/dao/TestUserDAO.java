package com.shopsphere.dao;

import com.shopsphere.model.User;

public class TestUserDAO {

    public static void main(String[] args) {

        User user = new User();

        user.setName("Tanishka");
        user.setEmail("tanishka@gmail.com");
        user.setPassword("12345");
        user.setMobile("9876543210");
        user.setRole("USER");
        user.setStatus("1");

        UserDAO dao = new UserDAO();

        boolean result = dao.registerUser(user);

        if (result) {
            System.out.println("User registered successfully!");
        } else {
            System.out.println("User registration failed!");
        }
    }
}