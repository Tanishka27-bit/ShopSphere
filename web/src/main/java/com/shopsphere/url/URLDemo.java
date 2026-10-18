package com.shopsphere.url;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class URLDemo {

    public static void main(String[] args) {

        try {

            // URL create
            URL url =
                    new URL("https://example.com");

            System.out.println(
                    "Protocol: " + url.getProtocol()
            );

            System.out.println(
                    "Host: " + url.getHost()
            );

            System.out.println(
                    "Port: " + url.getPort()
            );

            // URLConnection create
            URLConnection connection =
                    url.openConnection();

            System.out.println(
                    "Connection created successfully!"
            );

            // Website se data read
            BufferedReader reader =
                    new BufferedReader(
                            new InputStreamReader(
                                    connection.getInputStream()
                            )
                    );

            String line;

            while ((line = reader.readLine()) != null) {

                System.out.println(line);
            }

            reader.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}