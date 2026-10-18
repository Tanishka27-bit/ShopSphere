<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>ShopSphere - Order Successful</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        .navbar {
            background-color: #222;
            color: white;
            padding: 18px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 25px;
            font-weight: bold;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
        }

        .success-box {
            width: 90%;
            max-width: 600px;
            margin: 80px auto;
            background-color: white;
            padding: 50px 30px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 2px 15px #ccc;
        }

        .success-icon {
            font-size: 70px;
            margin-bottom: 15px;
        }

        h1 {
            margin-bottom: 15px;
        }

        p {
            font-size: 17px;
            color: #555;
            line-height: 1.6;
        }

        .buttons {
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 25px;
            margin: 5px;
            background-color: #222;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #444;
        }

    </style>

</head>

<body>

    <div class="navbar">

        <div class="logo">
            &#128717; ShopSphere
        </div>

        <div class="nav-links">

            <a href="home.jsp">Home</a>

            <a href="products.jsp">Products</a>

        </div>

    </div>


    <div class="success-box">

        <div class="success-icon">
            &#9989;
        </div>

        <h1>Order Placed Successfully!</h1>

        <p>
            Thank you for shopping with ShopSphere.
        </p>

        <p>
            Your order has been successfully placed.
        </p>

        <div class="buttons">

            <a href="products.jsp" class="btn">
                Continue Shopping
            </a>

            <a href="home.jsp" class="btn">
                Go to Home
            </a>

        </div>

    </div>

</body>
</html>
