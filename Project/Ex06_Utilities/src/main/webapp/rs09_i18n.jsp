<%@page import="java.util.Locale"%>
<%@page import="java.util.ResourceBundle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Internationalization (i18n)</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body class="min-h-screen bg-[#0a0e1a] flex items-center justify-center p-8 font-[Inter]">
        <div class="w-full max-w-xl">
            <!-- Header -->
            <div class="text-center mb-8">
                <div class="inline-flex items-center gap-2 bg-blue-500/10 border border-blue-500/25 text-blue-300 text-xs font-semibold uppercase tracking-widest px-4 py-1.5 rounded-full mb-4">
                    <span class="w-1.5 h-1.5 rounded-full bg-blue-400 animate-pulse"></span>
                    Jakarta EE · i18n Demo
                </div>
                <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-br from-slate-100 via-indigo-200 to-indigo-400 mb-2">
                    Localization
                </h1>
                <p class="text-slate-500 text-sm">Testing ResourceBundle and Locales</p>
            </div>

            <!-- Logic -->
            <%
                // Determine language
                String langParam = request.getParameter("lang");
                if (langParam != null && (langParam.equals("en") || langParam.equals("vi"))) {
                    session.setAttribute("language", langParam);
                }
                
                String currentLang = (String) session.getAttribute("language");
                if (currentLang == null) {
                    currentLang = "en";
                }
                
                Locale locale = new Locale(currentLang);
                ResourceBundle messages = ResourceBundle.getBundle("messages", locale);
            %>

            <!-- Card -->
            <div class="bg-white/[0.04] border border-white/[0.08] rounded-2xl p-6 backdrop-blur-xl shadow-2xl space-y-5">
                
                <div class="flex items-center justify-between border-b border-white/5 pb-4 mb-2">
                    <span class="text-sm font-medium text-slate-400"><%= messages.getString("lbl.lang") %></span>
                    <div class="flex gap-2">
                        <a href="?lang=en" class="px-3 py-1.5 rounded-lg text-xs font-semibold transition-colors <%= currentLang.equals("en") ? "bg-blue-600 text-white shadow-lg shadow-blue-500/20" : "bg-white/5 text-slate-400 hover:bg-white/10" %>">
                            English
                        </a>
                        <a href="?lang=vi" class="px-3 py-1.5 rounded-lg text-xs font-semibold transition-colors <%= currentLang.equals("vi") ? "bg-red-600 text-white shadow-lg shadow-red-500/20" : "bg-white/5 text-slate-400 hover:bg-white/10" %>">
                            Tiếng Việt
                        </a>
                    </div>
                </div>

                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-5 text-center">
                    <h2 class="text-2xl font-bold text-slate-200 mb-2"><%= messages.getString("greeting") %></h2>
                    <p class="text-slate-400 text-sm"><%= messages.getString("info") %></p>
                </div>

                <div class="mt-6 pt-4 border-t border-white/5 text-center">
                    <a href="./index.html" class="inline-flex items-center gap-2 text-xs text-slate-500 hover:text-indigo-400 transition-colors">
                        ← Back to Test Suite Index
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
