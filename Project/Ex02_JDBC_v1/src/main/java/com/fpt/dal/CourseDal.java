package com.fpt.dal;

import com.fpt.entity.Course;
import com.fpt.util.DBConnect;
import java.sql.Connection;
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
            Connection conn = DBConnect.getConnection();
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery(sql);

            int count = 0;
            while (rs.next()) {
                count++;
                try {
                    Course course = new Course();
                    // Su dung so thu tu cot de chac chan nhat
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
            Connection conn = DBConnect.getConnection();
            java.sql.PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, course.getCode());
            ps.setString(2, course.getName());
            ps.setString(3, course.getSemester());
            return ps.executeUpdate() > 0;
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
            Connection conn = DBConnect.getConnection();
            java.sql.PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, course.getCode());
            ps.setString(2, course.getName());
            ps.setString(3, course.getSemester());
            ps.setInt(4, course.getId());
            return ps.executeUpdate() > 0;
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
            Connection conn = DBConnect.getConnection();
            java.sql.PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
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
        String sql = "SELECT * FROM courses where id = ?";
        try {
            var conn = DBConnect.getConnection();
            java.sql.PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course.setId(rs.getInt(1));
                course.setCode(rs.getString(2));
                course.setName(rs.getString(3));
                course.setSemester(rs.getString(4));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("DEBUG: LOI FINDBYID: " + e.getMessage());
        }
        return course;
    }
}
