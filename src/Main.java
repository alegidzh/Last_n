import news.Comments;
import users.User;

import java.util.Date;
import java.sql.Timestamp;

public class Main {
    public static void main(String[] args) {
        Timestamp tmstmp = new Timestamp(System.currentTimeMillis());
        System.out.println(tmstmp);
        User alegik = new User();
        alegik.addUserToDatabase();
    }
}
