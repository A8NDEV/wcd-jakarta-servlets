<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test UEL</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body class="min-h-screen bg-[#0a0e1a] flex items-center justify-center p-8 font-[Inter]">
        <div class="w-full max-w-xl">
            <!-- Header -->
            <div class="text-center mb-8">
                <div class="inline-flex items-center gap-2 bg-indigo-500/10 border border-indigo-500/25 text-indigo-300 text-xs font-semibold uppercase tracking-widest px-4 py-1.5 rounded-full mb-4">
                    <span class="w-1.5 h-1.5 rounded-full bg-indigo-400 animate-pulse"></span>
                    Jakarta EE · UEL Demo
                </div>
                <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-br from-slate-100 via-indigo-200 to-indigo-400 mb-2">
                    Expression Language
                </h1>
                <p class="text-slate-500 text-sm">Testing Unified Expression Language (UEL) features in JSP</p>
            </div>

            <!-- Card Container -->
            <div class="bg-white/[0.04] border border-white/[0.08] rounded-2xl p-6 backdrop-blur-xl shadow-2xl space-y-4">
                
                <!-- 1. Math EL -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">1. Basic Expression (EL =&gt; \${10 + 20})</span>
                    <span class="text-base font-semibold text-blue-400">
                        10 + 20 = ${10 + 20}
                    </span>
                </div>

                <%
                    int num = 100;
                    // Dùng pageContext để đưa vào scope cho EL truy cập
                    pageContext.setAttribute("number", num);
                %>

                <!-- 2. Scriptlet -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">2. Dùng Scriptlet (&lt;%= num %&gt;)</span>
                    <span class="text-base font-semibold text-emerald-400">
                        num = <%= num %>
                    </span>
                </div>

                <!-- 3. Read from Scriptlet using EL -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">3. Đọc từ Scriptlet qua EL (\${number})</span>
                    <span class="text-base font-semibold text-purple-400">
                        number = ${number}
                    </span>
                </div>

                <!-- 4. pageScope dot operator -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">4. Dùng pageScope với Dot Operator (\${pageScope.number})</span>
                    <span class="text-base font-semibold text-amber-400">
                        number = ${pageScope.number}
                    </span>
                </div>

                <!-- 5. pageScope bracket operator -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">5. Dùng pageScope với Bracket Operator (\${pageScope["number"]})</span>
                    <span class="text-base font-semibold text-rose-400">
                        number = ${pageScope["number"]}
                    </span>
                </div>

                <!-- Back Link -->
                <div class="pt-4 text-center border-t border-white/5">
                    <a href="./index.html" class="inline-flex items-center gap-2 text-xs text-slate-500 hover:text-indigo-400 transition-colors">
                        ← Back to Test Suite Index
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
