package com.shopsphere.serialization;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

public class SerializationDemo {

    public static void main(String[] args) {

        try {

            // Product object create
            ProductData product =
                    new ProductData(
                            101,
                            "Smart Watch",
                            2499.0
                    );

            // File create
            FileOutputStream file =
                    new FileOutputStream(
                            "product.ser"
                    );

            // ObjectOutputStream
            ObjectOutputStream output =
                    new ObjectOutputStream(file);

            // Object ko file mein save
            output.writeObject(product);

            output.close();
            file.close();

            System.out.println(
                    "Product object serialized successfully!"
            );

            System.out.println(
                    "Saved Product: " + product
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}