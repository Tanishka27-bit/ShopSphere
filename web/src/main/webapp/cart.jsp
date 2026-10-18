<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>ShopSphere - Cart</title>

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
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        .cart-box {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px #ccc;
        }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid #ddd;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
        }

        .price {
            margin-top: 5px;
            color: #555;
        }

        .quantity {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity button {
            padding: 5px 10px;
            border: none;
            background-color: #222;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }

        .remove-btn {
            background-color: #d9534f !important;
        }

        .total {
            text-align: right;
            margin-top: 25px;
            font-size: 22px;
            font-weight: bold;
        }

        .checkout {
            display: block;
            margin: 25px 0 0 auto;
            padding: 12px 25px;
            background-color: #222;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .empty {
            text-align: center;
            padding: 40px;
            color: #777;
        }
.quantity {
    display: flex;
    align-items: center;
    gap: 10px;
}

.quantity button {
    width: 35px;
    height: 35px;
    border: none;
    border-radius: 5px;
    background-color: #222;
    color: white;
    font-size: 18px;
    cursor: pointer;
}

.quantity button:hover {
    background-color: #444;
}

.quantity span {
    min-width: 25px;
    text-align: center;
    font-weight: bold;
}

.quantity .remove-btn {
    width: auto;
    height: auto;
    padding: 8px 12px;
    margin-left: 10px;
    background-color: #e53935 !important;
    font-size: 14px;
}

.quantity .remove-btn:hover {
    background-color: #c62828 !important;
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

        <h1>&#128722; Your Cart</h1>

        <div class="cart-box">

            <div id="cart-items"></div>

            <div class="total" id="total">
                Total: &#8377;0
            </div>

           <button class="checkout" onclick="goToCheckout()">
    Proceed to Checkout
</button>

        </div>

    </div>

<script>

function loadCart() {

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    let cartItems = document.getElementById("cart-items");

    let total = 0;

    cartItems.innerHTML = "";

    if (cart.length === 0) {

        cartItems.innerHTML =
            '<div class="empty">Your cart is empty &#128722;</div>';

        document.getElementById("total").innerText =
            "Total: \u20B90";

        return;
    }

    cart.forEach(function(product, index) {

        let itemTotal = product.price * product.quantity;

        total = total + itemTotal;

        cartItems.innerHTML +=
            '<div class="cart-item">' +

                '<div>' +

                    '<div class="product-name">' +
                        product.name +
                    '</div>' +

                    '<div class="price">' +
                        '&#8377;' + product.price +
                    '</div>' +

                '</div>' +

                '<div class="quantity">' +

                    '<button onclick="decreaseQuantity(' + index + ')">' +
                        '-' +
                    '</button>' +

                    '<span>' +
                        product.quantity +
                    '</span>' +

                    '<button onclick="increaseQuantity(' + index + ')">' +
                        '+' +
                    '</button>' +

                    '<button class="remove-btn" onclick="removeProduct(' + index + ')">' +
                        'Remove' +
                    '</button>' +

                '</div>' +

            '</div>';

    });

    document.getElementById("total").innerText =
        "Total: \u20B9" + total;
}


function increaseQuantity(index) {

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    cart[index].quantity++;

    sessionStorage.setItem(
        "cart",
        JSON.stringify(cart)
    );

    loadCart();
}


function decreaseQuantity(index) {

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    if (cart[index].quantity > 1) {

        cart[index].quantity--;

    } else {

        cart.splice(index, 1);

    }

    sessionStorage.setItem(
        "cart",
        JSON.stringify(cart)
    );

    loadCart();
}


function removeProduct(index) {

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    cart.splice(index, 1);

    sessionStorage.setItem(
        "cart",
        JSON.stringify(cart)
    );

    loadCart();
}


function goToCheckout() {

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    if (cart.length === 0) {

        alert("Your cart is empty!");

        return;
    }

    window.location.href = "checkout.jsp";
}

loadCart();

</script>

    
</body>
</html>

