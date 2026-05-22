<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Them San Pham</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<div class="container mx-auto px-4 py-8 max-w-xl">

    <!-- Breadcrumb -->
    <nav class="text-sm text-gray-500 mb-4">
        <a href="controller" class="hover:text-blue-600">Danh Sach</a>
        <span class="mx-2">/</span>
        <span class="text-gray-800 font-medium">Them San Pham</span>
    </nav>

    <div class="bg-white rounded-xl shadow overflow-hidden">
        <div class="bg-blue-600 px-5 py-4">
            <h2 class="text-white font-semibold text-lg">Them San Pham Moi</h2>
        </div>
        <div class="p-5">
            <form action="controller" method="post" enctype="multipart/form-data" class="space-y-4">
                <input type="hidden" name="action" value="process-create">

                <div>
                    <label for="txtCode" class="block text-sm font-medium text-gray-700 mb-1">
                        Ma San Pham <span class="text-red-500">*</span>
                    </label>
                    <input type="text" id="txtCode" name="txtCode"
                           class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="VD: SP001" required maxlength="50">
                </div>

                <div>
                    <label for="txtName" class="block text-sm font-medium text-gray-700 mb-1">
                        Ten San Pham <span class="text-red-500">*</span>
                    </label>
                    <input type="text" id="txtName" name="txtName"
                           class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="VD: Ao thun trang" required maxlength="255">
                </div>

                <div>
                    <label for="txtPrice" class="block text-sm font-medium text-gray-700 mb-1">
                        Gia (VND) <span class="text-red-500">*</span>
                    </label>
                    <input type="number" id="txtPrice" name="txtPrice"
                           class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                           placeholder="VD: 150000" required min="0">
                </div>

                <div>
                    <label for="txtImage" class="block text-sm font-medium text-gray-700 mb-1">Hinh Anh</label>
                    <input type="file" id="txtImage" name="txtImage"
                           class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
                           accept="image/*" onchange="previewImage(this)">
                    <img id="preview" class="mt-2 w-28 h-28 object-cover rounded-lg border border-dashed border-blue-400 hidden" alt="Preview">
                    <p class="text-xs text-gray-400 mt-1">JPG, PNG, GIF toi da 10MB</p>
                </div>

                <div class="flex gap-3 pt-2">
                    <button type="submit"
                            class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2 rounded-lg transition text-sm">
                        Them San Pham
                    </button>
                    <a href="controller"
                       class="border border-gray-300 hover:bg-gray-50 text-gray-600 font-semibold px-5 py-2 rounded-lg transition text-sm">
                        Quay Lai
                    </a>
                </div>
            </form>
        </div>
    </div>

</div>
<script>
    function previewImage(input) {
        var preview = document.getElementById('preview');
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.classList.remove('hidden');
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>
