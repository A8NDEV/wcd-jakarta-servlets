package com.fpt.controller;

import com.fpt.dal.ProductDal;
import com.fpt.entity.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

/**
 * Front Controller Servlet using Action Dispatcher pattern.
 * URL: /controller
 * Handles: list, create, process-create, update, process-update, delete
 *
 * PRG (Post-Redirect-Get) pattern is used after every CUD operation.
 */
@WebServlet("/controller")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,        // 1MB: buffer before writing to disk
    maxFileSize       = 10 * 1024 * 1024,   // max 10MB per file
    maxRequestSize    = 1024 * 1024 * 1024  // max 1GB per request
)
public class ProductController extends HttpServlet {

    private final ProductDal productDal = new ProductDal();
    private static final String IMAGE_DIR = "product_images";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        handleRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        handleRequest(req, resp);
    }

    private void handleRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "create":
                // Show create form
                resp.sendRedirect("create.jsp");
                break;

            case "process-create":
                processCreate(req, resp);
                break;

            case "update":
                showUpdateForm(req, resp);
                break;

            case "process-update":
                processUpdate(req, resp);
                break;

            case "delete":
                processDelete(req, resp);
                break;

            default:
                // Show product list
                showList(req, resp);
                break;
        }
    }

    /** Loads all products and forwards to product-list.jsp */
    private void showList(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Product> list = productDal.findAll();
        req.setAttribute("list", list);
        req.getRequestDispatcher("product-list.jsp").forward(req, resp);
    }

    /** Handles product creation: upload image then INSERT into DB */
    private void processCreate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String code  = req.getParameter("txtCode");
        String name  = req.getParameter("txtName");
        int price    = Integer.parseInt(req.getParameter("txtPrice"));
        String filename = upload(req, "process-create", "");

        Product p = new Product(code, name, price, filename);
        productDal.create(p);
        resp.sendRedirect("controller"); // PRG pattern
    }

    /** Loads a product by code and forwards to update.jsp (pre-filled) */
    private void showUpdateForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String code = req.getParameter("code");
        Product product = productDal.findByCode(code);
        req.setAttribute("product", product);
        req.getRequestDispatcher("update.jsp").forward(req, resp);
    }

    /** Handles product update: optionally re-upload image then UPDATE DB */
    private void processUpdate(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String code     = req.getParameter("txtCode");
        String name     = req.getParameter("txtName");
        int price       = Integer.parseInt(req.getParameter("txtPrice"));
        String oldFile  = req.getParameter("txtFilename"); // kept if no new file selected
        String filename = upload(req, "process-update", oldFile);

        Product p = new Product(code, name, price, filename);
        productDal.update(p);
        resp.sendRedirect("controller"); // PRG pattern
    }

    /** Deletes a product and redirects back to list */
    private void processDelete(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String code = req.getParameter("code");
        productDal.delete(code);
        resp.sendRedirect("controller"); // PRG pattern
    }

    /**
     * Handles file upload from multipart request.
     * Saves image to product_images/ under webapp root.
     *
     * @param req    the HTTP request
     * @param action current action (to decide whether to keep old image)
     * @param oldFilename  existing image filename (used for update with no new file)
     * @return the filename to store in DB
     */
    private String upload(HttpServletRequest req, String action, String oldFilename)
            throws ServletException, IOException {

        // Resolve absolute path to product_images folder inside webapp
        String realPath = req.getServletContext().getRealPath("") + File.separator + IMAGE_DIR;
        File uploadDir = new File(realPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        Part part = req.getPart("txtImage");

        // If no file was selected (part is null or empty)
        if (part == null || part.getSize() == 0) {
            // On update: keep the old image; on create: store empty string
            return "process-update".equals(action) ? oldFilename : "";
        }

        // Extract only the file name (some browsers send full path)
        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
        part.write(realPath + File.separator + fileName);
        return fileName;
    }
}
