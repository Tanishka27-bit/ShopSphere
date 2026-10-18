package com.shopsphere.serialization;

import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class DeserializationDemo {

    public static void main(String[] args) {

        try {

            // Serialized file open
            FileInputStream file =
                    new FileInputStream("product.ser");

            // ObjectInputStream
            ObjectInputStream input =
                    new ObjectInputStream(file);

            // Object ko wapas read karna
            ProductData product =
                    (ProductData) input.readObject();

            input.close();
            file.close();

            System.out.println(
                    "Product object deserialized successfully!"
            );

            System.out.println(
                    "Read Product: " + product
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
