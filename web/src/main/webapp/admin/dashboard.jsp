<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.shopsphere.util.DBConnection" %>

<%
    int userCount = 0;
    int productCount = 0;
    int orderCount = 0;
    int categoryCount = 0;

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps1 =
            con.prepareStatement("SELECT COUNT(*) FROM users");
        ResultSet rs1 = ps1.executeQuery();

        if (rs1.next()) {
            userCount = rs1.getInt(1);
        }

        PreparedStatement ps2 =
            con.prepareStatement("SELECT COUNT(*) FROM products");
        ResultSet rs2 = ps2.executeQuery();

        if (rs2.next()) {
            productCount = rs2.getInt(1);
        }

        PreparedStatement ps3 =
            con.prepareStatement("SELECT COUNT(*) FROM orders");
        ResultSet rs3 = ps3.executeQuery();

        if (rs3.next()) {
            orderCount = rs3.getInt(1);
        }

        PreparedStatement ps4 =
            con.prepareStatement("SELECT COUNT(*) FROM categories");
        ResultSet rs4 = ps4.executeQuery();

        if (rs4.next()) {
            categoryCount = rs4.getInt(1);
        }

        rs1.close();
        ps1.close();

        rs2.close();
        ps2.close();

        rs3.close();
        ps3.close();

        rs4.close();
        ps4.close();

        con.close();

    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
%>

<!DOCTYPE html>
<html>
<head>

    <title>ShopSphere Admin Dashboard</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 230px;
            height: 100vh;
            background: #1f2937;
            color: white;
            padding: 25px 15px;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 35px;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 13px 15px;
            margin: 8px 0;
            border-radius: 6px;
        }

        .sidebar a:hover {
            background: #374151;
        }

        .main {
            margin-left: 230px;
            padding: 30px;
        }

        .header {
            background: white;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .header h1 {
            color: #222;
            margin-bottom: 8px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }

        .card h3 {
            color: #555;
            margin-bottom: 12px;
        }

        .card p {
            font-size: 28px;
            font-weight: bold;
            color: #222;
        }

    </style>

</head>

<body>

    <div class="sidebar">

        <h2>ShopSphere</h2>

        <a href="dashboard.jsp">Dashboard</a>
        <a href="users.jsp">Users</a>
        <a href="products.jsp">Products</a>
        <a href="categories.jsp">Categories</a>
        <a href="orders.jsp">Orders</a>

    </div>


    <div class="main">

        <div class="header">

            <h1>Admin Dashboard</h1>

            <p>Welcome Admin! Manage your ShopSphere store from here.</p>

        </div>


        <div class="cards">

            <div class="card">

                <h3>Total Users</h3>

                <p><%= userCount %></p>

            </div>


            <div class="card">

                <h3>Total Products</h3>

                <p><%= productCount %></p>

            </div>


            <div class="card">

                <h3>Total Orders</h3>

                <p><%= orderCount %></p>

            </div>


            <div class="card">

                <h3>Categories</h3>

                <p><%= categoryCount %></p>

            </div>

        </div>

    </div>

</body>
</html>