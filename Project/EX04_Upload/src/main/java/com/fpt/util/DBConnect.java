package com.fpt.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Utility class for database connection.
 * Provides a static factory method to get a MySQL connection.
 */
public class DBConnect {
    private static final String URL =
        "jdbc:mysql://localhost:3306/WCDLab?useSSL=false&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASS = "";

    /**
     * Returns a new Connection to WCDLab database.
     * Caller is responsible for closing the connection.
     */
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
