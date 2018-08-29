package com.codeup.adlister.dao;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MySQLAdsCategoriesDao implements AdsCategories {
    private Connection connection = null;

    public MySQLAdsCategoriesDao(Config config) {
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

    @Override
    public void insertPivot(int ads_id, int cats_id) {
        String query = "INSERT INTO ads_cat(ads_id, cats_id) VALUES (?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, ads_id);
            stmt.setInt(2, cats_id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error with pivot table.");
        }
    }
}
