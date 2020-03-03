<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Add new article</title>
</head>
<body>
<form id="createArticle" method="post" action="./addarticle">
    <p><label>Title: </label><input type="text" name="title"></p>
    <p><label>Intro: </label><input type="text" name="intro"></p>
    <p><label>Text: </label><textarea name="articleText" form="createArticle"></textarea></p>
    <p><label>Author: </label><input type="text" name="author"></p>
    <p><input type="submit" value="Submit" name="addArticle"></p>
</form>
</body>
</html>
