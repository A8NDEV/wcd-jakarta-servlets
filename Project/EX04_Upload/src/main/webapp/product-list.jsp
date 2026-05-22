<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sach San Pham</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<div class="container mx-auto px-4 py-8 max-w-5xl">

    <!-- Header -->
    <div class="flex items-center justify-between mb-6">
        <div>
            <h1 class="text-2xl font-bold text-gray-800">Danh Sach San Pham</h1>
            <p class="text-gray-500 text-sm mt-1">Quan ly toan bo san pham trong he thong</p>
        </div>
        <a href="controller?action=create"
           class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded-lg transition text-sm">
            + Them San Pham
        </a>
    </div>

    <!-- Table -->
    <div class="bg-white rounded-xl shadow overflow-hidden">
        <table class="w-full text-sm text-left">
            <thead class="bg-blue-600 text-white">
                <tr>
                    <th class="px-4 py-3 text-center w-12">#</th>
                    <th class="px-4 py-3 w-28">Ma SP</th>
                    <th class="px-4 py-3">Ten San Pham</th>
                    <th class="px-4 py-3 text-right w-32">Gia (VND)</th>
                    <th class="px-4 py-3 text-center w-24">Hinh Anh</th>
                    <th class="px-4 py-3 text-center w-40">Thao Tac</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-100">
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td colspan="6" class="text-center text-gray-400 py-10">
                                Chua co san pham nao.
                                <a href="controller?action=create" class="text-blue-600 underline ml-1">Them ngay!</a>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="data" varStatus="cnt">
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-4 py-3 text-center text-gray-400">${cnt.count}</td>
                                <td class="px-4 py-3">
                                    <span class="bg-gray-100 text-gray-700 text-xs font-mono px-2 py-1 rounded">
                                        ${data.code}
                                    </span>
                                </td>
                                <td class="px-4 py-3 font-medium text-gray-800">${data.name}</td>
                                <td class="px-4 py-3 text-right text-gray-700">${data.price}</td>
                                <td class="px-4 py-3 text-center">
                                    <c:choose>
                                        <c:when test="${not empty data.filename}">
                                            <img src="product_images/${data.filename}"
                                                 alt="${data.name}"
                                                 class="w-14 h-14 object-cover rounded-lg border border-gray-200 mx-auto"
                                                 onerror="this.style.display='none'">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="w-14 h-14 bg-gray-100 rounded-lg mx-auto flex items-center justify-center text-gray-400 text-xs">
                                                No img
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="px-4 py-3 text-center space-x-1">
                                    <a href="controller?action=update&code=${data.code}"
                                       class="inline-block bg-yellow-400 hover:bg-yellow-500 text-white text-xs font-semibold px-3 py-1.5 rounded transition">
                                        Update
                                    </a>
                                    <a href="controller?action=delete&code=${data.code}"
                                       class="inline-block bg-red-500 hover:bg-red-600 text-white text-xs font-semibold px-3 py-1.5 rounded transition"
                                       onclick="return confirm('Ban co chac muon xoa [${data.code}]?')">
                                        Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        <div class="px-4 py-3 text-xs text-gray-400 border-t border-gray-100">
            Tong: <span class="font-semibold text-gray-600">${list.size()}</span> san pham
        </div>
    </div>

</div>
</body>
</html>
