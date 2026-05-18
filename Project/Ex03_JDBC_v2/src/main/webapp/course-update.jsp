<%@page import="com.fpt.entity.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Edit Course</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
        <style>body { font-family: 'Inter', sans-serif; }</style>
    </head>
    <body class="bg-slate-50 min-h-screen py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-lg mx-auto">
            <div class="mb-8 text-center">
                <h1 class="text-3xl font-extrabold text-slate-900 tracking-tight">Edit Course</h1>
            </div>

            <%
                Course course = (Course) request.getAttribute("course");
            %>

            <div class="bg-white shadow-xl rounded-2xl p-8 border border-slate-200">
                <form action="${pageContext.request.contextPath}/course?action=update" method="post" class="space-y-5">
                    <input type="hidden" name="id" value="<%= course.getId() %>"/>
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Code</label>
                        <input type="text" name="code" required value="<%= course.getCode() %>"
                               class="w-full border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                    </div>
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Course Name</label>
                        <input type="text" name="name" required value="<%= course.getName() %>"
                               class="w-full border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                    </div>
                    <div>
                        <label class="block text-sm font-semibold text-slate-700 mb-1">Semester</label>
                        <select name="semester"
                                class="w-full border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500">
                            <option value="HK1" <%= "HK1".equals(course.getSemester()) ? "selected" : "" %>>HK1</option>
                            <option value="HK2" <%= "HK2".equals(course.getSemester()) ? "selected" : "" %>>HK2</option>
                            <option value="HK3" <%= "HK3".equals(course.getSemester()) ? "selected" : "" %>>HK3</option>
                            <option value="HK4" <%= "HK4".equals(course.getSemester()) ? "selected" : "" %>>HK4</option>
                            <option value="HK5" <%= "HK5".equals(course.getSemester()) ? "selected" : "" %>>HK5</option>
                        </select>
                    </div>
                    <div class="flex gap-3 pt-2">
                        <button type="submit"
                                class="flex-1 bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2.5 rounded-lg transition-colors">
                            Update
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
