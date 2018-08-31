package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    private List<Ad> createAdsFromCat(ResultSet rs) throws SQLException {
        List<Ad> adsCat = new ArrayList<>();
        while (rs.next()) {
            adsCat.add(extractForCatAd(rs));
        }
        return adsCat;
    }

    @Override
    public List<Ad> findBySearch(String search){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT ads.*, users.username " +
                    "FROM ads " +
                    "JOIN users " +
                    "ON users.id = ads.user_id " +
                    "WHERE title LIKE ? OR description LIKE ?");
            stmt.setString(1, "%" + search + "%");
            stmt.setString(2, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving search results.", e);
        }
    }

    @Override
    public List<Ad> findByCategory(int id){
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("select * from ads_cat JOIN ads ON ads_cat.ads_id = ads.id " +
                    "JOIN categories ON ads_cat.cats_id = categories.id where cats_id = ?");
                    stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromCat(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving search results.", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads LEFT JOIN users u ON ads.user_id = u.id " +
                    "LEFT JOIN ads_cat a ON ads.id = a.ads_id " +
                    "LEFT JOIN categories c ON a.cats_id = c.id");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> userProfileAds(Long id) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads JOIN users ON ads.user_id = users.id WHERE user_id = ?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }


    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description, price, city, state) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setInt(4, ad.getPrice());
            stmt.setString(5, ad.getCity());
            stmt.setString(6, ad.getState());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public Long update(Ad ad) {
        String query = "UPDATE ads SET title = ?, description = ?, price = ?, city = ?, state = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            System.out.println("This is the DAO section.");
            System.out.println(ad.getTitle());
            System.out.println(ad.getDescription());
            System.out.println(ad.getCity());
            System.out.println(ad.getPrice());
            System.out.println(ad.getState());
            System.out.println(ad.getId());
            System.out.println("End the DAO section.");


            stmt.setString(1, ad.getTitle());
            stmt.setString(2, ad.getDescription());
            stmt.setInt(3,ad.getPrice());
            stmt.setString(4,ad.getCity());
            stmt.setString(5,ad.getState());
            stmt.setLong(6, ad.getId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error editing ad", e);
        }
    }

    @Override
    public Ad findOneAd(Long adId) {
        PreparedStatement ps = null;

            try {
                ps = connection.prepareStatement("SELECT ads.*, users.username FROM ads JOIN users ON users.id = ads.user_id WHERE ads.id = ?");
                ps.setLong(1, adId);
                ResultSet rs = ps.executeQuery();
                rs.next();
                return extractAd(rs);
            } catch (SQLException e) {
                e.printStackTrace();
                throw new RuntimeException("Error in finding ad.", e);
            }

    }
  
    public Ad findById(long id) {
        String query = "SELECT t.*, t2.username, t2.email, t3.category " +
                "FROM ads t LEFT JOIN users t2 ON t.user_id = t2.id " +
                "LEFT JOIN ads_cat ON ads_id " +
                "LEFT JOIN categories t3 ON ads_cat.cats_id = t3.category " +
                "WHERE t.id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding that ad", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getInt("price"),
                rs.getString("city"),
                rs.getString("state"),
                rs.getString("username")
        );
    }
             
    private Ad extractForEditAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getInt("price"),
                rs.getString("city"),
                rs.getString("state")
        );
    }

    private Ad extractForCatAd(ResultSet rs) throws SQLException {
        return new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getInt("price"),
                rs.getString("city"),
                rs.getString("state"),
                rs.getInt("cats_id"),
                rs.getString("category")
        );
    }


    public Long delete(Long adId) {
        try {
            String deleteQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(deleteQuery);
            ps.setLong(1, adId);
            ps.executeUpdate();
            return Long.valueOf(2);
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad", e);
        }
    }
}