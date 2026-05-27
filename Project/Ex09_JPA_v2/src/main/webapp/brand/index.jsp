<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.fpt.bean.BrandBean, java.util.List" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Brand Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8">

<h2 class="text-2xl font-bold mb-4">Danh sách Brand</h2>
<a href="${pageContext.request.contextPath}/BrandController?action=create"
   class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">+ Thêm mới</a>

<%-- Debug: số bản ghi --%>
<p class="mt-2 text-sm text-gray-500">
    Số bản ghi: ${empty list ? 0 : list.size()}
</p>

<table class="w-full mt-2 bg-white rounded shadow text-sm">
    <thead class="bg-gray-800 text-white">
        <tr>
            <th class="p-3 text-left">#</th>
            <th class="p-3 text-left">Brand ID</th>
            <th class="p-3 text-left">Name</th>
            <th class="p-3 text-left">Contact</th>
            <th class="p-3 text-left">Website</th>
            <th class="p-3 text-left">Action</th>
        </tr>
    </thead>
    <tbody>
        <%-- Dùng scriptlet để tránh phụ thuộc JSTL --%>
        <%
            List<BrandBean> list = (List<BrandBean>) request.getAttribute("list");
            if (list != null && !list.isEmpty()) {
                int i = 1;
                for (BrandBean b : list) {
        %>
        <tr class="border-b hover:bg-gray-50">
            <td class="p-3"><%= i++ %></td>
            <td class="p-3"><%= b.getBrandId() %></td>
            <td class="p-3"><%= b.getName() %></td>
            <td class="p-3"><%= b.getContact() %></td>
            <td class="p-3"><%= b.getWebsite() %></td>
            <td class="p-3 space-x-2">
                <a href="${pageContext.request.contextPath}/BrandController?action=edit&id=<%= b.getBrandId() %>"
                   class="bg-yellow-400 text-black px-3 py-1 rounded hover:bg-yellow-500">Edit</a>
                <a href="${pageContext.request.contextPath}/BrandController?action=delete&id=<%= b.getBrandId() %>"
                   class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600"
                   onclick="return confirm('Xóa brand này?')">Delete</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6" class="p-4 text-center text-gray-400">Chưa có dữ liệu</td>
        </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>
