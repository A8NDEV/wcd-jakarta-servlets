package ViewServlet;

import com.fpt.util.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "DebugServlet", urlPatterns = {"/debug"})
public class DebugServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<h1>Hệ thống kiểm tra kết nối</h1>");
        
        try {
            out.println("<p>Đang thử kết nối database...</p>");
            Connection conn = DBConnect.getConnection();
            out.println("<p style='color:green'>✅ Kết nối thành công!</p>");
            
            out.println("<p>Đang thử truy vấn bảng 'courses'...</p>");
            Statement stm = conn.createStatement();
            ResultSet rs = stm.executeQuery("SELECT count(*) FROM courses");
            if (rs.next()) {
                out.println("<p style='color:blue'>✅ Truy vấn thành công! Số dòng tìm thấy: " + rs.getInt(1) + "</p>");
            }
            
            out.println("<p>Chi tiết dữ liệu:</p><ul>");
            ResultSet rs2 = stm.executeQuery("SELECT * FROM courses");
            while(rs2.next()) {
                out.println("<li>ID: " + rs2.getObject(1) + " | Name: " + rs2.getObject(3) + "</li>");
            }
            out.println("</ul>");
            
        } catch (Exception e) {
            out.println("<p style='color:red'>❌ LỖI RỒI:</p>");
            out.println("<pre>");
            e.printStackTrace(out);
            out.println("</pre>");
        }
    }
}
