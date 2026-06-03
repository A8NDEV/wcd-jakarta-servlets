<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create new Phone - Phone Library</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Tailwind CSS Play CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gradient-to-br from-slate-950 via-slate-900 to-indigo-950 min-h-screen flex items-center justify-center text-slate-100 p-6 md:p-12 relative overflow-x-hidden font-sans">
    
    <!-- Ambient glowing backgrounds -->
    <div class="absolute top-10 left-10 w-96 h-96 bg-indigo-600/10 rounded-full blur-[120px] pointer-events-none"></div>
    <div class="absolute bottom-10 right-10 w-96 h-96 bg-purple-600/10 rounded-full blur-[120px] pointer-events-none"></div>

    <div class="w-full max-w-[500px] z-10">
        <div class="bg-slate-900/60 backdrop-blur-xl border border-slate-800/80 rounded-3xl p-8 md:p-10 shadow-2xl">
            
            <h1 class="text-3xl font-extrabold tracking-tight bg-gradient-to-r from-indigo-300 to-purple-400 bg-clip-text text-transparent text-center mb-2">
                Create new Phone
            </h1>
            <p class="text-slate-400 text-sm text-center mb-8">
                Enter the specifications to insert a new phone to database
            </p>

            <!-- Error Alerts Box -->
            <div id="errorAlert" class="hidden bg-red-500/10 border border-red-500/20 rounded-xl p-4 mb-6 text-sm text-red-400 items-center gap-2">
                <strong>⚠️ Error:</strong> <span id="errorMsg"></span>
            </div>

            <form action="PhoneServlet" method="POST" enctype="multipart/form-data" id="phoneForm" onsubmit="return validateForm()" class="space-y-6">
                
                <div>
                    <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="txtName">
                        Model Name
                    </label>
                    <input type="text" id="txtName" name="txtName" 
                           class="w-full bg-slate-950/60 border border-slate-800 rounded-xl px-4 py-3 text-sm text-slate-100 placeholder-slate-600 focus:outline-none focus:border-indigo-500 focus:ring-2 focus:ring-indigo-500/20 transition-all" 
                           placeholder="e.g. iPhone 15 Pro Max" autocomplete="off">
                </div>

                <div>
                    <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2" for="txtPrice">
                        Price ($)
                    </label>
                    <input type="text" id="txtPrice" name="txtPrice" 
                           class="w-full bg-slate-950/60 border border-slate-800 rounded-xl px-4 py-3 text-sm text-slate-100 placeholder-slate-600 focus:outline-none focus:border-indigo-500 focus:ring-2 focus:ring-indigo-500/20 transition-all" 
                           placeholder="e.g. 1099.99">
                </div>

                <div>
                    <label class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">
                        Phone Image
                    </label>
                    <div class="relative w-full h-[56px] bg-slate-950/60 border border-dashed border-slate-800 hover:border-indigo-500 hover:bg-indigo-500/5 rounded-xl flex items-center justify-center cursor-pointer transition-all" id="fileUploadWrapper">
                        <input type="file" id="txtImage" name="txtImage" class="absolute top-0 left-0 w-full h-full opacity-0 cursor-pointer" accept="image/*" onchange="displayFileName()">
                        <div class="text-sm text-slate-400 flex items-center gap-2" id="uploadLabel">
                            📁 <span class="text-indigo-400 font-medium">Choose File</span> or drag image here
                        </div>
                    </div>
                </div>

                <button type="submit" 
                        class="w-full bg-indigo-600 hover:bg-indigo-700 active:scale-[0.98] text-white rounded-xl py-3.5 font-semibold shadow-lg shadow-indigo-600/30 transition-all mt-4">
                    Create
                </button>
            </form>
        </div>
    </div>

    <script>
        function displayFileName() {
            const fileInput = document.getElementById('txtImage');
            const wrapper = document.getElementById('fileUploadWrapper');
            const label = document.getElementById('uploadLabel');
            
            if (fileInput.files.length > 0) {
                const fileName = fileInput.files[0].name;
                label.innerHTML = `✅ Selected: <span class="text-emerald-400 font-medium">${fileName}</span>`;
                wrapper.className = "relative w-full h-[56px] bg-slate-950/60 border border-solid border-emerald-500 rounded-xl flex items-center justify-center cursor-pointer transition-all";
            } else {
                label.innerHTML = `📁 <span class="text-indigo-400 font-medium">Choose File</span> or drag image here`;
                wrapper.className = "relative w-full h-[56px] bg-slate-950/60 border border-dashed border-slate-800 hover:border-indigo-500 hover:bg-indigo-500/5 rounded-xl flex items-center justify-center cursor-pointer transition-all";
            }
        }

        function validateForm() {
            const name = document.getElementById('txtName').value.trim();
            const priceStr = document.getElementById('txtPrice').value.trim();
            const image = document.getElementById('txtImage').files;
            const alertBox = document.getElementById('errorAlert');

            alertBox.classList.add('hidden');
            alertBox.classList.remove('flex');

            // 1. Validation: fields not blank
            if (name === '') {
                showError('Model Name is required and cannot be blank.');
                return false;
            }

            if (priceStr === '') {
                showError('Price is required and cannot be blank.');
                return false;
            }

            if (image.length === 0) {
                showError('Please choose a phone image to upload.');
                return false;
            }

            // 2. Validation: price greater than zero
            const price = parseFloat(priceStr);
            if (isNaN(price)) {
                showError('Price must be a valid numeric value.');
                return false;
            }

            if (price <= 0) {
                showError('Price must be greater than zero ($0).');
                return false;
            }

            return true;
        }

        function showError(message) {
            const alertBox = document.getElementById('errorAlert');
            const msgSpan = document.getElementById('errorMsg');
            msgSpan.textContent = message;
            alertBox.classList.remove('hidden');
            alertBox.classList.add('flex');
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</body>
</html>
