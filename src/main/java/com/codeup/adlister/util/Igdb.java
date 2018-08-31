package com.codeup.adlister.util;

import callback.OnSuccessCallback;
import org.json.JSONArray;
import wrapper.IGDBWrapper;
import wrapper.Parameters;
import wrapper.Version;

public class Igdb {

    public static void listOfGames(String search, String field, String limit) {
        IGDBWrapper wrapper = new IGDBWrapper("15e6d11f7407331e2ee3153c519103f2", Version.STANDARD, false);
        Parameters params = new Parameters()
                .addSearch(search)
                .addFields(field)
                .addLimit(limit);

        wrapper.games(params, new OnSuccessCallback() {
            @Override
            public void onSuccess(JSONArray result) {

                System.out.println(result);
            }

            @Override
            public void onError(Exception error) {
                System.out.println(error);
            }
        });
    }

}
