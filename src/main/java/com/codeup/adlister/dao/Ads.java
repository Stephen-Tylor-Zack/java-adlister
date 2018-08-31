package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
  
    List<Ad> all();
  
    Long insert(Ad ad);
  
    List<Ad> userProfileAds(Long id);
  
    Long update(Ad ad);
  
    Ad findOneAd(Long adId);
  
    Long delete(Long adId);

    Ad findById(long id);
  
    List<Ad> findBySearch(String search);

    List<Ad> findByCategory(int search);
}
