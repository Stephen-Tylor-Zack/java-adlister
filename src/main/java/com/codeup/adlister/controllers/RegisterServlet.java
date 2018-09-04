package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    public static String error = "";
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");


        try {
            User user = new User(username, email, password);
            DaoFactory.getUsersDao().insert(user);
            error = "";
            response.sendRedirect("/login");

        } catch (Exception e) {
            if (DaoFactory.getUsersDao().findByUsername(username) != null) {
                System.out.println("test2");

                error = "\n\n Error, username is already taken.";
                response.sendRedirect("/register");
                return;
            }
            if (DaoFactory.getUsersDao().findByEmail(email) != null) {
                System.out.println("test1");

                error = "\n\n Error, email is already taken.";
                response.sendRedirect("/register");
                return;
            }
        }
    }
}
