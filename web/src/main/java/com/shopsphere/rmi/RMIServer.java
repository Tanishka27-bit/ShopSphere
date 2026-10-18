package com.shopsphere.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class RMIServer {

    public static void main(String[] args) {

        try {

            // RMI Registry start karo
            Registry registry =
                    LocateRegistry.createRegistry(1099);

            // Remote object create karo
            CalculatorImpl calculator =
                    new CalculatorImpl();

            // Registry mein object bind karo
            registry.rebind(
                    "Calculator",
                    calculator
            );

            System.out.println(
                    "RMI Server started..."
            );

            System.out.println(
                    "Waiting for client..."
            );

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}