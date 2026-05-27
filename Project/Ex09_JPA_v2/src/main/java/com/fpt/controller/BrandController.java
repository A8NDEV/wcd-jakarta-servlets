package com.fpt.controller;

import com.fpt.bean.BrandBean;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "BrandController", urlPatterns = {"/BrandController"})
public class BrandController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // 1. Đọc parameters
        String action  = request.getParameter("action");
        String idParam = request.getParameter("id");

        BrandBean bean = new BrandBean();
        String ctx = request.getContextPath();

        // 2. Xử lý theo action
        if (action == null || action.isEmpty()) {
            // Hiển thị danh sách
            request.setAttribute("list", bean.findAll());
            request.getRequestDispatcher("brand/index.jsp").forward(request, response);

        } else switch (action) {

            case "create" -> {
                // Hiển thị form thêm mới
                request.getRequestDispatcher("brand/create.jsp").forward(request, response);
            }

            case "process-create" -> {
                // Lưu brand mới vào DB
                BrandBean newBrand = new BrandBean();
                newBrand.setName(request.getParameter("name"));
                newBrand.setContact(request.getParameter("contact"));
                newBrand.setWebsite(request.getParameter("website"));
                bean.create(newBrand);
                response.sendRedirect(ctx + "/BrandController");
            }

            case "edit" -> {
                // Hiển thị form sửa
                int id = Integer.parseInt(idParam);
                request.setAttribute("brand", bean.findById(id));
                request.getRequestDispatcher("brand/edit.jsp").forward(request, response);
            }

            case "process-update" -> {
                // Cập nhật brand
                int id = Integer.parseInt(idParam);
                BrandBean edit = bean.findById(id);
                edit.setName(request.getParameter("name"));
                edit.setContact(request.getParameter("contact"));
                edit.setWebsite(request.getParameter("website"));
                bean.update(edit);
                response.sendRedirect(ctx + "/BrandController");
            }

            case "delete" -> {
                // Xóa brand
                int id = Integer.parseInt(idParam);
                bean.delete(id);
                response.sendRedirect(ctx + "/BrandController");
            }

            default -> {
                // Action không hợp lệ → về danh sách
                response.sendRedirect(ctx + "/BrandController");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "BrandController";
    }
}
