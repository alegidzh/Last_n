<%@ page import="blogs.Blog" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="math.Numeric" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="../styles/style.css">
</head>
<body>
<div class="container">
    <%@include file="blocks/header.jsp"%>
    <%@include file="blocks/leftSidebar.jsp" %>
    <div class="news">
        <%
                Numeric numeric = new Numeric();
                String blogIdFromUrl = request.getParameter("id");

                if (numeric.isNumeric(blogIdFromUrl)){
                    int blogId = Integer.parseInt(blogIdFromUrl);
                    Blog blog = new Blog();
                    ResultSet resultSet = blog.getBlogById(blogId);
                    while (resultSet.next()){
                        blog.setTitle(resultSet.getString("title"));
                        blog.setText(resultSet.getString("text"));
                        out.println("<b>" +blog.getTitle() +"</b><br>");
                        out.println(blog.getText());
                    }
                    out.println("<br>Connection is closed now: " +blog.getCon() +"<br>");
                    out.println("Connection is closed now: " +blog.getStmt() +"<br>");
                    out.println("Connection is closed now: " +blog.getResultSet() +"<br>");

                    blog.closeConnection();
                    blog.closeStatement();
                    blog.closeResultSet();
                    out.println("<br>");
                    out.println("Connection is closed now: " +blog.getCon() +"<br>");
                    out.println("Connection is closed now: " +blog.getStmt() +"<br>");
                    out.println("Connection is closed now: " +blog.getResultSet() +"<br>");
                }else {
                    Blog allBlogRecords = new Blog();
                    ResultSet blogResultset = allBlogRecords.getBlogsFromDatabase();
                    while (blogResultset.next()){
                        out.println("<p>");
                        out.println(
                                "<a href='?id="+blogResultset.getString("id")+"'>"+blogResultset.getString("title") +"</a>"
                                        +" <br>Created by: " +blogResultset.getString("nickname"));
                        out.println(blogResultset.getString("created_at"));
                        out.println("</p>");
                    }
                    allBlogRecords.closeConnection();
                    allBlogRecords.closeStatement();
                    allBlogRecords.closeResultSet();

                }


        %>
    </div>
    <div class="clearfix"></div>
</div>

</body>
<div><%@ include file="blocks/footer.jsp"%></div>
</html>
