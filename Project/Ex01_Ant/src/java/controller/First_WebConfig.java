/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class First_WebConfig extends HttpServlet {

    // Đổi sang service method để xử lý tất cả các loại request (GET, POST, etc.)
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet First_WebConfig</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet First_WebConfig at " + request.getContextPath() + "</h1>");
            //---------- Demo03 --------------------
            out.print("<table class=\"table table-bordered table-striped w-100\">");
            out.print("<tr>");
            out.print("<th>Name</th>");
            out.print("<th>Value</th>");
            out.print("</tr>");
            
            var headers = request.getHeaderNames();
            while (headers.hasMoreElements()){
                String headerName = headers.nextElement();
                String content = request.getHeader(headerName);
                out.print("<tr>");
                out.print("<td>" + headerName + "</td>");
                out.print("<td>" + content + "</td>");
                out.print("</tr>");
            }

            out.print("</table>");
            out.print("<a href=\"./First_WebConfig\" class=\"btn btn-primary\">Refresh</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}

