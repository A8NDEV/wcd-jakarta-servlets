package com.fpt.controller;

import com.fpt.dal.CourseDal;
import com.fpt.entity.Course;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CourseServlet", urlPatterns = { "/course", "/controller" })
public class CourseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        CourseDal dal = new CourseDal();

        if (action == null || action.trim().isEmpty() || action.equals("list")) {
            String keyword = request.getParameter("keyword");
            if (keyword != null && !keyword.trim().isEmpty()) {
                request.setAttribute("list", dal.searchByCode(keyword.trim()));
                request.setAttribute("keyword", keyword.trim());
            } else {
                request.setAttribute("list", dal.findAll());
            }
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } else {
            switch (action) {
                case "create" -> {
                    if ("GET".equalsIgnoreCase(request.getMethod())) {
                        request.getRequestDispatcher("/course-create.jsp").forward(request, response);
                    } else if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String code = request.getParameter("code");
                        String name = request.getParameter("name");
                        String semester = request.getParameter("semester");
                        Course course = new Course(0, code, name, semester);
                        dal.create(course);
                        response.sendRedirect(request.getContextPath() + "/course");
                    }
                }
                case "update" -> {
                    if ("GET".equalsIgnoreCase(request.getMethod())) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        Course course = dal.findById(id);
                        request.setAttribute("course", course);
                        request.getRequestDispatcher("/course-update.jsp").forward(request, response);
                    } else if ("POST".equalsIgnoreCase(request.getMethod())) {
                        int id = Integer.parseInt(request.getParameter("id"));
                        String code = request.getParameter("code");
                        String name = request.getParameter("name");
                        String semester = request.getParameter("semester");
                        Course course = new Course(id, code, name, semester);
                        dal.update(course);
                        response.sendRedirect(request.getContextPath() + "/course");
                    }
                }
                case "delete" -> {
                    int id = Integer.parseInt(request.getParameter("id"));
                    dal.delete(id);
                    response.sendRedirect(request.getContextPath() + "/course");
                }
                default -> {
                    response.sendRedirect(request.getContextPath() + "/course");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
