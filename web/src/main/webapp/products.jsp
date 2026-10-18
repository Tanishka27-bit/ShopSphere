<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Products</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f7f7fc;
            color: #25243a;
            min-height: 100vh;
        }

        /* NAVBAR */
        .navbar {
            background: #191827;
            color: white;
            padding: 20px 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.10);
        }

        .logo {
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 24px;
        }

        .nav-links a {
            color: #f3f1ff;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #b9adff;
        }

        /* PAGE HEADING */
        .title {
            text-align: center;
            padding: 60px 20px 25px;
        }

        .title-label {
            display: inline-block;
            color: #6354df;
            background: #eeebff;
            padding: 8px 16px;
            border-radius: 30px;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 1.5px;
            margin-bottom: 18px;
        }

        .title h1 {
            font-size: clamp(32px, 4vw, 44px);
            font-weight: 800;
            letter-spacing: -1px;
            margin-bottom: 12px;
            color: #211f35;
        }

        .title p {
            color: #77758b;
            font-size: 16px;
            line-height: 1.7;
        }

        /* PRODUCT GRID */
        .products {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 25px;
            max-width: 1400px;
            margin: 0 auto;
            padding: 35px 5% 75px;
            align-items: stretch;
        }

        /* PRODUCT CARD */
        .product-card {
            min-width: 0;
            background: #ffffff;
            padding: 18px;
            border: 1px solid #eceaf5;
            border-radius: 18px;
            text-align: left;
            box-shadow: 0 5px 20px rgba(36, 31, 75, 0.05);
            display: flex;
            flex-direction: column;
            transition: transform 0.3s ease,
                        box-shadow 0.3s ease,
                        border-color 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 16px 35px rgba(65, 52, 135, 0.13);
            border-color: #d9d2ff;
        }

        /* PRODUCT ICON */
        .product-image {
            height: 185px;
            flex-shrink: 0;
            background: linear-gradient(135deg, #f0edff, #e7e5ff);
            border-radius: 13px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 76px;
            margin-bottom: 20px;
        }

        .product-card:nth-child(2) .product-image {
            background: linear-gradient(135deg, #e5f8f0, #d7f2e6);
        }

        .product-card:nth-child(3) .product-image {
            background: linear-gradient(135deg, #fff0e4, #ffe4d1);
        }

        .product-card:nth-child(4) .product-image {
            background: linear-gradient(135deg, #e6f2ff, #d8eaff);
        }

        .product-card:nth-child(5) .product-image {
            background: linear-gradient(135deg, #fce8f3, #f8dced);
        }

        .product-card:nth-child(6) .product-image {
            background: linear-gradient(135deg, #fff5d9, #ffebba);
        }

        /* PRODUCT DETAILS */
        .product-card h3 {
            font-size: 19px;
            line-height: 1.4;
            margin: 0 0 10px;
            color: #25243a;
        }

        .product-card p {
            color: #77758b;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 12px;
        }

        /* PRICE */
        .price {
            font-size: 22px;
            font-weight: 800;
            color: #5947d9;
            margin: 8px 0 14px;
        }

        /* STOCK */
        .stock {
            display: inline-block;
            align-self: flex-start;
            background: #e9f8ef;
            color: #21804b;
            border-radius: 6px;
            padding: 6px 10px;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 18px;
        }

        /* ADD TO CART */
        .cart-btn {
            width: 100%;
            margin-top: auto;
            padding: 13px 12px;
            border: none;
            border-radius: 9px;
            background: linear-gradient(135deg, #6855e8, #5140ce);
            color: white;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 5px 12px rgba(89, 71, 217, 0.18);
            transition: all 0.25s ease;
        }

        .cart-btn:hover:not(:disabled) {
            background: linear-gradient(135deg, #5542d2, #4030b4);
            transform: translateY(-2px);
            box-shadow: 0 8px 17px rgba(89, 71, 217, 0.25);
        }

        .cart-btn:active:not(:disabled) {
            transform: scale(0.98);
        }

        .cart-btn:disabled {
            background: #d8d7e0;
            color: #777586;
            box-shadow: none;
            cursor: not-allowed;
        }

        /* EMPTY PRODUCTS */
        .products > p {
            grid-column: 1 / -1;
            text-align: center;
            padding: 40px 20px;
            color: #77758b;
            font-size: 17px;
            background: white;
            border-radius: 14px;
        }

        /* TABLET */
        @media (max-width: 1100px) {
            .products {
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 20px;
            }

            .product-image {
                height: 160px;
            }
        }

        /* SMALL TABLET */
        @media (max-width: 800px) {
            .products {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                padding-left: 4%;
                padding-right: 4%;
                gap: 18px;
            }

            .navbar {
                padding: 18px 4%;
            }

            .nav-links {
                gap: 16px;
            }

            .product-image {
                height: 155px;
            }
        }

        /* MOBILE */
        @media (max-width: 520px) {
            .navbar {
                justify-content: center;
                text-align: center;
            }

            .logo {
                width: 100%;
            }

            .nav-links {
                justify-content: center;
                gap: 13px;
            }

            .nav-links a {
                font-size: 13px;
            }

            .title {
                padding: 45px 18px 15px;
            }

            .products {
                grid-template-columns: 1fr;
                padding: 25px 18px 45px;
                gap: 20px;
            }

            .product-card {
                padding: 18px;
            }

            .product-image {
                height: 200px;
                font-size: 82px;
            }
        }
    </style>
</head>

<body>

    <%@ include file="fragments/navbar.jsp" %>

    <div class="title">
        <div class="title-label">DISCOVER YOUR NEXT FAVOURITE</div>

        <h1>Our Products</h1>

        <p>Explore our collection and find something you love.</p>
    </div>

    <div class="products">

        <c:forEach var="product" items="${products}">

            <div class="product-card">

                <div class="product-image">
                    <c:choose>
                        <c:when test="${product.productId == 1}">
                            &#128095;
                        </c:when>

                        <c:when test="${product.productId == 2}">
                            &#127911;
                        </c:when>

                        <c:when test="${product.productId == 3}">
                            &#8986;
                        </c:when>

                        <c:when test="${product.productId == 4}">
                            &#127890;
                        </c:when>

                        <c:when test="${product.productId == 5}">
                            &#128241;
                        </c:when>

                        <c:when test="${product.productId == 6}">
                            &#128085;
                        </c:when>

                        <c:otherwise>
                            &#128722;
                        </c:otherwise>
                    </c:choose>
                </div>

                <h3>
                    <c:out value="${product.name}" />
                </h3>

                <p>
                    <c:out value="${product.description}" />
                </p>

                <div class="price">
                    &#8377;<c:out value="${product.price}" />
                </div>

                <div class="stock">
                    Stock: <c:out value="${product.stock}" />
                </div>

                <c:choose>

                    <c:when test="${product.stock > 0}">
                        <button
                            type="button"
                            class="cart-btn"
                            onclick="addToCart(
                                '${product.productId}',
                                '${product.name}',
                                '${product.price}'
                            )">
                            Add to Cart
                        </button>
                    </c:when>

                    <c:otherwise>
                        <button
                            type="button"
                            class="cart-btn"
                            disabled>
                            Out of Stock
                        </button>
                    </c:otherwise>

                </c:choose>

            </div>

        </c:forEach>

        <c:if test="${empty products}">
            <p>No products available.</p>
        </c:if>

    </div>

    <script>
        function addToCart(productId, name, price) {

            let cart = JSON.parse(
                sessionStorage.getItem("cart")
            ) || [];

            let existingProduct = cart.find(
                product => product.productId === productId
            );

            if (existingProduct) {
                existingProduct.quantity++;
            } else {
                cart.push({
                    productId: productId,
                    name: name,
                    price: price,
                    quantity: 1
                });
            }

            sessionStorage.setItem(
                "cart",
                JSON.stringify(cart)
            );

            alert(name + " added to cart!");
        }
    </script>

</body>
</html>