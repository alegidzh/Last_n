<%@ page import="news.Article" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="math.Numeric" %>
<%@ page import="news.Comments" %>
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
            Numeric isNumeric = new Numeric();
            String articleIdFromUrl = request.getParameter("article");
            boolean isNumber = isNumeric.isNumeric(articleIdFromUrl);
            if (isNumber == true) {
                Article article = new Article();
                int articleIdNum = Integer.parseInt(articleIdFromUrl);
                ResultSet resultSet = article.getArticleFromDatabaseById(articleIdNum);
                while (resultSet.next()){
                    article.setAllArticlePropsFromDbResult(resultSet);
                    out.println("<h1>" + article.getTitle() +"</h1>");
                    out.println("<p>" +article.getText() +"</p>");
                    out.println("<p> By: " +article.getAuthor() +" " +article.getTimestamp() + "</p>");
                }
                article.closeConnection();
                article.closeStatement();
                article.closeResultSet();

                int commentCounter = 0;
                Comments comments = new Comments();
                ResultSet resultSetComments = comments.getCommentsByArticleId(articleIdNum);
                while (resultSetComments.next()){
                    commentCounter++;
                    comments.setNickname(resultSetComments.getString("nickname"));
                    comments.setText(resultSetComments.getString("text"));
                    out.print("<b>#"+commentCounter +" "+comments.getNickname() +"</b>");
                    out.print("<br>");
                    out.print(comments.getText());
                    out.print("<p></p>");
                }
                String nicknameFromSession = (String) session.getAttribute("nickname");
                if (nicknameFromSession == null){
                    out.print("Please login to comment");
                } else {
                    out.print("<div class=\"comments\">" +
                            "<div class=\"addComment\">" +
                            "<form method=\"post\" action=\"/addcomment\">" +
                            "<input type=\"hidden\" name=\"article_id\" value=\"" +articleIdFromUrl +"\">" +
                            "<input type=\"hidden\" name=\"nickname\" value=\"" +nicknameFromSession +"\"><br>" +
                            "<textarea placeholder=\"Текст\" name=\"text\" cols=\"40\" rows=\"4\"></textarea><br>" +
                            "<input type=\"submit\" value=\"Добавить комментарий\">" +
                            "</form>" +
                            "</div>" +
                            "</div>");
                }

                comments.closeConnection();
                comments.closeStatement();
                comments.closeResultSet();

            } else {
                Article article = new Article();
                Comments comments = new Comments();
                ResultSet resultSet = article.getArticlesFromDatabase();

                String commentsCount = "";
                while (resultSet.next()){
                    article.setAllArticlePropsFromDbResult(resultSet);
                    ResultSet resultSetCommentsCount = comments.getCommentsCount(article.getId());
                    while (resultSetCommentsCount.next()){
                        commentsCount = resultSetCommentsCount.getString("comments_count");
                    }
                    comments.closeConnection();
                    comments.closeStatement();
                    comments.closeResultSet();
                    out.println("<h2><a href='"+"/news/?article="+article.getId() +"'>" +article.getTitle() +"</a> ("+commentsCount+") </h2>");
                    out.println(article.getIntro());
                    out.println("<p> By: " +article.getAuthor()+" " +article.getTimestamp() +"</p>");
                }
                article.closeConnection();
                article.closeStatement();
                article.closeResultSet();
            }
        %>

    </div>
</div>


</body>
</html>
