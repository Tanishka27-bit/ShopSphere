package com.shopsphere.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(urlPatterns = {
    "/cart.jsp",
    "/checkout.jsp",
    "/orders.jsp",
    "/my-orders.jsp"
})
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("user") != null) {

            // User logged in hai
            chain.doFilter(request, response);

        } else {

            // User logged in nahi hai
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
