package com.codeup.adlister.models;

public class AdCategory {
    private int ads_id;
    private int cats_id;

    public AdCategory(int ads_id, int cats_id) {
        this.ads_id = ads_id;
        this.cats_id = cats_id;
    }

    public int getAds_id() {
        return ads_id;
    }

    public void setAds_id(int ads_id) {
        this.ads_id = ads_id;
    }

    public int getCats_id() {
        return cats_id;
    }

    public void setCats_id(int cats_id) {
        this.cats_id = cats_id;
    }
}
