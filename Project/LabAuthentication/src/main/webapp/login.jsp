<%-- 
    Document   : login
    Created on : 29 thg 5, 2026, 19:15:37
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="p-6">
        <form action="controller" method="post" class="max-w-sm">
            <div class="mb-4">
                <h1 class="text-2xl font-bold mb-2">Login</h1>
                
                <%-- Thông báo lỗi --%>
                <c:if test="${not empty requestScope.errMes}">
                    <div class="text-red-600 mb-2">
                        <c:out value="${requestScope.errMes}"/>
                    </div>
                </c:if>
                
                <%-- Thông báo thành công --%>
                <c:if test="${not empty requestScope.ssMes}">
                    <div class="text-green-600 mb-2">
                        <c:out value="${requestScope.ssMes}"/>
                    </div>
                </c:if>
            </div>

            <div class="mb-4">
                Username: <input name="txtName" autofocus class="border border-gray-300 rounded px-2 py-1" />
            </div>

            <div class="mb-4">
                Password: <input type="password" name="txtPass" class="border border-gray-300 rounded px-2 py-1" />
            </div>

            <div class="mb-4">
                <input type="submit" name="action" value="Login" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-1 px-4 rounded cursor-pointer">
            </div>
            
            <div class="mt-4">
                Don't have an account? <a href="register.jsp" class="text-blue-500 hover:underline">Register here</a>
            </div>
        </form>
    </body>
</html>
