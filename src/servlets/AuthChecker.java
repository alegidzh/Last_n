package servlets;

import users.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/authchecker")
public class AuthChecker extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("login");
        String userpass = request.getParameter("password");
        out.println("Your entered username is: " +username +" , and your entered pass is: " +userpass);
        User user = new User();
        try {
            ResultSet resultSetUser = user.getUserPassByUsernameFromDB(username);
            while (resultSetUser.next()){
                user.setNickname(resultSetUser.getString("nickname"));
                user.setPassword(resultSetUser.getString("password"));
                out.println("password from login form: " +userpass);
                out.println("<br>");
                out.println("pass from database: " +user.getPassword());
                if (userpass.equals(user.getPassword())) {
                    out.println("Success ");
                    HttpSession session = request.getSession();
                    session.setAttribute("nickname", user.getNickname());
                }
                else {out.println("Access denied");}
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
