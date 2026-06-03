<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Login - Phone Library</title>
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
<body class="bg-gradient-to-br from-slate-950 via-slate-900 to-indigo-950 min-h-screen flex items-center justify-center text-slate-100 p-4 relative overflow-hidden font-sans">
    
    <!-- Decorative Glowing Circles -->
    <div class="absolute top-1/4 left-1/4 w-80 h-80 bg-indigo-600/20 rounded-full blur-[100px] pointer-events-none"></div>
    <div class="absolute bottom-1/4 right-1/4 w-80 h-80 bg-pink-600/20 rounded-full blur-[100px] pointer-events-none"></div>

    <div class="w-full max-w-[420px] z-10">
        <div class="bg-slate-900/60 backdrop-blur-xl border border-slate-800/80 rounded-3xl p-8 md:p-10 shadow-2xl text-center">
            
            <h1 class="text-3xl font-extrabold tracking-tight bg-gradient-to-r from-indigo-300 to-pink-400 bg-clip-text text-transparent mb-2">
                PHONE PORTAL
            </h1>
            <p class="text-slate-400 text-sm mb-8">
                Please sign in as Admin to manage phones
            </p>

            <form action="j_security_check" method="POST" class="space-y-6 text-left">
                <div>
                    <label for="username" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">
                        Username
                    </label>
                    <input type="text" id="username" name="j_username" 
                           class="w-full bg-slate-950/60 border border-slate-800 rounded-xl px-4 py-3.5 text-sm text-slate-100 placeholder-slate-500 focus:outline-none focus:border-indigo-500 focus:ring-2 focus:ring-indigo-500/20 transition-all" 
                           placeholder="Enter admin username" required autocomplete="off">
                </div>

                <div>
                    <label for="password" class="block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-2">
                        Password
                    </label>
                    <input type="password" id="password" name="j_password" 
                           class="w-full bg-slate-950/60 border border-slate-800 rounded-xl px-4 py-3.5 text-sm text-slate-100 placeholder-slate-500 focus:outline-none focus:border-indigo-500 focus:ring-2 focus:ring-indigo-500/20 transition-all" 
                           placeholder="Enter password" required>
                </div>

                <button type="submit" 
                        class="w-full bg-indigo-600 hover:bg-indigo-700 active:scale-[0.98] text-white rounded-xl py-3.5 font-semibold shadow-lg shadow-indigo-600/30 transition-all mt-4">
                    Sign In
                </button>
            </form>

        </div>
    </div>
</body>
</html>
