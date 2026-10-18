<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.shopsphere.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>

    <title>ShopSphere - Products</title>

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
            margin-bottom: 8px;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #1f2937;
            color: white;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .active {
            background: #374151;
        }

    </style>

</head>

<body>

<div class="sidebar">

    <h2>ShopSphere</h2>

    <a href="dashboard.jsp">Dashboard</a>

    <a href="users.jsp">Users</a>

    <a href="products.jsp" class="active">Products</a>

    <a href="categories.jsp">Categories</a>

    <a href="orders.jsp">Orders</a>

</div>


<div class="main">

    <div class="header">

        <h1>Products Management</h1>

        <p>View all ShopSphere products.</p>

    </div>


    <table>

        <tr>
            <th>Product ID</th>
            <th>Name</th>
            <th>Brand</th>
            <th>Price</th>
            <th>Discount</th>
            <th>Stock</th>
            <th>Status</th>
        </tr>


        <%

            try {

                Connection con = DBConnection.getConnection();

                String sql = "SELECT product_id, name, brand, price, discount, stock, status FROM products";

                PreparedStatement ps = con.prepareStatement(sql);

                ResultSet rs = ps.executeQuery();


                while (rs.next()) {

        %>


        <tr>

            <td>
                <%= rs.getInt("product_id") %>
            </td>

            <td>
                <%= rs.getString("name") %>
            </td>

            <td>
                <%= rs.getString("brand") %>
            </td>

            <td>
                ₹<%= rs.getDouble("price") %>
            </td>

            <td>
                <%= rs.getDouble("discount") %>%
            </td>

            <td>
                <%= rs.getInt("stock") %>
            </td>

            <td>
                <%= rs.getInt("status") == 1 ? "Active" : "Inactive" %>
            </td>

        </tr>


        <%

                }

                rs.close();

                ps.close();

                con.close();

            } catch (Exception e) {

        %>


        <tr>

            <td colspan="7">

                Error loading products:
                <%= e.getMessage() %>

            </td>

        </tr>


        <%

            }

        %>


    </table>

</div>

</body>

</html>