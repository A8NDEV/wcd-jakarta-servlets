<%@taglib prefix="mytag" uri="/WEB-INF/tlds/mytag.tld"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TLD Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body class="min-h-screen bg-[#0a0e1a] flex items-center justify-center p-8 font-[Inter]">
        <div class="w-full max-w-xl">
            <!-- Header -->
            <div class="text-center mb-8">
                <div class="inline-flex items-center gap-2 bg-indigo-500/10 border border-indigo-500/25 text-indigo-300 text-xs font-semibold uppercase tracking-widest px-4 py-1.5 rounded-full mb-4">
                    <span class="w-1.5 h-1.5 rounded-full bg-indigo-400 animate-pulse"></span>
                    Jakarta EE · TLD Demo
                </div>
                <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-br from-slate-100 via-indigo-200 to-indigo-400 mb-2">
                    Tag Library Descriptor
                </h1>
                <p class="text-slate-500 text-sm">Testing Custom EL Functions defined in a TLD file</p>
            </div>

            <!-- Card -->
            <div class="bg-white/[0.04] border border-white/[0.08] rounded-2xl p-6 backdrop-blur-xl shadow-2xl space-y-6">
                <%
                    String name = "công tăng tôn nữ tạ thị tầm thường thế thôi";
                    pageContext.setAttribute("name", name);
                %>
                
                <!-- Display by scriptlet -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1.5">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">1. Display by scriptlet</span>
                    <span class="text-sm font-medium text-slate-300">
                        <%= name %>
                    </span>
                </div>

                <!-- Display by EL Function -->
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1.5">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">2. Display by Taglib (EL Function)</span>
                    <span class="text-lg font-semibold text-indigo-400">
                        ${mytag:chuhoa(name)}
                    </span>
                </div>

                <!-- Back Link -->
                <div class="pt-2 text-center">
                    <a href="./index.html" class="inline-flex items-center gap-2 text-sm text-slate-400 hover:text-indigo-400 transition-colors">
                        ← Back to Test Suite Index
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
