package ViewServlet;

import com.fpt.dal.CourseDal;
import com.fpt.entity.Course;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CourseCreateServlet", urlPatterns = {"/course/create"})
public class CourseCreateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/course-create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String semester = request.getParameter("semester");

        Course course = new Course();
        course.setCode(code);
        course.setName(name);
        course.setSemester(semester);

        CourseDal dal = new CourseDal();
        dal.create(course);

        response.sendRedirect(request.getContextPath() + "/course");
    }
}
