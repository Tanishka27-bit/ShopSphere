<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
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
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 28px;
        font-weight: 800;
        letter-spacing: -0.5px;
        color: #ffffff;
        white-space: nowrap;
    }

    .logo-icon {
        font-size: 29px;
        line-height: 1;
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

    @media (max-width: 650px) {
        .navbar {
            justify-content: center;
        }

        .nav-links {
            justify-content: center;
            gap: 14px;
        }
    }
</style>

<div class="navbar">

    <div class="logo">
        <span class="logo-icon">&#128722;</span>
        <span>ShopSphere</span>
    </div>

    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/home.jsp">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/products">
            Products
        </a>

        <c:if test="${not empty sessionScope.user}">

            <a href="${pageContext.request.contextPath}/myOrders">
                My Orders
            </a>

            <a href="${pageContext.request.contextPath}/cart.jsp">
                Cart
            </a>

            <c:if test="${sessionScope.user.role == 'ADMIN'}">
                <a href="${pageContext.request.contextPath}/admin/dashboard.jsp">
                    Admin Dashboard
                </a>
            </c:if>

            <a href="${pageContext.request.contextPath}/logout">
                Logout
            </a>

        </c:if>

        <c:if test="${empty sessionScope.user}">

            <a href="${pageContext.request.contextPath}/login.jsp">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/register.jsp">
                Register
            </a>

        </c:if>

    </div>

</div>