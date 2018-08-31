package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsXboxServlet", urlPatterns = "/ads/xbox")
public class AdsXboxServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().getAttribute("user");
        request.setAttribute("ad", DaoFactory.getAdsDao().findByCategory("Xbox"));
        request.getRequestDispatcher("/WEB-INF/ads/xbox.jsp").forward(request,  response);
    }
}