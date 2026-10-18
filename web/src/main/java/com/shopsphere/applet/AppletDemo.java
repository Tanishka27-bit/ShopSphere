package com.shopsphere.applet;

/*
 * Java Applet Demo
 *
 * Note:
 * Applets were used to run Java programs inside web browsers.
 * Java Applet technology is now deprecated and removed
 * from modern Java versions such as Java 21.
 */

public class AppletDemo {

    public static void main(String[] args) {

        System.out.println("Java Applet Demo");

        System.out.println(
                "Applet is an old Java technology "
                + "used for browser-based applications."
        );

        System.out.println(
                "Modern Java 21 does not support Applets."
        );

        System.out.println(
                "Applet lifecycle: init() -> start() -> stop() -> destroy()"
        );
    }
}