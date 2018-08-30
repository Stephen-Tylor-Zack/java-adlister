package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    public static String invalidUserError = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //  request.setAttribute("from", request.getParameter("from"));
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = DaoFactory.getUsersDao().findByUsername(username);
        if (user == null) {
            invalidUserError = " Invalid User Credentials";
            response.sendRedirect("/login");
            return;
        }

        boolean validAttempt = Password.check(password, user.getPassword());
        System.out.println(user.getId());
        if (validAttempt) {
            String referal = request.getParameter("from");
            invalidUserError = "";
            request.getSession().setAttribute("user", user);
            if (referal.equalsIgnoreCase("http://localhost:8080/login")) {
                response.sendRedirect("/profile");
            }
            else {
                response.sendRedirect(referal);
            }
        }
        else {
            invalidUserError = " Invalid User Credentials";
            response.sendRedirect("/login");
        }
    }
}