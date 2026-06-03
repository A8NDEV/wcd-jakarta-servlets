/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fpt.controller;
import com.fpt.dal.AccountDal;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AuthController", urlPatterns = {"/controller"})
public class AuthController extends HttpServlet {

    //2.1. Khởi tạo AccountDal
    private final AccountDal dal = new AccountDal();

    //2.2.processRequest() method
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //2.2.1. Lấy giá trị các đối số
        String action = request.getParameter("action") != null
                ? request.getParameter("action") : "";

        String user = request.getParameter("txtName");
        String pass = request.getParameter("txtPass");

        //2.2.2. Xử lý các action
        switch (action) {
            case "Login" -> {
                if (dal.checkLogin(user, pass)) {
                    //Lưu thông tin tài khoản vào Session
                    request.getSession().setAttribute("username", user);
                    
                    response.addCookie(new Cookie("username", user) {
                        {
                            setMaxAge(24 * 60 * 60);
                        }
                    });
                    response.addCookie(new Cookie("password", pass) {
                        {
                            setMaxAge(24 * 60 * 60);
                        }
                    });
                    
                    response.sendRedirect("home.jsp");
                } else {
                    request.setAttribute("errMes", "Username or Password is incorrect!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
            case "Register" -> {
                if (dal.registerAccount(user, pass)) {
                    request.setAttribute("ssMes", "Success! Please log in.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("errMes", "Username already exists!");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }
            case "Logout" -> {
                request.getSession().invalidate(); //Hủy Session
                
                //Xóa Cookie
                response.addCookie(new Cookie("username", "") {
                    {
                        setMaxAge(0);
                    }
                });
                response.addCookie(new Cookie("password", "") {
                    {
                        setMaxAge(0);
                    }
                });
                
                response.sendRedirect("login.jsp");
            }
            default -> {
                response.sendRedirect("login.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
    }
    // </editor-fold>
}
