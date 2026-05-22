package com.fpt.dal;

import com.fpt.entity.Product;
import com.fpt.util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Data Access Layer for Product entity.
 * All DB operations using plain JDBC with PreparedStatement.
 * Note: DB column 'image' maps to Product.filename field.
 */
public class ProductDal {

    /**
     * Retrieves all products from the database.
     */
    public List<Product> findAll() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection cnn = DBConnect.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product(
                    rs.getString("code"),
                    rs.getString("name"),
                    rs.getInt("price"),
                    rs.getString("image")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Finds a single product by its primary key code.
     */
    public Product findByCode(String code) {
        Product product = null;
        String sql = "SELECT * FROM products WHERE code = ?";
        try (Connection cnn = DBConnect.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {
            ps.setString(1, code);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product(
                        rs.getString("code"),
                        rs.getString("name"),
                        rs.getInt("price"),
                        rs.getString("image")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    /**
     * Inserts a new product into the database.
     * @return true if at least one row was inserted.
     */
    public boolean create(Product p) {
        String sql = "INSERT INTO products(code, name, price, image) VALUES(?, ?, ?, ?)";
        try (Connection cnn = DBConnect.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {
            ps.setString(1, p.getCode());
            ps.setString(2, p.getName());
            ps.setInt(3, p.getPrice());
            ps.setString(4, p.getFilename());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Updates an existing product. Code (PK) is not changed.
     * @return true if at least one row was updated.
     */
    public boolean update(Product p) {
        String sql = "UPDATE products SET name=?, price=?, image=? WHERE code=?";
        try (Connection cnn = DBConnect.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setInt(2, p.getPrice());
            ps.setString(3, p.getFilename());
            ps.setString(4, p.getCode());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Deletes a product by its primary key code.
     * @return true if at least one row was deleted.
     */
    public boolean delete(String code) {
        String sql = "DELETE FROM products WHERE code=?";
        try (Connection cnn = DBConnect.getConnection();
             PreparedStatement ps = cnn.prepareStatement(sql)) {
            ps.setString(1, code);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
