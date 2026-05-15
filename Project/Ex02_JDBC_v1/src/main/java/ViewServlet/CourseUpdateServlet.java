package ViewServlet;

import com.fpt.dal.CourseDal;
import com.fpt.entity.Course;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CourseUpdateServlet", urlPatterns = {"/course/update"})
public class CourseUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CourseDal dal = new CourseDal();
        Course course = dal.findById(id);
        request.setAttribute("course", course);
        request.getRequestDispatcher("/course-update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Course course = new Course();
        course.setId(Integer.parseInt(request.getParameter("id")));
        course.setCode(request.getParameter("code"));
        course.setName(request.getParameter("name"));
        course.setSemester(request.getParameter("semester"));

        CourseDal dal = new CourseDal();
        dal.update(course);

        response.sendRedirect(request.getContextPath() + "/course");
    }
}
