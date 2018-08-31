package com.codeup.adlister.models;

public class Ad {
    private String category;

    private int cats_id;

    private long id;
    private long userId;
    private String title;
    private String description;
    private int price;
    private String city;
    private String state;
    private String username;

    public Ad(String title, String description, int price, String city, String state) {
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
    }

    public Ad(long id, String title, String description, int price, String city, String state) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
    }


    public Ad(long id, long userId, String title, String description, int price, String city, String state) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
    }

    public Ad(long id, long userId, String title, String description, int price, String city, String state, String username) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
        this.username = username;


    }

    public Ad(long id, String title, String description) {
    }

    public Ad(long id, long user_id, String title, String description, int price, String city, String state, int cats_id) {

        this.id = id;
        this.userId = user_id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
        this.cats_id = cats_id;

    }

    public Ad(long id, long user_id, String title, String description, int price, String city, String state, int cats_id, String category) {

        this.id = id;
        this.userId = user_id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.city = city;
        this.state = state;
        this.cats_id = cats_id;

        this.category = category;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getCats_id() {
        return cats_id;
    }

    public void setCats_id(int cat_id) {
        this.cats_id = cat_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
