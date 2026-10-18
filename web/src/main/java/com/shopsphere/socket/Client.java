package com.shopsphere.socket;

import java.io.PrintWriter;
import java.net.Socket;

public class Client {

    public static void main(String[] args) {

        try {

            // Server se connect
            Socket socket =
                    new Socket("localhost", 5000);

            System.out.println(
                    "Connected to server!"
            );

            // Server ko message bhejna
            PrintWriter writer =
                    new PrintWriter(
                            socket.getOutputStream(),
                            true
                    );

            writer.println(
                    "Hello from ShopSphere Client!"
            );

            // Connection close
            writer.close();
            socket.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
