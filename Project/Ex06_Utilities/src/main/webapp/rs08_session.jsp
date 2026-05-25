<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Session Page</title>
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
                    Session Data
                </h1>
                <p class="text-slate-500 text-sm">Viewing data stored in the HTTP Session</p>
            </div>

            <!-- Card -->
            <div class="bg-white/[0.04] border border-white/[0.08] rounded-2xl p-6 backdrop-blur-xl shadow-2xl space-y-4">
                
                <%
                    if ("invalidate".equals(request.getParameter("action"))) {
                        session.invalidate();
                        response.sendRedirect("rs08_session.jsp");
                        return; // Stop processing page after redirect
                    }
                %>

                <%
                    String sessionVal = request.getParameter("sessionVal");
                    if (sessionVal != null && !sessionVal.trim().isEmpty()) {
                        session.setAttribute("userValue", sessionVal);
                    }
                %>

                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">Session ID</span>
                    <span class="text-sm font-semibold text-emerald-400 font-mono mt-1 break-all">
                        <%= session.getId() %>
                    </span>
                </div>

                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">Timestamp (demoTime)</span>
                    <span class="text-sm font-semibold text-blue-400 mt-1">
                        <%= session.getAttribute("demoTime") != null ? session.getAttribute("demoTime") : "<span class='text-slate-500 italic'>Not Set</span>" %>
                    </span>
                </div>

                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">User Value (userValue)</span>
                    <span class="text-sm font-semibold text-purple-400 mt-1">
                        <%= session.getAttribute("userValue") != null ? session.getAttribute("userValue") : "<span class='text-slate-500 italic'>Not Set</span>" %>
                    </span>
                </div>

                <div class="pt-4 mt-2 flex gap-3">
                    <a href="./rs07_with_session.jsp" class="flex-1 bg-white/5 hover:bg-white/10 text-slate-300 text-center text-sm py-2.5 rounded-xl transition-colors border border-white/5">
                        Set Values
                    </a>
                    <a href="?action=invalidate" class="flex-1 bg-red-500/10 hover:bg-red-500/20 text-red-400 text-center text-sm py-2.5 rounded-xl transition-colors border border-red-500/20">
                        Invalidate Session
                    </a>
                </div>

                <div class="mt-4 pt-4 border-t border-white/5 text-center">
                    <a href="./index.html" class="inline-flex items-center gap-2 text-xs text-slate-500 hover:text-indigo-400 transition-colors">
                        ← Back to Test Suite Index
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
