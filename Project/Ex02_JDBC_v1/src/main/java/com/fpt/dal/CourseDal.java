package com.fpt.dal;

import com.fpt.entity.Course;
import com.fpt.util.DBConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CourseDal {

    //1. findAll() method
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
    //2. CRUD
    // 2.1 create() methodv
    // 2.2 update() method
    // 2.3 delete() method

    //3. Utils
    //3.1 findById() method
}
