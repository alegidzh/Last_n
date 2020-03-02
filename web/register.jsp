<%@ page import="news.Article" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="math.Numeric" %>
<%@ page import="news.Comments" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="servlets.DatabaseConnection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%--
  Created by IntelliJ IDEA.
  User: olegi
  Date: 12/23/2019
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
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
        <form method="post" action="/userregistration" enctype="multipart/form-data">
            <label>Ник</label>
            <input type="text" name="nickname"> <br>
            <label>Имя</label>
            <input type="text" name="name"> <br>
            <label>Пароль</label>
            <input type="password" name="password"> <br>
            <label>Повторите пароль</label>
            <input type="password2" name="repeatPassword"> <br>
            <label>Страна</label>
            <select name="country">
                <option>Латвия</option>
                <option>Россия</option>
                <option>Литва</option>
                <option>Эстония</option>
                <option>Беларусь</option>
                <option>Украина</option>
                <option>Польша</option>
                <option>Другая</option>
            </select>
            <br>
            <label>Город:</label>
            <input type="text" name="city">
            <br>
            <label>Дата рождения:</label>
            <select name="birth_day">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
                <option>13</option>
                <option>14</option>
                <option>15</option>
                <option>16</option>
                <option>17</option>
                <option>18</option>
                <option>19</option>
                <option>20</option>
                <option>21</option>
                <option>22</option>
                <option>23</option>
                <option>24</option>
                <option>25</option>
                <option>26</option>
                <option>27</option>
                <option>28</option>
                <option>29</option>
                <option>30</option>
                <option>31</option>
            </select>
            <select name="birth_month">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                <option>7</option>
                <option>8</option>
                <option>9</option>
                <option>10</option>
                <option>11</option>
                <option>12</option>
            </select>
            <select name="birth_year">
                <option>2005</option>
                <option>2004</option>
                <option>2003</option>
                <option>2002</option>
                <option>2001</option>
                <option>2000</option>
                <option>1999</option>
                <option>1998</option>
                <option>1997</option>
                <option>1996</option>
                <option>1995</option>
                <option>2019</option>
                <option>2019</option>
                <option>2019</option>
                <option>2019</option>
                <option>2019</option>
            </select>
            <br>
            <label>Пол:</label>
            <input type="radio"value="m" name="gender"> М
            <input type="radio"value="f" name="gender"> Ж
            <br>
            <label>Сайт:</label>
            <input type="text" name="website">
            <br>
            <label>Фото:</label>
            <input type="file" name="photo">
            <br>
            <label>Обо мне:</label>
            <textarea name="about_me"></textarea>
            <p><input type="submit" value="Зарегистрироваться"></p>
        </form>
    </div>
</div>


</body>
</html>
