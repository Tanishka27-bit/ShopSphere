<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.shopsphere.model.OrderHistory" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - My Orders</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f7f6ff;
            color: #25233b;
            min-height: 100vh;
        }

        /* NAVBAR */
        .navbar {
            background: #191827;
            color: white;
            padding: 20px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.12);
        }

        .logo {
            font-size: 27px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 25px;
        }

        .nav-links a {
            color: #f3f1ff;
            text-decoration: none;
            font-size: 15px;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #b9adff;
        }

        /* MAIN CONTAINER */
        .container {
            width: 90%;
            max-width: 1050px;
            margin: 50px auto;
            min-height: 65vh;
        }

        /* PAGE HEADING */
        .title {
            text-align: center;
            margin-bottom: 40px;
        }

        .title-tag {
            display: inline-block;
            padding: 9px 17px;
            border-radius: 30px;
            background: #ece8ff;
            color: #6250dc;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1.5px;
            margin-bottom: 17px;
        }

        .title h1 {
            font-size: clamp(30px, 5vw, 43px);
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 12px;
        }

        .title p {
            color: #77758f;
            font-size: 16px;
            line-height: 1.7;
        }

        /* ORDER CARD */
        .order-card {
            background: white;
            padding: 30px;
            margin-bottom: 25px;
            border-radius: 20px;
            border: 1px solid #eeebfa;
            box-shadow: 0 8px 28px rgba(42, 33, 100, 0.07);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .order-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 35px rgba(42, 33, 100, 0.12);
        }

        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            border-bottom: 1px solid #eeeaf8;
            padding-bottom: 22px;
            margin-bottom: 20px;
        }

        .order-label {
            color: #85829d;
            font-size: 12px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1.3px;
            margin-bottom: 7px;
        }

        .order-id {
            font-size: 23px;
            font-weight: 800;
            color: #292640;
        }

        /* STATUS BADGE */
        .status {
            display: inline-flex;
            align-items: center;
            gap: 7px;
            padding: 10px 16px;
            border-radius: 30px;
            background: #e6f8ed;
            color: #168348;
            font-size: 12px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-dot {
            width: 7px;
            height: 7px;
            border-radius: 50%;
            background: currentColor;
        }

        /* ORDER DETAILS */
        .order-details {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 18px;
        }

        .detail {
            background: #faf9ff;
            border: 1px solid #f0edfb;
            padding: 19px;
            border-radius: 13px;
            min-width: 0;
        }

        .detail strong {
            display: block;
            margin-bottom: 10px;
            color: #85829d;
            font-size: 13px;
            font-weight: 700;
        }

        .detail-value {
            font-size: 16px;
            font-weight: 700;
            color: #302c49;
            overflow-wrap: anywhere;
        }

        .amount {
            font-size: 25px;
            font-weight: 800;
            color: #6048e8;
        }

        .payment-status {
            display: inline-block;
            padding: 6px 11px;
            border-radius: 8px;
            background: #fff2d9;
            color: #9a6200;
            font-size: 12px;
            font-weight: 800;
        }

        .date-detail {
            grid-column: 1 / -1;
        }

        /* EMPTY ORDERS */
        .empty {
            background: white;
            padding: 60px 25px;
            text-align: center;
            border-radius: 22px;
            border: 1px solid #eeebfa;
            box-shadow: 0 8px 28px rgba(42, 33, 100, 0.07);
        }

        .empty-icon {
            width: 90px;
            height: 90px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 23px;
            border-radius: 25px;
            background: #eeeaff;
            font-size: 42px;
        }

        .empty h2 {
            font-size: 27px;
            margin-bottom: 12px;
            color: #292640;
        }

        .empty p {
            color: #85829d;
            font-size: 15px;
            line-height: 1.7;
        }

        /* BUTTON */
        .shop-btn {
            display: inline-block;
            margin-top: 25px;
            padding: 14px 25px;
            background: linear-gradient(135deg, #7059ed, #5140ce);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            box-shadow: 0 7px 18px rgba(89, 71, 217, 0.22);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .shop-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 11px 24px rgba(89, 71, 217, 0.3);
        }

        /* FOOTER */
        .footer {
            text-align: center;
            padding: 25px 15px;
            color: #85829d;
            font-size: 13px;
            border-top: 1px solid #eeebfa;
            background: #fff;
        }

        /* RESPONSIVE */
        @media (max-width: 650px) {
            .navbar {
                justify-content: center;
                padding: 20px;
            }

            .logo {
                font-size: 24px;
            }

            .nav-links {
                justify-content: center;
                gap: 17px;
            }

            .container {
                width: 92%;
                margin: 35px auto;
            }

            .order-card {
                padding: 20px;
                border-radius: 16px;
            }

            .order-details {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .date-detail {
                grid-column: auto;
            }

            .detail {
                padding: 16px;
            }

            .amount {
                font-size: 22px;
            }

            .empty {
                padding: 40px 20px;
            }
        }

        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                transition: none !important;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">

        <div class="logo">
            &#128722; ShopSphere
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home.jsp">Home</a>

            <a href="${pageContext.request.contextPath}/products">Products</a>

            <a href="${pageContext.request.contextPath}/cart.jsp">Cart &#128722;</a>
        </div>

    </div>

    <!-- ORDERS SECTION -->
    <main class="container">

        <div class="title">
            <div class="title-tag">YOUR SHOPPING HISTORY</div>

            <h1>My Orders</h1>

            <p>Track your purchases and view your previous orders.</p>
        </div>

        <%
            List<OrderHistory> orders =
                (List<OrderHistory>) request.getAttribute("orders");

            if (orders == null || orders.isEmpty()) {
        %>

            <!-- EMPTY STATE -->
            <div class="empty">

                <div class="empty-icon">&#128230;</div>

                <h2>No Orders Yet</h2>

                <p>
                    You haven't placed any orders yet.<br>
                    Explore our collection and find something you love!
                </p>

                <a
                    href="${pageContext.request.contextPath}/products"
                    class="shop-btn">
                    Start Shopping &#8594;
                </a>

            </div>

        <%
            } else {
                for (OrderHistory order : orders) {

                    String orderStatus = order.getOrderStatus() == null
                        ? "UNKNOWN"
                        : order.getOrderStatus();

                    String normalizedStatus = orderStatus.toUpperCase();

                    String statusClass = "status";

                    if ("CANCELLED".equals(normalizedStatus)) {
                        statusClass += " cancelled";
                    } else if ("DELIVERED".equals(normalizedStatus)) {
                        statusClass += " delivered";
                    }
        %>

            <!-- ORDER CARD -->
            <div class="order-card">

                <div class="order-header">

                    <div>
                        <div class="order-label">Order Reference</div>

                        <div class="order-id">
                            Order #<%= order.getOrderId() %>
                        </div>
                    </div>

                    <div class="<%= statusClass %>">
                        <span class="status-dot"></span>
                        <%= orderStatus %>
                    </div>

                </div>

                <div class="order-details">

                    <div class="detail">
                        <strong>Total Amount</strong>

                        <div class="detail-value amount">
                            &#8377;<%= order.getTotalAmount() %>
                        </div>
                    </div>

                    <div class="detail">
                        <strong>Discount</strong>

                        <div class="detail-value">
                            &#8377;<%= order.getDiscount() %>
                        </div>
                    </div>

                    <div class="detail">
                        <strong>Payment Method</strong>

                        <div class="detail-value">
                            <%= order.getPaymentMethod() %>
                        </div>
                    </div>

                    <div class="detail">
                        <strong>Payment Status</strong>

                        <div class="detail-value">
                            <span class="payment-status">
                                <%= order.getPaymentStatus() %>
                            </span>
                        </div>
                    </div>

                    <div class="detail date-detail">
                        <strong>Order Date</strong>

                        <div class="detail-value">
                            <%= order.getCreatedAt() %>
                        </div>
                    </div>

                </div>

            </div>

        <%
                }
            }
        %>

    </main>

    <footer class="footer">
        &copy; 2026 ShopSphere. All rights reserved.
    </footer>

</body>
</html>