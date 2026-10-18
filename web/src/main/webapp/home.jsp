<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Home</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f7f8fc;
            color: #20212a;
        }

        /* NAVBAR */
        .navbar {
            background: #171923;
            color: white;
            padding: 20px 6%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.12);
        }

        .logo {
            font-size: 27px;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 25px;
        }

        .nav-links a {
            color: #eeeeF5;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #a5b4fc;
        }

        /* WELCOME MESSAGE */
        .welcome-message {
            text-align: center;
            padding: 14px;
            background: #eef2ff;
            color: #4338ca;
            font-size: 14px;
            font-weight: 600;
        }

        /* HERO SECTION */
        .hero {
            position: relative;
            overflow: hidden;
            text-align: center;
            padding: 100px 20px 95px;
            background: linear-gradient(
                135deg,
                #eef2ff 0%,
                #f8f7ff 50%,
                #e9e7ff 100%
            );
        }

        .hero::before {
            content: "";
            position: absolute;
            width: 280px;
            height: 280px;
            border-radius: 50%;
            background: rgba(129, 140, 248, 0.13);
            top: -120px;
            right: -50px;
        }

        .hero::after {
            content: "";
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(167, 139, 250, 0.12);
            bottom: -100px;
            left: -30px;
        }

        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: auto;
        }

        .hero-badge {
            display: inline-block;
            background: white;
            color: #4f46e5;
            padding: 9px 18px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(79, 70, 229, 0.08);
        }

        .hero h1 {
            font-size: clamp(34px, 5vw, 58px);
            line-height: 1.15;
            margin-bottom: 20px;
            font-weight: 800;
            letter-spacing: -1.5px;
            color: #171923;
        }

        .hero h1 span {
            color: #5b4be8;
        }

        .hero-description {
            font-size: 18px;
            color: #64677a;
            line-height: 1.8;
            max-width: 600px;
            margin: 0 auto 12px;
        }

        .user-info {
            font-size: 14px;
            color: #555a70;
            margin-top: 18px;
        }

        .hero-actions {
            margin-top: 32px;
        }

        .shop-btn {
            display: inline-block;
            padding: 15px 32px;
            background: #5546e8;
            color: white;
            text-decoration: none;
            border-radius: 9px;
            font-size: 16px;
            font-weight: 700;
            box-shadow: 0 8px 20px rgba(85, 70, 232, 0.25);
            transition: all 0.3s ease;
        }

        .shop-btn:hover {
            background: #4032c7;
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(85, 70, 232, 0.32);
        }

        /* FEATURED PRODUCTS */
        .products {
            padding: 75px 6%;
            text-align: center;
        }

        .section-label {
            color: #5b4be8;
            font-size: 12px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 12px;
        }

        .products h2 {
            font-size: 34px;
            font-weight: 800;
            margin-bottom: 12px;
            color: #20212a;
        }

        .section-description {
            color: #777b8c;
            font-size: 16px;
            margin-bottom: 40px;
        }

        .product-container {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 24px;
            max-width: 1250px;
            margin: 0 auto;
        }

        .product {
            background: white;
            padding: 30px 22px;
            border-radius: 18px;
            border: 1px solid #ececf4;
            box-shadow: 0 5px 20px rgba(29, 33, 60, 0.04);
            text-align: left;
            transition: all 0.3s ease;
        }

        .product:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 35px rgba(29, 33, 60, 0.11);
            border-color: #d8d3ff;
        }

        .product-icon {
            width: 65px;
            height: 65px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f0efff;
            border-radius: 16px;
            font-size: 32px;
            margin-bottom: 24px;
        }

        .product:nth-child(2) .product-icon {
            background: #e9f8f0;
        }

        .product:nth-child(3) .product-icon {
            background: #fff0e6;
        }

        .product:nth-child(4) .product-icon {
            background: #e8f3ff;
        }

        .product h3 {
            font-size: 19px;
            margin-bottom: 10px;
            color: #242536;
        }

        .product p {
            color: #777b8c;
            font-size: 14px;
            line-height: 1.6;
            min-height: 23px;
        }

        .product-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-top: 24px;
            padding-top: 18px;
            border-top: 1px solid #f0f0f5;
        }

        .price {
            font-weight: 800;
            font-size: 19px;
            color: #4f46e5;
        }

        .view-link {
            color: #555;
            font-size: 13px;
            font-weight: 700;
            text-decoration: none;
        }

        .view-link:hover {
            color: #4f46e5;
        }

        /* BOTTOM BANNER */
        .bottom-banner {
            max-width: 1250px;
            margin: 0 auto 70px;
            padding: 35px 30px;
            width: 88%;
            background: #202033;
            border-radius: 18px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .bottom-banner h3 {
            font-size: 23px;
            margin-bottom: 8px;
        }

        .bottom-banner p {
            color: #c9c9d9;
            font-size: 14px;
            line-height: 1.7;
        }

        .banner-btn {
            display: inline-block;
            padding: 13px 23px;
            background: white;
            color: #27243d;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 700;
            white-space: nowrap;
            transition: 0.3s;
        }

        .banner-btn:hover {
            background: #e8e6ff;
            transform: translateY(-2px);
        }

        /* FOOTER */
        .footer {
            background: #171923;
            color: #c8cad5;
            text-align: center;
            padding: 25px 15px;
            font-size: 13px;
        }

        /* RESPONSIVE DESIGN */
        @media (max-width: 1000px) {
            .product-container {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .navbar {
                padding: 18px 4%;
            }

            .nav-links {
                gap: 16px;
            }
        }

        @media (max-width: 600px) {
            .navbar {
                justify-content: center;
                text-align: center;
            }

            .logo {
                width: 100%;
            }

            .nav-links {
                justify-content: center;
                gap: 14px;
            }

            .nav-links a {
                font-size: 13px;
                margin-left: 0;
            }

            .hero {
                padding: 70px 20px;
            }

            .hero-description {
                font-size: 16px;
            }

            .products {
                padding: 55px 20px;
            }

            .products h2 {
                font-size: 28px;
            }

            .product-container {
                grid-template-columns: 1fr;
            }

            .product {
                padding: 25px;
            }

            .bottom-banner {
                width: calc(100% - 40px);
                margin-bottom: 40px;
                padding: 28px 22px;
            }

            .bottom-banner h3 {
                font-size: 21px;
            }
        }
    </style>
</head>

<body>

    <%@ include file="fragments/navbar.jsp" %>

    <div class="welcome-message">
        <my:message message="Welcome to ShopSphere!" />
    </div>

    <section class="hero">
        <div class="hero-content">

            <div class="hero-badge">
                YOUR EVERYDAY SHOPPING DESTINATION
            </div>

            <h1>
                Welcome,
                <span>
                    <c:out value="${sessionScope.user.name}" default="Shopper" />
                </span>!
            </h1>

            <p class="hero-description">
                Shop smart. Discover more. Find the products you love
                with a shopping experience designed around you.
            </p>

            <p class="user-info">
                Logged in as: ${sessionScope.user.email}
            </p>

            <div class="hero-actions">
                <a href="${pageContext.request.contextPath}/products"
                   class="shop-btn">
                    Explore Products &rarr;
                </a>
            </div>

        </div>
    </section>

    <section class="products">

        <div class="section-label">OUR COLLECTION</div>

        <h2>Featured Products</h2>

        <p class="section-description">
            Discover everyday essentials picked just for you.
        </p>

        <div class="product-container">

            <div class="product">
                <div class="product-icon">&#8986;</div>

                <h3>Smart Watch</h3>

                <p>Smart features for your everyday lifestyle.</p>

                <div class="product-bottom">
                    <div class="price">&#8377;1,999</div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="view-link">
                        Explore &rarr;
                    </a>
                </div>
            </div>

            <div class="product">
                <div class="product-icon">&#127911;</div>

                <h3>Headphones</h3>

                <p>Enjoy your favourite music with clear sound.</p>

                <div class="product-bottom">
                    <div class="price">&#8377;1,499</div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="view-link">
                        Explore &rarr;
                    </a>
                </div>
            </div>

            <div class="product">
                <div class="product-icon">&#128095;</div>

                <h3>Sneakers</h3>

                <p>Everyday comfort with a modern look.</p>

                <div class="product-bottom">
                    <div class="price">&#8377;2,499</div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="view-link">
                        Explore &rarr;
                    </a>
                </div>
            </div>

            <div class="product">
                <div class="product-icon">&#127890;</div>

                <h3>Backpack</h3>

                <p>Carry your essentials wherever you go.</p>

                <div class="product-bottom">
                    <div class="price">&#8377;999</div>

                    <a href="${pageContext.request.contextPath}/products"
                       class="view-link">
                        Explore &rarr;
                    </a>
                </div>
            </div>

        </div>
    </section>

    <section class="bottom-banner">

        <div>
            <h3>Ready to find your next favourite?</h3>

            <p>
                Explore our products and discover something you'll love.
            </p>
        </div>

        <a href="${pageContext.request.contextPath}/products"
           class="banner-btn">
            Start Shopping &rarr;
        </a>

    </section>

    <footer class="footer">
        &copy; 2026 ShopSphere. Shop Smart. Shop Easy.
    </footer>

</body>
</html>