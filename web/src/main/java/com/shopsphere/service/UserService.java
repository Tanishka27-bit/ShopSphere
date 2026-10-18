package com.shopsphere.service;

import com.shopsphere.dao.UserDAO;
import com.shopsphere.model.User;

public class UserService {

    private UserDAO userDAO = new UserDAO();

    public boolean registerUser(User user) {
        return userDAO.registerUser(user);
    }

    public User loginUser(String email, String password) {
        return userDAO.loginUser(email, password);
    }
}