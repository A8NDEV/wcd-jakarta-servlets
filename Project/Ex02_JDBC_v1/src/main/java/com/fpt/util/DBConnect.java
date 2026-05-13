package com.fpt.util;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    static Connection cnn;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wcdlap", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cnn;
    }
}
