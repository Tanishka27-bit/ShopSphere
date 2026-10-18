package com.shopsphere.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class RMIClient {

    public static void main(String[] args) {

        try {

            // RMI Registry se connect
            Registry registry =
                    LocateRegistry.getRegistry(
                            "localhost",
                            1099
                    );

            // Remote object lookup
            Calculator calculator =
                    (Calculator) registry.lookup(
                            "Calculator"
                    );

            // Remote methods call
            int result1 =
                    calculator.add(10, 20);

            int result2 =
                    calculator.subtract(20, 10);

            System.out.println(
                    "10 + 20 = " + result1
            );

            System.out.println(
                    "20 - 10 = " + result2
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}