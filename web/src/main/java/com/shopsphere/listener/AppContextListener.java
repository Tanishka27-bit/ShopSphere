package com.shopsphere.listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {

        System.out.println("ShopSphere Application Started Successfully!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {

        System.out.println("ShopSphere Application Stopped!");
    }
}