<%--
  Created by IntelliJ IDEA.
  User: olegi
  Date: 1/24/2020
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/styles/style.css">
</head>
<body>
<div class="container">
    <%@include file="../blocks/header.jsp"%>
    <%@include file="../blocks/leftSidebar.jsp" %>
    <% String blogAuthorNickname = (String) session.getAttribute("nickname"); %>
    <div class="news">
        <form method="post" action="/addblog">
            <input type="text" name="title"><br>
            <textarea name="text"></textarea><br>
            <input type="hidden" name="nickname" value="<%=blogAuthorNickname%>">
            <input type="submit">
        </form>
    </div>
    <div class="clearfix"></div>
</div>

</body>
<div><%@ include file="../blocks/footer.jsp"%></div>
</html>