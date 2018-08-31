package com.codeup.adlister.controllers;

import callback.OnSuccessCallback;
import org.json.JSONArray;
import wrapper.IGDBWrapper;
import wrapper.Parameters;
import wrapper.Version;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

@WebServlet(name = "controllers.HelloWorldServlet", urlPatterns = "/hello")
public class HelloWorldServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String query = request.getQueryString();
        String decoded = URLDecoder.decode(query, "UTF-8");
        String title = decoded.substring(7);
        System.out.println();
        IGDBWrapper wrapper = new IGDBWrapper("15e6d11f7407331e2ee3153c519103f2", Version.STANDARD, false);
        Parameters params = new Parameters()
                .addSearch(title)
                .addFields("cover,rating")
                .addLimit("1");

        wrapper.games(params, new OnSuccessCallback() {
            @Override
            public void onSuccess(JSONArray result) {
                System.out.println(result);
                response.setContentType("application/json");
                PrintWriter out = null;
                try {
                    out = response.getWriter();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                out.print(result);
//                request.setAttribute("result", result);
            }
            @Override
            public void onError(Exception error) {
                System.out.println(error);
            }
        });

//        request.getRequestDispatcher("/WEB-INF/hello.jsp").forward(request, response);

    }
}
