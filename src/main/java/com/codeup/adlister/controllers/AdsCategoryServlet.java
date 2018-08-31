package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdsCategoryServlet", urlPatterns = "/ads/category")
public class AdsCategoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int id = Integer.parseInt(request.getParameter("cat"));
        List<Ad> ads = DaoFactory.getAdsDao().findByCategory(id);
        request.setAttribute("ads", ads);
        request.getRequestDispatcher("/WEB-INF/ads/category.jsp").forward(request,  response);

    }
}