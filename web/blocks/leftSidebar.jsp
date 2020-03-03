<%@ page import="servlets.UserRegister" %>
<%@ page import="users.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="sidebarMenu">
    <div></div>
    <div class="auth">
        <%
            String nicknameAttributeFromSession = (String) session.getAttribute("nickname");
            if (nicknameAttributeFromSession != null) {
                out.println("Hello " +nicknameAttributeFromSession + "<br>");
                out.println("<a href='/user/?nick="+nicknameAttributeFromSession+"'>Account</a><br>");
                out.println("<a href='#'>Messages</a><br><br>");
                out.println("<a href=\"/blogs/addblog/\">Добавить блог</a><br>");
                out.println("<a href='#'>Create topic</a><br><br>");
                out.println("<a href='/logout'>Logout [x]</a><br>");
            } else {
                out.println("<form method=\"post\" action=\"/authchecker\">\n" +
                    "            <input type=\"text\" name=\"login\" >\n" +
                    "            <input type=\"password\" name=\"password\">\n" +
                    "            <input type=\"submit\" value=\"E\">\n" +
                    "        </form>");
                out.print("<a href=\"http://localhost:8080/register.jsp\">Register</a>");
            }
        %>
    </div>
    <div class="mainMenu">
        <ul>
            <li><a href="/">Главная</a></li>
            <li><a href="/news/">Новости</a></li>
            <li><a href="/blogs/">Блоги</a></li>
        </ul>
    </div>
</div>