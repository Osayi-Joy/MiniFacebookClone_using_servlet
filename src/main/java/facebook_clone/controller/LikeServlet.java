package facebook_clone.controller;

import facebook_clone.dao.PostDao;
import facebook_clone.models.Posts;
import facebook_clone.util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LikeServlet", value = "/LikeServlet")
public class LikeServlet extends HttpServlet {
    PostDao postDao;
    @Override
    public void init() throws ServletException {
        try {
            postDao = new PostDao(DatabaseConnection.getConnection());
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user_id = request.getParameter("user_id");
        String post_id = request.getParameter("post_id");

        Posts post = new Posts();
        post.setUser_id(user_id);
        post.setPost_id(post_id);

        boolean success = postDao.insertLike(post);
        if (success) {
            request.setAttribute("message", "Like added successfully");
            request.getRequestDispatcher("/like-success.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "An error occurred while adding the like");
            request.getRequestDispatcher("/like-error.jsp").forward(request, response);
        }
    }
}


