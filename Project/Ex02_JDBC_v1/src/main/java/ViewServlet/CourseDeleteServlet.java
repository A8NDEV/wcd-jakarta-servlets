package ViewServlet;

import com.fpt.dal.CourseDal;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CourseDeleteServlet", urlPatterns = {"/course/delete"})
public class CourseDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new CourseDal().delete(id);
        response.sendRedirect(request.getContextPath() + "/course");
    }
}
