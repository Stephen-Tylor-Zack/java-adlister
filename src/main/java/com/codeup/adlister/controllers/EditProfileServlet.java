package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;

@WebServlet(name = "controllers.EditProfileServlet", urlPatterns = "/edit-profile")
public class EditProfileServlet extends HttpServlet {
    public static String error = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/edit-profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Long id = Long.valueOf(request.getParameter("id"));
        try {
            User user = new User(id, username, email, password);
            DaoFactory.getUsersDao().update(user);
            request.getSession().setAttribute("user", user);
            response.sendRedirect("/profile");
        }catch (Exception e) {
            response.sendRedirect("/profile");

        }


    }
}