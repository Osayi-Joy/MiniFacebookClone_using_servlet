package facebook_clone.dao;

import facebook_clone.models.Posts;
import facebook_clone.services.Comment;
import facebook_clone.services.Like;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao implements Like, Comment {
    private String Query;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    Posts posts;


    public PostDao(Connection connection){
        this.connection = connection;
    }

    public boolean makePost(Posts posts) {
        try {
            preparedStatement= this.connection.prepareStatement("INSERT INTO post(user_id, textPost, post_title) VALUES(?,?,?)");
            preparedStatement.setString(1, posts.getUser_id());
            preparedStatement.setString(2, posts.getTextPost());
            preparedStatement.setString(3, posts.getPost_title());

            int res = preparedStatement.executeUpdate();
            if (res > 0) return true;
        }catch (SQLException e) {
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

    public List<Posts> getAllPosts() throws SQLException {
        List<Posts> posts = new ArrayList<>();
        try (PreparedStatement statement = this.connection.prepareStatement("SELECT * FROM post")) {
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                this.posts = new Posts();
                this.posts.setUser_id(resultSet.getString("user_id"));
                this.posts.setPost_title(resultSet.getString("post_title"));
                this.posts.setTextPost(resultSet.getString("textPost"));
                this.posts.setPost_id(resultSet.getString("post_id"));
                this.posts.setDateOfPost(resultSet.getDate("date_time_posted"));
                posts.add(this.posts);
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return posts;
    }

        public boolean insertLike(Posts posts) {
            boolean success = false;
            try (PreparedStatement statement = connection.prepareStatement("INSERT INTO likes (user_id, post_id) VALUES (?, ?, ?)")) {
                statement.setString(1, posts.getUser_id());
                statement.setString(2, posts.getPost_id());

                int result = statement.executeUpdate();
                if (result > 0) {
                    success = true;
                }
            }catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            return success;
        }







    public int getLikeCount(String postId) throws SQLException {
        int likeCount = 0;
        try (PreparedStatement statement = connection.prepareStatement("SELECT COUNT(*) FROM likes WHERE post_id = ?")) {
            statement.setString(1, postId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                likeCount = resultSet.getInt(1);
            }
        }
        return likeCount;
    }



}




