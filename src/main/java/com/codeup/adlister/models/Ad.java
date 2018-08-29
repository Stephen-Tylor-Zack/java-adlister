package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private double price;
    private String city;
    private String state;
    private long cat_id;
    private String username;




    public Ad(long id, long userId, String title, String description, double price, String city, String state, long cat_id, String username) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
        this.cat_id = cat_id;
        this.username = username;


    }

    public Ad(long userId, String title, String description, double price, String city, String state, long cat_id) {
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
        this.cat_id = cat_id;
    }

    public Ad(long id, String title, String description) {
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {return price;}

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String title) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String title) {
        this.city = state;
    }

    public long getCat_id() {
        return cat_id;
    }

    public void setCat_id(long id) {
        this.cat_id = cat_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }



}