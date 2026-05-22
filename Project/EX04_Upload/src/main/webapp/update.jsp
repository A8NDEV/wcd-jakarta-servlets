<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cap Nhat San Pham</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">
<div class="container mx-auto px-4 py-8 max-w-xl">

    <!-- Breadcrumb -->
    <nav class="text-sm text-gray-500 mb-4">
        <a href="controller" class="hover:text-blue-600">Danh Sach</a>
        <span class="mx-2">/</span>
        <span class="text-gray-800 font-medium">Cap Nhat San Pham</span>
    </nav>

    <div class="bg-white rounded-xl shadow overflow-hidden">
        <div class="bg-yellow-400 px-5 py-4">
            <h2 class="text-gray-800 font-semibold text-lg">Cap Nhat San Pham</h2>
        </div>
        <div class="p-5">
            <form action="controller" method="post" enctype="multipart/form-data" class="space-y-4">
                <input type="hidden" name="action"      value="process-update">
                <input type="hidden" name="txtCode"     value="${product.code}">
                <input type="hidden" name="txtFilename" value="${product.filename}">

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Ma San Pham</label>
                    <input type="text"
                           class="w-full border border-gray-200 rounded-lg px-3 py-2 text-sm bg-gray-100 text-gray-500 cursor-not-allowed"
                           value="${product.code}" readonly>
                    <p class="text-xs text-gray-400 mt-1">Ma san pham khong the thay doi.</p>
                </div>

                <div>
                    <label for="txtName" class="block text-sm font-medium text-gray-700 mb-1">
                        Ten San Pham <span class="text-red-500">*</span>
                    </label>
                    <input type="text" id="txtName" name="txtName"
                           class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-yellow-400"
                           value="${product.name}" required maxlength="255">
                </div>

                <div>
                    <label for="txtPrice" class="block text-sm font-medium text-gray-700 mb-1">
                        Gia (VND) <span class="text-red-500">*</span>
                    </label>
                    <input type="number" id="txtPrice" name="txtPrice"
                           class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-yellow-400"
                           value="${product.price}" required min="0">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">Hinh Anh</label>
                    <div class="flex gap-4 items-start">
                        <div class="text-center">
                            <p class="text-xs text-gray-400 mb-1">Anh hien tai</p>
                            <img src="product_images/${product.filename}"
                                 alt="Current"
                                 class="w-24 h-24 object-cover rounded-lg border border-gray-200"
                                 onerror="this.style.display='none'">
                        </div>
                        <div class="flex-1">
                            <p class="text-xs text-gray-400 mb-1">Anh moi (tuy chon)</p>
                            <img id="newPreview"
                                 class="w-24 h-24 object-cover rounded-lg border-2 border-dashed border-yellow-400 mb-2 hidden"
                                 alt="New Preview">
                            <input type="file" id="txtImage" name="txtImage"
                                   class="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none"
                                   accept="image/*" onchange="previewNew(this)">
                            <p class="text-xs text-gray-400 mt-1">De trong neu muon giu anh cu.</p>
                        </div>
                    </div>
                </div>

                <div class="flex gap-3 pt-2">
                    <button type="submit"
                            class="bg-yellow-400 hover:bg-yellow-500 text-gray-800 font-semibold px-5 py-2 rounded-lg transition text-sm">
                        Luu Thay Doi
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
    function previewNew(input) {
        var preview = document.getElementById('newPreview');
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.classList.remove('hidden');
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            preview.classList.add('hidden');
        }
    }
</script>
</body>
</html>
