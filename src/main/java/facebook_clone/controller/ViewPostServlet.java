package facebook_clone.controller;

import facebook_clone.dao.PostDao;
import facebook_clone.models.Posts;
import facebook_clone.util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ViewPostServlet", value = "/ViewPostServlet")
public class ViewPostServlet extends HttpServlet {
    HttpSession session;
    PostDao postDao;
    RequestDispatcher dispatcher;

    public void init() {
        try {
            postDao = new PostDao(DatabaseConnection.getConnection());
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Posts> posts = null;
        try {
            posts = postDao.getAllPosts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("posts", posts);
        request.getRequestDispatcher("viewPost.jsp").forward(request, response);
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
