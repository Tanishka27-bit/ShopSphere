package com.shopsphere.swing;

import javax.swing.*;
import java.awt.*;

public class AdminPanel extends JFrame {

    public AdminPanel() {

        setTitle("ShopSphere Admin Panel");

        setSize(600, 400);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        setLocationRelativeTo(null);

        // Heading
        JLabel heading = new JLabel(
                "ShopSphere Admin Panel",
                SwingConstants.CENTER
        );

        heading.setFont(
                new Font("Arial", Font.BOLD, 24)
        );

        // Buttons
        JButton usersButton =
                new JButton("Manage Users");

        JButton productsButton =
                new JButton("Manage Products");

        JButton ordersButton =
                new JButton("Manage Orders");

        JButton exitButton =
                new JButton("Exit");

        // Panel
        JPanel panel = new JPanel();

        panel.setLayout(
                new GridLayout(4, 1, 10, 10)
        );

        panel.setBorder(
                BorderFactory.createEmptyBorder(
                        30, 100, 30, 100
                )
        );

        panel.add(usersButton);
        panel.add(productsButton);
        panel.add(ordersButton);
        panel.add(exitButton);

        // Exit button
        exitButton.addActionListener(e -> {
            System.exit(0);
        });

        // Main layout
        setLayout(new BorderLayout());

        add(heading, BorderLayout.NORTH);

        add(panel, BorderLayout.CENTER);
    }

    public static void main(String[] args) {

        SwingUtilities.invokeLater(() -> {

            AdminPanel adminPanel =
                    new AdminPanel();

            adminPanel.setVisible(true);
        });
    }
}
