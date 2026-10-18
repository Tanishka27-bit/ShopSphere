package com.shopsphere.listener;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent event) {

        System.out.println("New User Session Created!");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {

        System.out.println("User Session Destroyed!");
    }
}