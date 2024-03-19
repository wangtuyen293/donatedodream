<%-- 
    Document   : project
    Created on : Feb 2, 2024, 11:06:30 PM
    Author     : OS
--%>

<%@page import="model.Comments"%>
<%@page import="dao.CommentDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.ProjectMilestoneGift"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.Feedback"%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.ProjectProcess"%>
<%@page import="model.Donation"%>
<%@page import="java.util.List"%>
<%@page import="dao.DonationDAO"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>My Projects</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./assets/css/flaticon.css">
        <link rel="stylesheet" href="./assets/css/slicknav.css">
        <link rel="stylesheet" href="./assets/css/animate.min.css">
        <link rel="stylesheet" href="./assets/css/magnific-popup.css">
        <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="./assets/css/themify-icons.css">
        <link rel="stylesheet" href="./assets/css/slick.css">
        <link rel="stylesheet" href="./assets/css/nice-select.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./style.css">
        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <style>
            /* Đặt độ rộng cho form và căn giữa trang */
            .custom-form {
                max-width: 50%;
                margin: auto;
                margin-top: 50px; /* Điều chỉnh khoảng cách từ trên xuống theo ý muốn */
            }
            .rating {
                display: inline-block;
                unicode-bidi: bidi-override;
                direction: rtl;
            }

            .rating input {
                display: none;
            }

            .rating label {
                float: right;
                color: #aaa;
                font-size: 1.5rem;
                padding: 0;
                cursor: pointer;
            }

            .rating label:before {
                content: '\2605';
                padding: 5px;
                font-size: 2rem;
            }

            .rating input:checked ~ label,
            .rating input:checked ~ label ~ label {
                color: #f8d61c;
            }

            .rating:not(:checked) > label:hover,
            .rating:not(:checked) > label:hover ~ label {
                color: #f8d61c;
            }

            .rating input:checked + label:hover,
            .rating input:checked + label:hover ~ label,
            .rating input:checked ~ label:hover ~ label,
            .rating input:checked ~ label:hover ~ label:hover {
                color: #f8d61c;
            }

            .rating label:hover:before,
            .rating label:hover ~ label:before,
            .rating input:checked:hover ~ label:before,
            .rating input:checked:hover ~ label ~ label:before,
            .rating input:checked ~ label:hover ~ label:before,
            .rating input:checked ~ label:hover ~ label:hover:before {
                content: '\2605';
                color: #f8d61c;
            }

            .rating input:checked + label:hover:before,
            .rating input:checked + label:hover ~ label:before,
            .rating input:checked ~ label:hover ~ label:before,
            .rating input:checked ~ label:hover ~ label:hover:before {
                content: '\2605';
                color: #f8d61c;
            }
        </style>
    </head>
    <body>
        <jsp:include page="layout/header.jsp" />
        <div class="container mt-4">
            <div class="row">
                <div class="col-lg-8">
                    <div class="card mb-4">

                        <div id="carouselExampleIndicators" class="carousel slide" style="max-width: 400px; margin: auto;">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                            </div>
                            <div class="carousel-inner" style="max-height: 600px; overflow: hidden;">
                                <div class="carousel-item active">
                                    <img src="${image.image1_path}" class="d-block w-100" alt="..." style="object-fit: contain; height: 100%;">
                                </div>
                                <div class="carousel-item">
                                    <img src="${image.image2_path}" class="d-block w-100" alt="..." style="object-fit: contain; height: 100%;">
                                </div>
                                <div class="carousel-item">
                                    <img src="${image.image3_path}" class="d-block w-100" alt="..." style="object-fit: contain; height: 100%;">
                                </div>
                                <div class="carousel-item">
                                    <img src="${image.image4_path}" class="d-block w-100" alt="..." style="object-fit: contain; height: 100%;">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="px-1 py-5">
                            <div id="exTab2" class="py-1 px-5 mx-5">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" href="#1" data-bs-toggle="tab">Thông tin</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#2" data-bs-toggle="tab">Nhận xét</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#3" data-bs-toggle="tab">Bình luận</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#4" data-bs-toggle="tab">Tiến độ</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#5" data-bs-toggle="tab">Lịch sử</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div class="tab-pane active" id="1">
                                        <div class="card-body tab-content">
                                            <!-- Project Details Tab -->
                                            <div class="tab-pane fade show active" id="project-details">
                                                <h1 class="card-title">${project.projectName}</h1>
                                                <p class="card-text">${project.projectDescription}</p>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item"><strong>Mục tiêu:</strong> ${project.projectTarget}</li>
                                                    <li class="list-group-item"><strong>Đã ủng hộ:</strong> ${project.donatedAmountOfMoney}</li>
                                                    <li class="list-group-item"><strong>Thời gian:</strong> ${project.startDate} đến ${project.endDate}</li>
                                                </ul>
                                                <div class="card-body">
                                                    <a href="donation?action=donation&id=${project.projectId}&milestoneId=14" class="btn btn-danger">Ủng hộ cho dự án</a>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="tab-pane" id="2">

                                        <h3>Các nhận xét của người ủng hộ</h3>
                                        <%
                                            try {
                                                int projectId = (int) request.getAttribute("projectId");
                                                FeedbackDAO feedbackDAO = new FeedbackDAO();
                                                List<Feedback> feedbackList = feedbackDAO.getAllFeedbackByProjectId(projectId);

                                                // Hiển thị danh sách phản hồi
                                                for (Feedback feedback : feedbackList) {
                                        %>
                                        <div class="card mb-3">
                                            <div class="card-body">
                                                <p class="card-text"><%= feedback.getRealTime()%></p>
                                                <p class="card-text">Đánh giá: <%= feedback.getStar()%> sao</p>
                                                <p class="card-text">Nhận xét: <%= feedback.getContent()%></p>

                                                <!-- Thêm nút sửa và nút xóa -->
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <a href="editfeedback?id=<%= feedback.getUserId()%>&fdid=<%= feedback.getFeedbackId()%>" class="btn btn-warning">Sửa</a>
                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal<%= feedback.getFeedbackId()%>">
                                                        Xoá
                                                    </button>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal<%= feedback.getFeedbackId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xoá feedback</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Bạn có muốn xoá không?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                    <a href="deletefeedback?id=<%= feedback.getFeedbackId()%>&projectId=<%= feedback.getProjectId()%>" class="btn btn-danger">Xoá</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                }
                                            } catch (SQLException | ClassNotFoundException ex) {
                                                Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
                                                out.println("Error occurred: " + ex.getMessage());
                                            }
                                        %>
                                        <%
                                            int projectId = (int) request.getAttribute("projectId");
                                            DonationDAO dao = new DonationDAO();
                                            List<Donation> donationList = dao.getDonationsByProjectId(projectId);

                                            pageContext.setAttribute("donationList", donationList);
                                        %>
                                        <c:if test="${sessionScope.user != null}">
                                            <c:set var="userId" value="${sessionScope.user.userId}" />
                                            <c:choose>
                                                <c:when test="${not empty donationList}">
                                                    <c:forEach var="donation" items="${donationList}">
                                                        <c:if test="${donation.userId == userId}">
                                                            <form action="feedback" method="post">
                                                                <div>
                                                                    <input type="hidden" id="projectId" name="projectId" value="${project.projectId}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="rating">Đánh giá:</label>
                                                                    <div class="rating">
                                                                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 stars"></label>
                                                                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 stars"></label>
                                                                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 stars"></label>
                                                                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 stars"></label>
                                                                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star"></label>
                                                                    </div>
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="comment">Nhận xét:</label>
                                                                    <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
                                                                </div>
                                                                <button type="submit" class="btn btn-primary">Submit</button>
                                                            </form>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <p>Chưa có feedback nào.</p>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>

                                    </div>

                                    <div class="tab-pane" id="3">

                                        <%
                                            CommentDAO cmtdao = new CommentDAO();
                                            try {
                                                List<Comments> comments = cmtdao.getProjectComments(projectId);
                                                for (Comments comment : comments) {
                                        %>
                                        <div class="col-md-4" style="width: 600px;">
                                            <div class="card" ">
                                                <div class="card-body">
                                                    <h5 class="card-title">User ID: <%= comment.getUserId()%></h5>
                                                    <p class="card-text" id="comment_<%= comment.getCommentId()%>"><%= comment.getContent()%></p>
                                                    <p class="card-text">Time: <%= comment.getRealTime()%></p>
                                                </div>
                                                <div class="btn-group" role="group" aria-label="Basic example" style="max-width: 150px">
                                                    <a href="editcomment?id=<%= comment.getUserId()%>&cmtid=<%= comment.getCommentId()%>" class="btn btn-light">Sửa</a>
                                                    <!-- Button trigger modal -->
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%= comment.getCommentId() %>">
                                                        Xoá
                                                    </button>

                                                    <!-- Modal -->
                                                    <div class="modal fade" id="exampleModal<%= comment.getCommentId()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xoá feedback</h1>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    Bạn có muốn xoá không?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                    <a href="deletecomment?id=<%= comment.getCommentId()%>&projectId=<%= comment.getProjectId()%>" class="btn btn-danger">Xoá</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%
                                                }
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                            } finally {
                                                // Close resources
                                            }
                                        %>

                                        <div class="container mt-5">
                                            <h2 class="mb-4">Bình luận</h2>
                                            <form action="comment" method="post">
                                                <div class="form-group">
                                                    <label for="content"></label>
                                                    <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                                                </div>
                                                <div>
                                                    <input type="hidden" id="projectId" name="projectId" value="${project.projectId}">
                                                </div>
                                                <button type="submit" class="btn btn-primary">Bình luận</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="4">
                                        <h1>Tiến độ dự án</h1>
                                        <%
                                            // Get project process object from session
                                            ProjectProcess projectProcess = (ProjectProcess) session.getAttribute("projectProcess");

                                            if (projectProcess != null) {
                                        %>
                                        <div>
                                            <h2>Updating</h2>
                                            <p><%= projectProcess.getProcessName()%></p>
                                            <p>Ngày diễn ra: <%= projectProcess.getUpdateDate()%></p>
                                            <p>Tổng vốn dự án: <%= projectProcess.getMoneyCost()%></p>
                                            <p> <%= projectProcess.getDescription()%></p>
                                            <h3>Hình ảnh mô tả</h3>
                                            <img src="<%= projectProcess.getImage1()%>" alt="Image 1">
                                            <img src="<%= projectProcess.getImage2()%>" alt="Image 2">
                                            <img src="<%= projectProcess.getImage3()%>" alt="Image 3">
                                            <img src="<%= projectProcess.getImage4()%>" alt="Image 4">
                                        </div>
                                        <% } else { %>
                                        <p>Dự án chưa được gọi vốn thành công hoặc đang trong quá trình thực hiện. Vui lòng quay lại sau.</p>
                                        <% } %>
                                    </div>

                                    <div class="tab-pane" id="5">
                                        <div class="card-body tab-content">

                                            <div class="form-group">
                                                <h3>Danh sách ủng hộ:</h3>
                                                <br>
                                                <div class="list-group"> <!-- Sử dụng list-group của Bootstrap -->
                                                    <% for (Donation donation : donationList) {
                                                            // Lấy userId từ đối tượng Donation
                                                            int userId = donation.getUserId();
                                                            // Sử dụng userId để lấy tên người dùng từ DAO
                                                            UserDAO udao = new UserDAO();
                                                            String userName = udao.getUserNameById(userId);
                                                    %>
                                                    <div class="list-group-item">
                                                        <!-- Thêm tên người dùng vào dòng cảm ơn -->
                                                        Cảm ơn <%= userName%> đã donate cho dự án <%= donation.getAmountOfMoney()%>
                                                    </div>
                                                    <% } %>
                                                </div>
                                            </div>
                                        </div>


                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="card-title">Các mốc quà</h2>
                            <%
                                List<ProjectMilestoneGift> milestones = (List<ProjectMilestoneGift>) session.getAttribute("milestone");
                                if (milestones != null && !milestones.isEmpty()) {
                                    for (ProjectMilestoneGift milestone : milestones) {
                            %>
                            <div class="mb-3">
                                <h3><%= milestone.getProjectMilestoneGiftName()%></h3>
                                <p><%= milestone.getDescription()%></p>
                                <div class="card-body">
                                    <a href="donation?action=donation&id=${project.projectId}&milestoneId=<%= milestone.getProjectMilestoneGiftId()%>" class="btn btn-danger">Donate to project</a>
                                </div>
                            </div>

                            <%
                                }
                            } else {
                            %>

                            <% }%>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="layout/footer.jsp" />
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy6WtgivbImlMwkQG71iZL7aF8gYJ5miB"

              crossorigin="anonymous">

        <!-- Bootstrap JS and Popper.js -->
        <script>
            $(document).ready(function () {
                $('.nav-tabs a:first').tab('show'); // Kích hoạt tab-pane đầu tiên khi trang được tải
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy6WtgivbImlMwkQG71iZL7aF8gYJ5miB"
        crossorigin="anonymous"></script>

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>

        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <script src="./assets/js/owl.carousel.min.js"></script>
        <script src="./assets/js/slick.min.js"></script>

        <script src="./assets/js/wow.min.js"></script>
        <script src="./assets/js/animated.headline.js"></script>
        <script src="./assets/js/jquery.magnific-popup.js"></script>

        <script src="./assets/js/jquery.scrollUp.min.js"></script>
        <script src="./assets/js/jquery.nice-select.min.js"></script>
        <script src="./assets/js/jquery.sticky.js"></script>

        <script src="./assets/js/contact.js"></script>
        <script src="./assets/js/jquery.form.js"></script>
        <script src="./assets/js/jquery.validate.min.js"></script>
        <script src="./assets/js/mail-script.js"></script>
        <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

        <script src="./assets/js/plugins.js"></script>
        <script src="./assets/js/main.js"></script>
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
            window.dataLayer = window.dataLayer || [];

            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-23581568-13');
        </script>
        <script defer
                src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
                data-cf-beacon='{"rayId":"84651653f9703e54","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
    </body>
</html>
