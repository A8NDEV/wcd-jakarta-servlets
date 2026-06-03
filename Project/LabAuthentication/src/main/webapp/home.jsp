<%-- 
    Document   : home
    Created on : 29 thg 5, 2026, 19:22:34
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>

<%-- Session null --%>
<c:if test="${ empty sessionScope.username }">
    <c:choose>
        <%--Cookie có giá trị--%>
        <c:when test="${ not empty cookie.username.value and not empty cookie.password.value }">
            <c:redirect url="controller?txtName=${cookie.username.value}&amp;txtPass=${cookie.password.value}&amp;action=Login" />
        </c:when>
        <%--Ngược lại, chuyển tới login --%>
        <c:otherwise>
            <c:redirect url="login.jsp" />
        </c:otherwise>
    </c:choose>
</c:if>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="p-6">
        <%-- Session hợp lệ --%>
        <c:if test="${ not empty sessionScope.username }">
            <h1 class="text-2xl font-bold mb-2">Homepage</h1>
            <h3 class="text-lg mb-4">Welcome 
                <span class="text-blue-600 font-semibold">
                    <c:out value="${ sessionScope.username }" />
                </span>
            </h3>
            <a href="controller?action=Logout" class="bg-red-500 hover:bg-red-600 text-white font-semibold py-1.5 px-4 rounded transition duration-150">
                Logout
            </a>
        </c:if>
    </body>
</html>
