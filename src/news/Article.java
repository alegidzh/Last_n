package news;

import servlets.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Article {
    private int id;
    private String title;
    private String intro;
    private String text;
    private String author;
    private String timestamp;
    private Connection con;
    private Statement stmt;
    private ResultSet resultSet;

    public Article() {
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public ResultSet getArticlesFromDatabase() throws SQLException, ClassNotFoundException {
            this.con = DatabaseConnection.initializeDatabase();
            this.stmt = con.createStatement();
            this.resultSet = stmt.executeQuery("SELECT * FROM articles ORDER BY id DESC");
            return this.resultSet;
    }

    public void setAllArticlePropsFromDbResult(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.title = resultSet.getString("title");
        this.intro = resultSet.getString("intro");
        this.text = resultSet.getString("text");
        this.author = resultSet.getString("author");
        this.timestamp = resultSet.getString("created_at");
    }

    public ResultSet getArticleFromDatabaseById(int id) throws SQLException, ClassNotFoundException {
        this.con = DatabaseConnection.initializeDatabase();
        this.stmt = con.createStatement();
        this.resultSet = stmt.executeQuery("SELECT * FROM articles WHERE id = " +id);
        return this.resultSet;
    }

    public void closeConnection() throws SQLException {
        this.con.close();
    }

    public void closeStatement() throws SQLException {
        this.stmt.close();
    }

    public void closeResultSet() throws SQLException {
        this.resultSet.close();
    }
}
