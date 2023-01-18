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
<body id="page-top">

<input type="hidden" id="postStatus" value="<%= session.getAttribute("Auth") %>">
<input type="hidden" id="postTitle" value="<%= request.getAttribute("postTitle") %>">
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
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="viewPost.jsp">View Posts</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="createPost.jsp">New Post</a></li>
                <li class="nav-item mx-0 mx-lg-1"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded" href="LogoutServlet">Logout</a></li>
                <li class="nav-item mx-0 mx-lg-1 bg-danger"><a
                        class="nav-link py-3 px-0 px-lg-3 rounded"
                        href="LogoutServlet"><%=session.getAttribute("name")%>
                </a></li>

            </ul>
        </div>
    </div>
</nav>


<!-- Masthead-->
<header class="masthead bg-primary text-white text-center">
    <div class="container d-flex align-items-center flex-column">
        <!-- Masthead Avatar Image-->
        <img class="masthead-avatar mb-5" src="assets/img/avataaars.svg"
             alt="..."/>
        <!-- Masthead Heading-->
        <h1 class="masthead-heading text-uppercase mb-0">Welcome To Social-lite</h1>
        <!-- Icon Divider-->
        <div class="divider-custom divider-light">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Masthead Subheading-->
        <p class="masthead-subheading font-weight-light mb-0">Connect with Friends - Make Your Posts - Get Reactions and
            Comments from Friends</p>
    </div>
</header>


<!-- Posts Section-->
<%--<section class="page-section" id="makePost">--%>
<%--    <div class="container">--%>
<%--        <!-- Posts Section Heading-->--%>
<%--        <h2--%>
<%--                class="page-section-heading text-center text-uppercase text-secondary mb-0">Make a new Post </h2>--%>
<%--        <!-- Icon Divider-->--%>
<%--        <div class="divider-custom">--%>
<%--            <div class="divider-custom-line"></div>--%>
<%--            <div class="divider-custom-icon">--%>
<%--                <i class="fas fa-star"></i>--%>
<%--            </div>--%>
<%--            <div class="divider-custom-line"></div>--%>
<%--        </div>--%>
<%--        <!-- Posts Section Form-->--%>
<%--        <div class="row justify-content-center">--%>
<%--            <div class="col-lg-8 col-xl-7">--%>


<%--                <form id="contactForm" method="post" action="PostServlet">--%>

<%--                    <!-- Title of ur posts-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="id" name="user_id" type="number"--%>
<%--                               placeholder="Enter your user id"--%>
<%--                               data-sb-validations="required,email"/>--%>
<%--                        <label for="id">User_id: </label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="email:required">--%>
<%--                            An ID is required.--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-floating mb-3">--%>
<%--                        <input class="form-control" id="title" name="post_title" type="text"--%>
<%--                               placeholder="Title of your post"--%>
<%--                               data-sb-validations="required,email"/>--%>
<%--                        <label for="title">SUBJECT: </label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="email:required">--%>
<%--                            A title is required.--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <!-- Message input-->--%>
<%--                    <div class="form-floating mb-3">--%>
<%--							<textarea class="form-control" id="textPost" name="textPost" type="text"--%>
<%--                                      placeholder="Enter your message here..." style="height: 10rem"--%>
<%--                                      data-sb-validations="required"></textarea>--%>
<%--                        <label for="textPost">Message</label>--%>
<%--                        <div class="invalid-feedback" data-sb-feedback="message:required">A--%>
<%--                            message is required.--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group form-button">--%>
<%--                        <input type="submit" name="signin" value="POST" class="form-submit" id="submitButton"/>--%>
<%--                    </div>--%>

<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>



<%--<section class="page-section" id="viewPost">--%>
<%--    <div class="container">--%>
<%--        <!-- Posts Section Heading-->--%>
<%--        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">View Post </h2>--%>
<%--        <form action="ViewPostServlet" method="get">--%>
<%--            <input type="submit" value="View Posts">--%>
<%--        </form>--%>
<%--        <div>--%>
<%--            <%--%>
<%--                List<Posts> posts = (List<Posts>) request.getAttribute("posts");--%>
<%--                if (posts != null && !posts.isEmpty()) {--%>
<%--                    for (Posts post : posts) {--%>
<%--            %>--%>
<%--            <div class="form-floating mb-3">--%>
<%--                <div>--%>
<%--                    <h6>SUBJECT: <%= post.getTextPost() %></h6>--%>
<%--                </div>--%>
<%--                <div class="post-meta">--%>
<%--                    <div class="post-user-id">--%>
<%--                        <h6>USER_ID: <%= post.getUser_id() %> </h6>--%>
<%--                    </div>--%>
<%--                    <div class="post-title">--%>
<%--                        <h5> <%= post.getPost_title() %> </h5>--%>
<%--                    </div>--%>
<%--                    <div class="post-date">--%>
<%--                        <%= post.getDateOfPost() %>--%>
<%--                    </div>--%>


<%--&lt;%&ndash;                    <div class="like-count">Likes: <%= PostDao.getLikeCount(post.getPost_id()) %></div>&ndash;%&gt;--%>



<%--                </div>--%>

<%--                <form action="like-post" method="post" class="like-form">--%>
<%--                    <input type="hidden" name="post_id" value="<%= post.getPost_id() %>">--%>
<%--                    <input type="submit" value="Like">--%>
<%--                </form>--%>
<%--                <form action="comment-post" method="post" class="comment-form">--%>
<%--                    <input type="hidden" name="post_id" value="<%= post.getPost_id() %>">--%>
<%--                    <input type="text" name="comment_text" placeholder="Add a comment">--%>
<%--                    <input type="submit" value="Comment">--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <%--%>
<%--                }--%>
<%--            } else {--%>
<%--            %>--%>
<%--            <div>No posts found</div>--%>
<%--            <%--%>
<%--                }--%>
<%--            %>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>




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

<script type="text/javascript">
    var status = document.getElementById("Auth").value;
    if (status == true) {
        swal("Congrats", " Invalid username or password", "success");
    }
</script>


<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
