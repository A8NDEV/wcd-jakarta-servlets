<%-- 
    Document   : Calculator
    Created on : 11 thg 5, 2026, 19:19:42
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Demo02: Calculator</h1>
        <h3>
            <%
                int a = 10, b = 20;
                out.print(a + " + " + b + " = " + (a + b));
            %>
        </h3>
        <div class="bg-blue-100 border-blue-400 text-blue-800 m-3 p-2">
        Note:
        <br><!-- comment -->
        1. Trang jsb co the chay truc tiep tu trinh duyet web,<br>
        2. Cac thay doi tinh se khong can bien dich lai.
        </div>
        <h3>
            <a href="./admin/index.html">
                Open Admin page
            </a>
        </h3>
    </body>
</html>
