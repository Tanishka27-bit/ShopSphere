package com.shopsphere.controller;

import com.shopsphere.model.Product;
import com.shopsphere.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Product> products = productService.getAllProducts();

        request.setAttribute("products", products);

        request.getRequestDispatcher("products.jsp")
               .forward(request, response);
    }
}
