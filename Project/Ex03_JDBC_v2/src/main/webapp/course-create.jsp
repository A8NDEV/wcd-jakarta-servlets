<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Course</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
        <style>body { font-family: 'Inter', sans-serif; }</style>
    </head>
    <body class="bg-slate-50 min-h-screen py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-lg mx-auto">
            <div class="mb-8 text-center">
                <h1 class="text-3xl font-extrabold text-slate-900 tracking-tight">Add New Course</h1>
            </div>

            <div class="bg-white shadow-xl rounded-2xl p-8 border border-slate-200">
                <form action="${pageContext.request.contextPath}/course?action=create" method="post" class="space-y-5">
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Code</label>
                        <input type="text" name="code" required
                               class="w-full border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500"
                               placeholder="e.g. CS101"/>
                    </div>
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Course Name</label>
                        <input type="text" name="name" required
                               class="w-full border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500"
                               placeholder="e.g. Introduction to Programming"/>
                    </div>
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Semester</label>
                        <select name="semester"
                                class="w-full border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="HK1">HK1</option>
                            <option value="HK2">HK2</option>
                            <option value="HK3">HK3</option>
                            <option value="HK4">HK4</option>
                            <option value="HK5">HK5</option>
                        </select>
                    </div>
                    <div class="flex gap-3 pt-2">
                        <button type="submit"
                                class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2.5 rounded-lg transition-colors">
                            Save
                        </button>
                        <a href="${pageContext.request.contextPath}/course"
                           class="flex-1 text-center bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold py-2.5 rounded-lg transition-colors">
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
