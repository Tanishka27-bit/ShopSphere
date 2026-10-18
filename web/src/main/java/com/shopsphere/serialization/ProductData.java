package com.shopsphere.serialization;

import java.io.Serializable;

public class ProductData implements Serializable {

    private int productId;
    private String productName;
    private double price;

    public ProductData(int productId, String productName, double price) {

        this.productId = productId;
        this.productName = productName;
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {

        return "Product ID: " + productId +
               ", Product Name: " + productName +
               ", Price: ₹" + price;
    }
}

