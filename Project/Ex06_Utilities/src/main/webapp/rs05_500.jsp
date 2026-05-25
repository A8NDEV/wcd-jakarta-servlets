<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>500 - Internal Server Error</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    </head>
    <body class="min-h-screen bg-[#0a0e1a] flex items-center justify-center p-8 font-[Inter]">
        <div class="w-full max-w-xl text-center">
            <!-- Alert Badge -->
            <div class="inline-flex items-center gap-2 bg-red-500/10 border border-red-500/25 text-red-300 text-xs font-semibold uppercase tracking-widest px-4 py-1.5 rounded-full mb-6">
                <span class="w-1.5 h-1.5 rounded-full bg-red-400 animate-ping"></span>
                Error Status · 500
            </div>

            <!-- Big Error Number -->
            <h1 class="text-9xl font-extrabold text-transparent bg-clip-text bg-gradient-to-br from-red-400 via-rose-500 to-red-600 tracking-tight leading-none mb-4">
                500
            </h1>

            <h2 class="text-2xl font-bold text-slate-200 mb-3">Internal Server Error</h2>
            <p class="text-slate-500 text-sm max-w-md mx-auto mb-8">
                Oops! Something went wrong on our servers. A team of highly trained monkeys has been dispatched to look into the situation.
            </p>

            <!-- Error message container -->
            <% if (exception != null) { %>
                <div class="bg-red-500/5 border border-red-500/10 rounded-xl p-4 mb-8 text-left max-w-md mx-auto">
                    <span class="text-xs font-semibold text-red-400 uppercase tracking-wider block mb-1">Details:</span>
                    <span class="text-xs font-mono text-slate-400 break-words block">
                        <%= exception.getMessage() != null ? exception.getMessage() : exception.toString() %>
                    </span>
                </div>
            <% } %>

            <!-- Action Button -->
            <div>
                <a href="./index.html" class="inline-flex items-center gap-2 bg-slate-900 border border-white/10 hover:bg-slate-800 text-slate-300 font-medium text-sm py-3 px-6 rounded-xl transition-all duration-200 shadow-lg shadow-black/30">
                    ← Back to Test Suite
                </a>
            </div>
        </div>
    </body>
</html>
