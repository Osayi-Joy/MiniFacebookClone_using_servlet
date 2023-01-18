package facebook_clone.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static Connection connection;
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
            if (connection == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/facebook_clone?allowPublicKeyRetrieval=true&useSSL=false", "root", "J@Concept1234");
                System.out.print("connected");
            }
        return connection;
    }
}
