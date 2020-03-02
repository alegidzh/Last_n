<%@ page import="java.sql.Connection" %>
<%@ page import="servlets.DatabaseConnection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>


<%--
  Created by IntelliJ IDEA.
  User: olegi
  Date: 12/21/2019
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="news.Article" %>
<%@ page import="news.Comments" %>

<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
  </head>
  <body>
  <div class="container">
    <%@include file="blocks/header.jsp"%>
    <%@include file="blocks/leftSidebar.jsp" %>
    <div class="news">
      <%  Article article = new Article();
        Comments comments = new Comments();
        try {
          ResultSet resultSet = article.getArticlesFromDatabase();
          int articleCountOnPage = 0;
          while (resultSet.next()) {
            if (articleCountOnPage == 3){
              break;
            }
            articleCountOnPage++;
            article.setAllArticlePropsFromDbResult(resultSet);
            int articleId = article.getId();
            String articleTitle = article.getTitle();
            String articleIntro = article.getIntro();
            String articleAuthor = article.getAuthor();
            String articleTimestamp = article.getTimestamp();

            String commentsCount = "";
            ResultSet resultSetCommentsCount = comments.getCommentsCount(articleId);
            while (resultSetCommentsCount.next()){
              commentsCount = resultSetCommentsCount.getString("comments_count");
            }

            out.println("<img src=\"/articleimg/" +articleId +".jpg\">");
            out.println("<h2><a href='"+"news/?article="+articleId +"'>"  +articleTitle +"</a> ("+commentsCount+")</h2>");
            out.println("<p>" +articleIntro +"</p>");
            out.println("<p> By: " +articleAuthor +" " +articleTimestamp + "</p>");

            comments.closeConnection();
            comments.closeStatement();
            comments.closeResultSet();
          }
          article.closeConnection();
          article.closeStatement();
          article.closeResultSet();
        } catch (SQLException e) {
          e.printStackTrace();
        } catch (ClassNotFoundException e) {
          e.printStackTrace();
        }
      %>
    </div>
    <div class="clearfix"></div>
  </div>

  </body>
<div><%@ include file="blocks/footer.jsp"%></div>
</html>