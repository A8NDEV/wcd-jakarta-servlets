<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Brand</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 p-8 h-screen flex items-center justify-center">

<div class="max-w-lg w-full bg-white rounded-xl shadow p-8">
    <h2 class="text-2xl font-bold mb-6">Sửa Brand</h2>

    <form action="${pageContext.request.contextPath}/BrandController" method="post">
        <input type="hidden" name="action" value="process-update">
        <input type="hidden" name="id"     value="${brand.brandId}">

        <div class="mb-4">
            <label class="block text-sm font-medium mb-1">Name</label>
            <input type="text" name="name" value="${brand.name}" required
                   class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div class="mb-4">
            <label class="block text-sm font-medium mb-1">Contact</label>
            <input type="text" name="contact" value="${brand.contact}"
                   class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div class="mb-6">
            <label class="block text-sm font-medium mb-1">Website</label>
            <input type="text" name="website" value="${brand.website}"
                   class="w-full border rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-400">
        </div>

        <div class="flex gap-3">
            <button type="submit" class="bg-green-600 text-white px-5 py-2 rounded hover:bg-green-700">Cập nhật</button>
            <a href="${pageContext.request.contextPath}/BrandController"
               class="bg-gray-300 text-black px-5 py-2 rounded hover:bg-gray-400">Hủy</a>
        </div>
    </form>
</div>

</body>
</html>
