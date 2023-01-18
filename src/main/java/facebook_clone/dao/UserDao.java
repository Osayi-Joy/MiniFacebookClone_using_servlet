package facebook_clone.dao;

import facebook_clone.models.User;
import lombok.NoArgsConstructor;

import java.sql.*;

@NoArgsConstructor
public class UserDao {
    private String Query;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public UserDao(Connection connection) {
        this.connection = connection;
    }

    public boolean userRegistration(User user) {
        try {
            Query = "INSERT INTO user(username, email, password, birthdate, gender, address, phone) VALUES(?,?,?,?,?,?,?)";
            preparedStatement = this.connection.prepareStatement(Query);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setDate(4, user.getBirthDate());
            preparedStatement.setString(5, user.getGender());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.setString(7, user.getPhoneNo());
            int res = preparedStatement.executeUpdate();
            if (res > 0) return true;
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    public boolean checkEmailExists(String email) {
        try {
            String query = "SELECT email FROM user WHERE email = ?";
            preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    public User userLogin(String email, String password) throws RuntimeException {
        User user = null;
        try {
            preparedStatement = this.connection.prepareStatement("SELECT * FROM user WHERE email = ? and password = ?");

            //get current user password from database
            // decrypt the password back to normal password
            //compare the decypted password with the password of the current user logging in
            //if they match go to line 38

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                user = new User();
                user.setUserName(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setUser_id(resultSet.getString("user_id"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }
}
