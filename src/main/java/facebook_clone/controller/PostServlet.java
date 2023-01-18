package facebook_clone.controller;

import facebook_clone.dao.PostDao;
import facebook_clone.models.Posts;
import facebook_clone.util.DatabaseConnection;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "PostServlet", value = "/PostServlet")
public class PostServlet extends HttpServlet {
    Posts posts;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dispatcher = null;
        String user_id = request.getParameter("user_id");
        String post_title = request.getParameter("post_title");
        String textPost = request.getParameter("textPost");
        HttpSession session = request.getSession();


        posts = new Posts(user_id, post_title, textPost);
            try {
            PostDao postDao = new PostDao(DatabaseConnection.getConnection());
                boolean Auth = postDao.makePost(posts);
                if (Auth) {
                session.setAttribute("Auth", "success");
                request.setAttribute("postTitle", posts.getPost_title());
                    System.out.println(Auth);
                    dispatcher = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("Auth", "failed");
                    dispatcher = request.getRequestDispatcher("index.jsp");
                }
                dispatcher.forward(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }

    }


    }

