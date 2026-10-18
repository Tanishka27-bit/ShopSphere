package com.shopsphere.socket;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class Server {

    public static void main(String[] args) {

        try {

            // Server port 5000 par start hoga
            ServerSocket serverSocket =
                    new ServerSocket(5000);

            System.out.println(
                    "Server started. Waiting for client..."
            );

            // Client connection ka wait
            Socket socket =
                    serverSocket.accept();

            System.out.println(
                    "Client connected!"
            );

            // Client se message read karna
            BufferedReader reader =
                    new BufferedReader(
                            new InputStreamReader(
                                    socket.getInputStream()
                            )
                    );

            String message = reader.readLine();

            System.out.println(
                    "Client Message: " + message
            );

            // Connections close
            reader.close();
            socket.close();
            serverSocket.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}
