package facebook_clone.controller;

import facebook_clone.dao.UserDao;
import facebook_clone.models.User;
import facebook_clone.util.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    RequestDispatcher dispatcher = null;

    User user;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String birth_date = request.getParameter("birthDate");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String phone = request.getParameter("contact");
        //String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        user = new User(username,email, password, Date.valueOf(birth_date), gender, address, phone);
        if (username == null || username.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || birth_date == null || birth_date.trim().isEmpty()
                || gender == null || gender.trim().isEmpty()
                || address == null || address.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()) {
            request.setAttribute("error", "Please fill in all the fields");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
        } else {

            // Hash the password
            //String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            try {

                UserDao userDao = new UserDao(new DatabaseConnection().getConnection());
                boolean status =  userDao.userRegistration(user);
                dispatcher = request.getRequestDispatcher("registration.jsp");
                HttpSession session = request.getSession();

                if(status) {
                    session.setAttribute("register", "success");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                } else {
                    request.setAttribute("register", "failed");
                    dispatcher = request.getRequestDispatcher("registration.jsp");
                }
                dispatcher.forward(request, response);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

    }
}


