<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #eeebff, #f8f7ff, #e5e7ff);
            color: #24223a;
            display: flex;
            flex-direction: column;
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
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 27px;
            font-weight: 800;
            color: white;
        }

        .logo-icon {
            font-size: 29px;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 25px;
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

        /* MAIN */
        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 45px 20px;
        }

        .login-wrapper {
            display: grid;
            grid-template-columns: 1fr 1fr;
            max-width: 900px;
            width: 100%;
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(57, 43, 130, 0.14);
        }

        /* LEFT PANEL */
        .welcome-panel {
            background: linear-gradient(145deg, #6554e8, #4030ad);
            color: white;
            padding: 55px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .welcome-icon {
            font-size: 60px;
            margin-bottom: 25px;
        }

        .welcome-panel h1 {
            font-size: 35px;
            line-height: 1.25;
            margin-bottom: 18px;
        }

        .welcome-panel p {
            font-size: 15px;
            line-height: 1.9;
            color: #eeebff;
        }

        .welcome-tag {
            margin-top: 30px;
            padding: 11px 15px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            display: inline-block;
            width: fit-content;
            font-size: 13px;
        }

        /* RIGHT PANEL */
        .login-panel {
            padding: 55px 45px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .small-title {
            color: #6554e8;
            font-size: 12px;
            font-weight: 800;
            letter-spacing: 2px;
            margin-bottom: 12px;
        }

        .login-heading h2 {
            font-size: 32px;
            margin-bottom: 10px;
            color: #24223a;
        }

        .login-heading p {
            color: #858398;
            font-size: 14px;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        /* FORM */
        .form-group {
            margin-bottom: 21px;
        }

        .form-group label {
            display: block;
            margin-bottom: 9px;
            font-size: 14px;
            font-weight: 700;
            color: #343149;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 17px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 15px 14px 45px;
            border: 1px solid #e2e0ee;
            border-radius: 10px;
            outline: none;
            font-size: 14px;
            font-family: inherit;
            background: #fafaff;
            color: #24223a;
            transition: border-color 0.25s, box-shadow 0.25s;
        }

        .form-group input:focus {
            border-color: #6554e8;
            box-shadow: 0 0 0 4px rgba(101, 84, 232, 0.10);
            background: white;
        }

        .form-group input::placeholder {
            color: #aaa8bb;
        }

        /* BUTTON */
        .login-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #6855e8, #5140ce);
            color: white;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 5px;
            box-shadow: 0 7px 18px rgba(89, 71, 217, 0.22);
            transition: transform 0.25s, box-shadow 0.25s;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 11px 24px rgba(89, 71, 217, 0.30);
        }

        /* REGISTER */
        .register-text {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #858398;
        }

        .register-text a {
            color: #6554e8;
            font-weight: 700;
            text-decoration: none;
        }

        .register-text a:hover {
            text-decoration: underline;
        }

        .security-note {
            text-align: center;
            margin-top: 25px;
            color: #858398;
            font-size: 12px;
        }

        /* FOOTER */
        .footer {
            text-align: center;
            padding: 20px;
            color: #858398;
            font-size: 13px;
        }

        /* RESPONSIVE */
        @media (max-width: 700px) {
            .navbar {
                justify-content: center;
            }

            .logo {
                font-size: 23px;
            }

            .nav-links {
                justify-content: center;
                gap: 16px;
            }

            .login-wrapper {
                grid-template-columns: 1fr;
                max-width: 450px;
            }

            .welcome-panel {
                padding: 30px;
            }

            .welcome-icon {
                font-size: 42px;
                margin-bottom: 15px;
            }

            .welcome-panel h1 {
                font-size: 28px;
            }

            .welcome-tag {
                margin-top: 18px;
            }

            .login-panel {
                padding: 35px 25px;
            }

            .login-heading h2 {
                font-size: 28px;
            }
        }

        @media (max-width: 400px) {
            .nav-links {
                flex-wrap: wrap;
            }

            .main-container {
                padding: 25px 12px;
            }

            .welcome-panel,
            .login-panel {
                padding: 28px 22px;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">

        <div class="logo">
            <span class="logo-icon">&#128722;</span>
            <span>ShopSphere</span>
        </div>

        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/home.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/products">Products</a>
            <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
        </div>

    </div>

    <!-- LOGIN SECTION -->
    <main class="main-container">

        <div class="login-wrapper">

            <section class="welcome-panel">

                <div class="welcome-icon">&#128722;</div>

                <h1>Welcome Back!</h1>

                <p>
                    Your favourite products are just a few clicks away.
                    Sign in to explore our collection, manage your cart
                    and keep track of your orders.
                </p>

                <div class="welcome-tag">
                    Shop Smart. Shop Easy. ShopSphere.
                </div>

            </section>

            <section class="login-panel">

                <div class="login-heading">

                    <div class="small-title">
                        YOUR SHOPPING JOURNEY
                    </div>

                    <h2>Sign In</h2>

                    <p>
                        Enter your account details to continue shopping.
                    </p>

                </div>

                <!-- Existing login servlet preserved -->
                <form action="login" method="post">

                    <div class="form-group">

                        <label for="email">Email Address</label>

                        <div class="input-wrapper">

                            <span class="input-icon">&#9993;</span>

                            <input
                                type="email"
                                id="email"
                                name="email"
                                placeholder="Enter your email"
                                autocomplete="username"
                                required>

                        </div>

                    </div>

                    <div class="form-group">

                        <label for="password">Password</label>

                        <div class="input-wrapper">

                            <span class="input-icon">&#128274;</span>

                            <input
                                type="password"
                                id="password"
                                name="password"
                                placeholder="Enter your password"
                                autocomplete="current-password"
                                required>

                        </div>

                    </div>

                    <button type="submit" class="login-btn">
                        Sign In to ShopSphere &#8594;
                    </button>

                </form>

                <div class="register-text">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/register.jsp">
                        Create Account
                    </a>
                </div>

                <div class="security-note">
                    &#128274; Please keep your password private.
                </div>

            </section>

        </div>

    </main>

    <footer class="footer">
        &copy; 2026 ShopSphere. All rights reserved.
    </footer>

</body>
</html>