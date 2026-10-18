<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>ShopSphere - Checkout</title>

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

        .container {
            width: 80%;
            max-width: 900px;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .checkout-box {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px #ccc;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        .order-summary {
            margin-top: 25px;
            padding: 20px;
            background-color: #f8f8f8;
            border-radius: 8px;
        }

        .order-summary h2 {
            margin-top: 0;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
        }

        .total {
            border-top: 1px solid #ccc;
            padding-top: 15px;
            margin-top: 15px;
            font-size: 20px;
            font-weight: bold;
        }

        .place-order {
            width: 100%;
            margin-top: 25px;
            padding: 14px;
            border: none;
            border-radius: 5px;
            background-color: #222;
            color: white;
            font-size: 17px;
            cursor: pointer;
        }

        .place-order:hover {
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

            <a href="cart.jsp">Cart &#128722;</a>

        </div>

    </div>


    <div class="container">

        <h1>Checkout</h1>

        <div class="checkout-box">

            <form action="placeOrder" method="post">

                <div class="form-group">

                    <label>Full Name</label>

                    <input
                        type="text"
                        id="name"
                        name="name"
                        placeholder="Enter your name"
                        required>

                </div>


                <div class="form-group">

                    <label>Mobile Number</label>

                    <input
                        type="tel"
                        id="mobile"
                        name="mobile"
                        placeholder="Enter mobile number"
                        required>

                </div>


                <div class="form-group">

                    <label>Address</label>

                    <textarea
                        id="address"
                        name="address"
                        placeholder="Enter your complete address"
                        required></textarea>

                </div>


                <div class="form-group">

                    <label>City</label>

                    <input
                        type="text"
                        id="city"
                        name="city"
                        placeholder="Enter city"
                        required>

                </div>


                <div class="form-group">

                    <label>State</label>

                    <input
                        type="text"
                        id="state"
                        name="state"
                        placeholder="Enter state"
                        required>

                </div>


                <div class="form-group">

                    <label>Pincode</label>

                    <input
                        type="text"
                        id="pincode"
                        name="pincode"
                        placeholder="Enter pincode"
                        required>

                </div>


                <div class="form-group">

                    <label>Payment Method</label>

                    <select
                        id="payment"
                        name="payment"
                        required>

                        <option value="">
                            Select Payment Method
                        </option>

                        <option value="COD">
                            Cash on Delivery
                        </option>

                        <option value="UPI">
                            UPI
                        </option>

                        <option value="CARD">
                            Debit / Credit Card
                        </option>

                    </select>

                </div>


                <div class="order-summary">

                    <h2>Order Summary</h2>

                    <div id="order-items"></div>

                    <div class="summary-row total">

                        <span>Total</span>

                        <span id="order-total">
                            ₹0
                        </span>

                    </div>

                </div>


                <input
                    type="hidden"
                    id="total"
                    name="total">


                <button
                    type="submit"
                    class="place-order">

                    Place Order

                </button>

            </form>

        </div>

    </div>


    <script>

        function loadOrderSummary() {

            let cart =
                JSON.parse(sessionStorage.getItem("cart")) || [];

            let orderItems =
                document.getElementById("order-items");

            let total = 0;

            orderItems.innerHTML = "";


            if (cart.length === 0) {

                orderItems.innerHTML =
                    "Your cart is empty.";

                document.getElementById("order-total").innerText =
                    "₹0";

                document.getElementById("total").value = "0";

                return;
            }


            cart.forEach(function(product) {

                // Price aur quantity ko number me convert karo
                let price =
                    Number(product.price);

                let quantity =
                    Number(product.quantity);


                // Invalid value check
                if (isNaN(price)) {
                    price = 0;
                }

                if (isNaN(quantity)) {
                    quantity = 0;
                }


                let itemTotal =
                    price * quantity;


                total += itemTotal;


                orderItems.innerHTML +=

                    '<div class="summary-row">' +

                        '<span>' +
                            product.name +
                            ' x ' +
                            quantity +
                        '</span>' +

                        '<span>' +
                            '₹' +
                            itemTotal +
                        '</span>' +

                    '</div>';

            });


            document.getElementById("order-total").innerText =
                "₹" + total;


            document.getElementById("total").value =
                total;

        }


        loadOrderSummary();


        // Cart products ko form ke saath server par bhejna

        document.querySelector("form").addEventListener(
            "submit",
            function() {

                let cart =
                    JSON.parse(
                        sessionStorage.getItem("cart")
                    ) || [];


                cart.forEach(function(product) {

                    let productIdInput =
                        document.createElement("input");

                    productIdInput.type = "hidden";
                    productIdInput.name = "productId";
                    productIdInput.value =
                        Number(product.productId);


                    let quantityInput =
                        document.createElement("input");

                    quantityInput.type = "hidden";
                    quantityInput.name = "quantity";
                    quantityInput.value =
                        Number(product.quantity);


                    let priceInput =
                        document.createElement("input");

                    priceInput.type = "hidden";
                    priceInput.name = "price";
                    priceInput.value =
                        Number(product.price);


                    this.appendChild(productIdInput);
                    this.appendChild(quantityInput);
                    this.appendChild(priceInput);

                });

            }
        );

    </script>

</body>
</html>
