package news;

import servlets.DatabaseConnection;

import java.sql.*;

public class Comments {
    private int id;
    private int article_id;
    private Connection con;
    private Statement stmt;
    private ResultSet resultSet;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    private String nickname;
    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public void addCommentToDatabase(int articleId, String nickname, String text){
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement stmt = con.prepareStatement(
                    "insert into comments (article_id, nickname, text) values (?,?,?)");
            stmt.setInt(1,articleId);
            stmt.setString(2,nickname);
            stmt.setString(3,text);
            stmt.execute();
            stmt.close();
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public ResultSet getCommentsByArticleId(int articleId) throws SQLException, ClassNotFoundException {
            this.con = DatabaseConnection.initializeDatabase();
            this.stmt = con.createStatement();
            this.resultSet = stmt.executeQuery("SELECT * FROM comments WHERE article_id = '" +articleId +"'");
        return this.resultSet;
    }

    public ResultSet getCommentsCount(int articleId) throws SQLException, ClassNotFoundException {
        this.con = DatabaseConnection.initializeDatabase();
        this.stmt = con.createStatement();
        this.resultSet = stmt.executeQuery("SELECT COUNT(comments.id) AS 'comments_count' FROM comments WHERE article_id = " +articleId);
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
