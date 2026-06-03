/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.fpt.controller;

import com.fpt.bean.PhoneBean;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;

/**
 *
 * @author ASUS
 */

@WebServlet(name = "PhoneController", urlPatterns = { "/PhoneServlet" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB: buffer before writing to disk
        maxFileSize = 10 * 1024 * 1024, // max 10MB per file
        maxRequestSize = 1024 * 1024 * 1024 // max 1GB per request
)
public class PhoneServlet extends HttpServlet {

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

        // upload file or image
        // 3. create folder
        String uploadPath = request.getServletContext().getRealPath("") + java.io.File.separator + "images";
        java.io.File uploadDir = new java.io.File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // 4. get form file part
        jakarta.servlet.http.Part filePart = request.getPart("txtImage");
        String fileName = "";

        // 5. without new file
        if (filePart != null && filePart.getSize() > 0) {
            // 6. get file name
            fileName = filePart.getSubmittedFileName();
            // 7. upload new file
            filePart.write(uploadPath + java.io.File.separator + fileName);
        } else {
            fileName = "default.png";
        }

        PhoneBean bean = new PhoneBean(); // @NoArgsConstructor
        // 1. Read form data
        Integer id = null;
        String name = request.getParameter("txtName");
        String priceStr = request.getParameter("txtPrice");
        BigDecimal price = BigDecimal.ZERO;
        
        boolean hasError = false;
        String errMsg = "";

        // R2.2 Validation: all fields not blank
        if (name == null || name.trim().isEmpty() || priceStr == null || priceStr.trim().isEmpty() || fileName == null || fileName.equals("default.png")) {
            hasError = true;
            errMsg = "All fields (Model, Price, Image) must not be blank!";
        } else {
            try {
                price = new BigDecimal(priceStr.trim());
                // R2.2 Validation: price greater than zero
                if (price.compareTo(BigDecimal.ZERO) <= 0) {
                    hasError = true;
                    errMsg = "Price must be greater than zero!";
                }
            } catch (NumberFormatException e) {
                hasError = true;
                errMsg = "Price must be a valid decimal number!";
            }
        }

        if (hasError) {
            request.setAttribute("error", errMsg);
            request.getRequestDispatcher("phone/error.jsp").forward(request, response);
            return;
        }

        // 2. set data to product class
        bean = new PhoneBean(id, name, price, fileName);

        // 3. Insert Product into database
        boolean isOK = bean.createPhone(bean);
        if (isOK) {
            request.setAttribute("sucess", "Insert successfully!");
            request.getRequestDispatcher("phone/success.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Insert Failed!");
            request.getRequestDispatcher("phone/error.jsp").forward(request, response);
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
