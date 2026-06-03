<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Successfully - Phone Library</title>
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
    
    <!-- Decorative Glowing Circle -->
    <div class="absolute top-1/4 left-1/4 w-80 h-80 bg-emerald-600/10 rounded-full blur-[100px] pointer-events-none"></div>

    <div class="w-full max-w-[420px] z-10">
        <div class="bg-slate-900/60 backdrop-blur-xl border border-slate-800/80 rounded-3xl p-8 md:p-10 shadow-2xl text-center">
            
            <div class="text-5xl text-emerald-500 mb-6 animate-bounce">
                ✨
            </div>
            
            <h2 class="text-2xl font-bold tracking-tight text-slate-100 mb-3">
                Success!
            </h2>
            
            <p class="text-slate-400 text-sm leading-relaxed mb-8">
                <% 
                    String msg = (String) request.getAttribute("sucess");
                    if (msg == null) msg = "Phone record was inserted successfully!";
                    out.print(msg);
                %>
            </p>
            
            <a href="create.jsp" 
               class="block w-full text-center bg-emerald-500 hover:bg-emerald-600 active:scale-[0.98] text-white rounded-xl py-3.5 font-semibold shadow-lg shadow-emerald-500/20 transition-all">
                Create Another Phone
            </a>

        </div>
    </div>
</body>
</html>
