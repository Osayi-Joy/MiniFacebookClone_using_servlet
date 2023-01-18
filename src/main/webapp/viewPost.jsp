<%@ page import="facebook_clone.models.Posts" %>
<%@ page import="java.util.List" %>
<%@ page import="facebook_clone.models.Posts" %>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Social-Lite Home Page</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
            crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
          rel="stylesheet" type="text/css"/>
    <link href="viewPost.css" rel="stylesheet" type="text/css"/>
    <link
            href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
            rel="stylesheet" type="text/css"/>
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/index-styles.css" rel="stylesheet"/>
</head>
<body >


<!-- Navigation-->
<nav
        class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
        id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="#page-top">Social-Lite</a>
        <button
                class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
                type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            Menu <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded" href="ViewPostServlet">View Posts</a></li>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded" href="createPost.jsp">New Post</a></li>
                <li class="nav-item mx-0 mx-lg-1">
                    <a class="nav-link py-3 px-0 px-lg-3 rounded" href="LogoutServlet">Logout</a></li>
                <li class="nav-item mx-0 mx-lg-1 bg-danger"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded"
                        href="LogoutServlet"><%=session.getAttribute("name")%>
                </a></li>

            </ul>
        </div>
    </div>
</nav>


<section class="page-section" id="viewPost">
    <div class="container">
        <!-- Posts Section Heading-->
<%--        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">View Post </h2>--%>
        <form  action="ViewPostServlet" method="get" id="myForm">
            <input type="submit" value="View Posts">

        <div>
            <%
                List<Posts> posts = (List<Posts>) request.getAttribute("posts");
                if (posts != null && !posts.isEmpty()) {
                    for (Posts post : posts) {
            %>
            <div class="form-floating mb-3">
                <div>
                    <h6>SUBJECT: <%= post.getTextPost() %></h6>
                </div>
                <div class="post-meta">
                    <div class="post-user-id">
                        <h6>USER_ID: <%= post.getUser_id() %> </h6>
                    </div>
                    <div class="post-title">
                        <h5> <%= post.getPost_title() %> </h5>
                    </div>
                    <div class="post-date">
                        <%= post.getDateOfPost() %>
                    </div>

<%--                    <div class="like-count">Likes: <%= PostDao.getLikeCount(post.getPost_id()) %></div>--%>

                </div>
                <form action="like-post" method="post" class="like-form">
                    <input type="hidden" name="post_id" value="<%= post.getPost_id() %>">
                    <input type="submit" value="Like">
                </form>
                <form action="comment-post" method="post" class="comment-form">
                    <input type="hidden" name="post_id" value="<%= post.getPost_id() %>">
                    <input type="text" name="comment_text" placeholder="Add a comment">
                    <input type="submit" value="Comment">
                </form>

            </div>
            <%
                }
            } else {
            %>
            <div>No posts found</div>
            <%
                }
            %>

        </div>
        </form>
    </div>
</section>




<!-- Footer-->
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <!-- Footer Location-->
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Location</h4>
                <p class="lead mb-0">
                    7 Asajon way Sangotendo Lagos, Nigeria <br/>
                </p>
            </div>
            <!-- Footer Social Icons-->
            <div class="col-lg-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Around the Web</h4>
                <a class="btn btn-outline-light btn-social mx-1" href="#!"><i
                        class="fab fa-fw fa-facebook-f"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-twitter"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-linkedin-in"></i></a> <a
                    class="btn btn-outline-light btn-social mx-1" href="#!"><i
                    class="fab fa-fw fa-dribbble"></i></a>
            </div>
            <!-- Footer About Text-->
            <div class="col-lg-4">
                <h4 class="text-uppercase mb-4">About Social-Lite</h4>
                <p class="lead mb-0">
                    Social-Lite is facebook mini clone designed by J Concept
                </p>
            </div>
        </div>
    </div>
</footer>


<!-- Copyright Section-->
<div class="copyright py-4 text-center text-white">
    <div class="container">
        <small>Copyright &copy; J Concept 2023</small>
    </div>
</div>


<!-- Bootstrap core JS-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">


<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
