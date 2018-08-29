package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    List<Ad> userProfileAds(Long id);
    Long update(Ad ad);
    Ad findOneAd(Long adId);
    Long delete(Long adId);
}
