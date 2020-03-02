package blogs;

import static java.lang.System.out;
import servlets.DatabaseConnection;

import javax.swing.plaf.nimbus.State;
import javax.xml.crypto.Data;
import java.io.PrintWriter;
import java.sql.*;

public class Blog {
    private int id;
    private String title;
    private String nickname;
    private String text;
    private Connection con = null;
    private Statement stmt = null;
    private ResultSet resultSet = null;

    public Connection getCon() {
        return con;
    }

    public Statement getStmt() {
        return stmt;
    }

    public ResultSet getResultSet() {
        return resultSet;
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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void addBlogToDatabase() throws SQLException, ClassNotFoundException {

    }

    public ResultSet getBlogsFromDatabase() throws SQLException, ClassNotFoundException {
        this.con = DatabaseConnection.initializeDatabase();
        this.stmt = con.createStatement();
        this.resultSet = stmt.executeQuery("SELECT * FROM blogs");
        return this.resultSet;
    }

    public ResultSet getBlogById(int id) throws SQLException, ClassNotFoundException {
            this.con = DatabaseConnection.initializeDatabase();
            this.stmt = con.createStatement();
            this.resultSet = stmt.executeQuery("SELECT * FROM blogs WHERE id = " +id);
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