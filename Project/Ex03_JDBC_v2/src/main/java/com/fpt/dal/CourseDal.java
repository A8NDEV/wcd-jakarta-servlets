package com.fpt.dal;

import com.fpt.entity.Course;
import com.fpt.util.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CourseDal {

    // 1. findAll() method
    public List<Course> findAll() {
        List<Course> courses = new ArrayList<>();
        System.out.println("DEBUG: Bat dau findAll()...");
        try {
            String sql = "SELECT * FROM courses";
            try (Connection conn = DBConnect.getConnection();
                 Statement stm = conn.createStatement();
                 ResultSet rs = stm.executeQuery(sql)) {

                int count = 0;
                while (rs.next()) {
                    count++;
                    try {
                        Course course = new Course();
                        course.setId(rs.getInt(1));
                        course.setCode(rs.getString(2));
                        course.setName(rs.getString(3));
                        course.setSemester(rs.getString(4));
                        courses.add(course);
                    } catch (Exception rowEx) {
                        System.out.println("DEBUG: Loi tai dong thu " + count + ": " + rowEx.getMessage());
                    }
                }
                System.out.println("DEBUG: Ket thuc findAll(). Tim thay " + count + " dong.");
            }
        } catch (Exception e) {
            System.out.println("DEBUG: LOI TRUY VAN: " + e.getMessage());
            e.printStackTrace();
        }
        return courses;
    }

    // 2. CRUD
    // 2.1 create() method
    public boolean create(Course course) {
        try {
            String sql = "INSERT INTO courses (code, name, semester) VALUES (?, ?, ?)";
            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, course.getCode());
                ps.setString(2, course.getName());
                ps.setString(3, course.getSemester());
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("DEBUG: LOI CREATE: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 2.2 update() method
    public boolean update(Course course) {
        try {
            String sql = "UPDATE courses SET code=?, name=?, semester=? WHERE id=?";
            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, course.getCode());
                ps.setString(2, course.getName());
                ps.setString(3, course.getSemester());
                ps.setInt(4, course.getId());
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("DEBUG: LOI UPDATE: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 2.3 delete() method
    public boolean delete(int id) {
        try {
            String sql = "DELETE FROM courses WHERE id=?";
            try (Connection conn = DBConnect.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, id);
                return ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            System.out.println("DEBUG: LOI DELETE: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // 3. Utils
    // 3.1 findById() method
    public Course findById(int id) {
        Course course = new Course();
        String sql = "SELECT * FROM courses WHERE id = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    course.setId(rs.getInt(1));
                    course.setCode(rs.getString(2));
                    course.setName(rs.getString(3));
                    course.setSemester(rs.getString(4));
                }
            }
        } catch (Exception e) {
            System.out.println("DEBUG: LOI FINDBYID: " + e.getMessage());
            e.printStackTrace();
        }
        return course;
    }

    // 3.2 searchByCode() method
    public List<Course> searchByCode(String keyword) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM courses WHERE code LIKE ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Course course = new Course();
                    course.setId(rs.getInt(1));
                    course.setCode(rs.getString(2));
                    course.setName(rs.getString(3));
                    course.setSemester(rs.getString(4));
                    courses.add(course);
                }
            }
        } catch (Exception e) {
            System.out.println("DEBUG: LOI SEARCH: " + e.getMessage());
            e.printStackTrace();
        }
        return courses;
    }
}

