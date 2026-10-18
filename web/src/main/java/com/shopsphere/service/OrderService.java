package com.shopsphere.service;

import com.shopsphere.dao.OrderDAO;
import com.shopsphere.model.Order;

public class OrderService {

    private OrderDAO orderDAO = new OrderDAO();

    public int placeOrderAndGetId(Order order) {
        return orderDAO.placeOrderAndGetId(order);
    }
}
