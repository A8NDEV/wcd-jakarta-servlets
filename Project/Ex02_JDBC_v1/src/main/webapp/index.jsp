<%@page import="java.util.List"%>
<%@page import="com.fpt.entity.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="mb-10 flex items-center justify-between">
                <h1 class="text-4xl font-extrabold text-slate-900 sm:text-5xl tracking-tight">Course Management</h1>
                <a href="${pageContext.request.contextPath}/course/create"
                   class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-5 py-2.5 rounded-lg transition-colors">
                    + Add Course
                </a>
            </div>

            <div class="bg-white shadow-xl rounded-2xl overflow-hidden border border-slate-200">
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse">
                        <thead>
                            <tr class="bg-slate-900 text-white">
                                <th class="py-4 px-6">ID</th>
                                <th class="py-4 px-6">Code</th>
                                <th class="py-4 px-6">Course Name</th>
                                <th class="py-4 px-6">Semester</th>
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
