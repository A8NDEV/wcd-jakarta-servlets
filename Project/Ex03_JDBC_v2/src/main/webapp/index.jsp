<%@page import="java.util.List"%>
<%@page import="com.fpt.entity.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (request.getAttribute("list") == null && request.getParameter("keyword") == null) {
        response.sendRedirect(request.getContextPath() + "/course");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Course Management System</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
        <style>
            body { font-family: 'Inter', sans-serif; }
        </style>
    </head>
    <body class="bg-slate-50 min-h-screen py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-5xl mx-auto">
            <div class="mb-6 flex items-center justify-between">
                <h1 class="text-4xl font-extrabold text-slate-900 sm:text-5xl tracking-tight">Course Management</h1>
                <a href="${pageContext.request.contextPath}/course?action=create"
                   class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2.5 rounded-lg transition-colors">
                    + Add Course
                </a>
            </div>
            <form action="${pageContext.request.contextPath}/course" method="get" class="mb-6 flex gap-2">
                <input type="text" name="keyword" value="${keyword}"
                       placeholder="Search by code..."
                       class="flex-1 border border-slate-300 rounded-lg px-4 py-2.5 focus:outline-none focus:ring-2 focus:ring-blue-500"/>
                <button type="submit"
                        class="bg-slate-800 hover:bg-slate-900 text-white font-semibold px-5 py-2.5 rounded-lg transition-colors">
                    Search
                </button>
                <a href="${pageContext.request.contextPath}/course"
                   class="bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold px-5 py-2.5 rounded-lg transition-colors">
                    Reset
                </a>
            </form>

            <div class="bg-white shadow-xl rounded-2xl overflow-hidden border border-slate-200">
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-slate-900 text-white">
                                <th class="py-4 px-6">ID</th>
                                <th class="py-4 px-6">Code</th>
                                <th class="py-4 px-6">Course Name</th>
                                <th class="py-4 px-6">Semester</th>
                                <th class="py-4 px-6">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-200">
                            <%
                                List<Course> list = (List<Course>) request.getAttribute("list");
                                if (list != null && !list.isEmpty()) {
                                    for (Course c : list) {
                            %>
                                <tr class="hover:bg-blue-50 transition-colors">
                                    <td class="py-4 px-6 text-slate-700 font-medium"><%= c.getId() %></td>
                                    <td class="py-4 px-6">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                            <%= c.getCode() %>
                                        </span>
                                    </td>
                                    <td class="py-4 px-6 text-slate-900 font-semibold"><%= c.getName() %></td>
                                    <td class="py-4 px-6">
                                        <span class="text-slate-600 bg-slate-100 px-3 py-1 rounded-lg text-sm">
                                            <%= c.getSemester() %>
                                        </span>
                                    </td>
                                    <td class="py-4 px-6 flex gap-2">
                                        <a href="${pageContext.request.contextPath}/course?action=update&id=<%= c.getId() %>"
                                           class="bg-yellow-400 hover:bg-yellow-500 text-white text-sm font-semibold px-3 py-1.5 rounded-lg transition-colors">
                                            Edit
                                        </a>
                                        <a href="${pageContext.request.contextPath}/course?action=delete&id=<%= c.getId() %>"
                                           onclick="return confirm('Delete this course?')"
                                           class="bg-red-500 hover:bg-red-600 text-white text-sm font-semibold px-3 py-1.5 rounded-lg transition-colors">
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            <%
                                    }
                                } else {
                            %>
                                <tr>
                                    <td colspan="4" class="py-20 text-center text-slate-500">
                                        No courses found (Debug: list is <%= (list == null ? "NULL" : "EMPTY") %>)
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
