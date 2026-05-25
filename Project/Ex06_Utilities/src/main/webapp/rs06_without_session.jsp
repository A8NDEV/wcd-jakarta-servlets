<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Page without session</title>
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
                    Without Session
                </h1>
                <p class="text-slate-500 text-sm">Testing a page with session="false" directive</p>
            </div>

            <!-- Card -->
            <div class="bg-white/[0.04] border border-white/[0.08] rounded-2xl p-6 backdrop-blur-xl shadow-2xl space-y-4">
                
                <div class="bg-slate-950/40 border border-white/5 rounded-xl p-4 flex flex-col gap-1">
                    <span class="text-xs font-medium text-slate-500 uppercase tracking-wider">Page Directive</span>
                    <span class="text-sm text-slate-300 font-mono mt-2">
                        &lt;%@page session="false"%&gt;
                    </span>
                </div>

                <div class="bg-amber-500/10 border border-amber-500/20 rounded-xl p-4 flex gap-3 text-amber-200 text-sm">
                    <span class="text-xl">⚠️</span>
                    <p>The implicit <code>session</code> object is <strong>not available</strong> on this page. Using it in scriptlets will cause a compilation error.</p>
                </div>

                <div class="pt-4 text-center border-t border-white/5">
                    <a href="./index.html" class="inline-flex items-center gap-2 text-xs text-slate-500 hover:text-indigo-400 transition-colors">
                        ← Back to Test Suite Index
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
