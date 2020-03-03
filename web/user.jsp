<%@ page import="users.User" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../styles/style.css">
</head>
<body>
<div class="container">
    <%@include file="blocks/header.jsp"%>
    <%@include file="blocks/leftSidebar.jsp"%>
    <div class="news">
        <%
            String nick = request.getParameter("nick");
            User user = new User();
            ResultSet resultSet = user.getUserInfoFromDbByNickname(nick);
            while (resultSet.next()){
                out.print("Nick: " +resultSet.getString("nickname") +"<br>");
                out.print("Name: " +resultSet.getString("name") +"<br>");
                out.print("Country: " +resultSet.getString("country") +"<br>");
                out.print("Gender: " +resultSet.getString("gender") +"<br>");
                out.print("Website: " +resultSet.getString("website") +"<br>");
            }
        %>
    </div>
</div>


</body>
</html>



