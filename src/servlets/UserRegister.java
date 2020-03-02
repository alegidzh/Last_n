package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/userregistration")
@MultipartConfig
public class UserRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("insert into users (" +
                    "nickname, password, name, country," +
                    " gender, website, aboutme, birth_day, birth_month, birth_year) values(?,?,?,?,?,?,?,?,?,?)");
            st.setString(1, request.getParameter("nickname"));
            st.setString(2, request.getParameter("password"));
            st.setString(3, request.getParameter("name"));
            st.setString(4, request.getParameter("country"));
            st.setString(5, request.getParameter("gender"));
            st.setString(6, request.getParameter("website"));
            st.setString(7, request.getParameter("about_me"));
            st.setString(8, request.getParameter("birth_day"));
            st.setString(9, request.getParameter("birth_month"));
            st.setString(10, request.getParameter("birth_year"));
            st.executeUpdate();
            st.close();
            con.close();

            PrintWriter out = response.getWriter();
            Part filePart = request.getPart("photo");
            InputStream fileContent = filePart.getInputStream();
            String filename = getFilename(filePart);
            File fileToSave = new File("C:/Users/olegi/IdeaProjects/Last_n/web/images/"+filename);
            Files.copy(fileContent,fileToSave.toPath(), StandardCopyOption.REPLACE_EXISTING);
            String fileURL = "http://localhost:8080/images/" +filename;

            out.println("File " +filename +" INSERTED!");
            out.println(fileURL);

        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private static String getFilename(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
}
