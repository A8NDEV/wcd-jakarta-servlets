package ViewServlet;

import com.fpt.dal.CourseDal;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CourseServlet", urlPatterns = {"/course"})
public class CourseServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 1. Lấy dữ liệu từ database thông qua DAL
        CourseDal dal = new CourseDal();
        request.setAttribute("list", dal.findAll());
        
        // 2. Chuyển tiếp (forward) sang trang JSP để hiển thị
        // Lưu ý: Không dùng response.getWriter() khi dùng forward
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        return "Course View Servlet";
    }
}
