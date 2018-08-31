package com.codeup.adlister.util;

import callback.OnSuccessCallback;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import org.json.JSONArray;
import wrapper.IGDBWrapper;
import wrapper.Parameters;
import wrapper.Version;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IGDBAPI {

    protected void doGet(HttpServletRequest request, HttpServletResponse response, String search, String field, String limit) throws IOException, ServletException {

        User currentUser = (User) request.getSession().getAttribute("user");
        Ad userAd = (Ad) DaoFactory.getAdsDao().userProfileAds(currentUser.getId());
        request.getSession().setAttribute("userAds", DaoFactory.getAdsDao().userProfileAds(currentUser.getId()));
//        for (Ad ad: userAd.getTitle()) {
//            System.out.println(ad);
//        }

        IGDBWrapper wrapper = new IGDBWrapper("15e6d11f7407331e2ee3153c519103f2", Version.STANDARD, false);
        Parameters params = new Parameters()
                .addSearch(search)
                .addFields(field)
                .addLimit(limit);

        wrapper.games(params, new OnSuccessCallback() {
            @Override
            public void onSuccess(JSONArray result) {

                System.out.println(result);
                request.setAttribute("result", result);
            }

            @Override
            public void onError(Exception error) {
                System.out.println(error);
            }
        });
    }
}
