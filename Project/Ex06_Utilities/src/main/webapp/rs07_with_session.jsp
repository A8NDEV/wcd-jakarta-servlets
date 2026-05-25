<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Page with session</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body class="min-h-screen bg-[#0a0e1a] flex items-center justify-center p-8 font-[Inter]">
        <div class="w-full max-w-xl">
            <!-- Header -->
            <div class="text-center mb-8">
                <div class="inline-flex items-center gap-2 bg-amber-500/10 border border-amber-500/25 text-amber-300 text-xs font-semibold uppercase tracking-widest px-4 py-1.5 rounded-full mb-4">
                    <span class="w-1.5 h-1.5 rounded-full bg-amber-400 animate-pulse"></span>
                    Jakarta EE · Session Demo
                </div>
                <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-br from-slate-100 via-indigo-200 to-indigo-400 mb-2">
                    Set Session Data
                </h1>
                <p class="text-slate-500 text-sm">Saving data to the HTTP Session</p>
            </div>

            <!-- Card -->
            <div class="bg-white/[0.04] border border-white/[0.08] rounded-2xl p-6 backdrop-blur-xl shadow-2xl">
                <form action="rs08_session.jsp" method="POST" class="space-y-5">
                    <%
                        // Set a session attribute as an example
                        session.setAttribute("demoTime", new java.util.Date().toString());
                    %>
                    <div class="bg-emerald-500/10 border border-emerald-500/20 rounded-xl p-4 flex gap-3 text-emerald-200 text-sm mb-4">
                        <span class="text-xl">✅</span>
                        <p>Session initialized. A timestamp attribute <code>demoTime</code> has been set.</p>
                    </div>

                    <div class="flex flex-col gap-2">
                        <label class="text-slate-300 text-xs font-semibold uppercase tracking-wider font-medium">Session Value to Save</label>
                        <input type="text" 
                               name="sessionVal" 
                               placeholder="Enter a value to store in session..." 
                               autofocus 
                               required
                               class="w-full bg-slate-950/40 border border-white/10 rounded-xl px-4 py-3 text-slate-200 placeholder-slate-600 focus:outline-none focus:border-indigo-500 focus:ring-1 focus:ring-indigo-500 transition-all duration-200 text-sm">
                    </div>
                    
                    <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-500 active:bg-indigo-700 text-white font-medium text-sm py-3 px-4 rounded-xl shadow-lg shadow-indigo-600/10 hover:shadow-indigo-500/20 transition-all duration-200 flex items-center justify-center gap-2">
                        Save and View Session
                        <span class="text-indigo-200">→</span>
                    </button>
                </form>

                <div class="mt-6 pt-4 border-t border-white/5 text-center">
                    <a href="./index.html" class="inline-flex items-center gap-2 text-xs text-slate-500 hover:text-indigo-400 transition-colors">
                        ← Back to Test Suite Index
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
