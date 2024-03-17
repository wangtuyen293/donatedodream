<%-- 
    Document   : changepassword
    Created on : Feb 2, 2024, 9:53:05 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Change Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<link rel="manifest" href="site.webmanifest">-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="./assets/css/flaticon.css">
        <link rel="stylesheet" href="./assets/css/slicknav.css">
        <link rel="stylesheet" href="./assets/css/animate.min.css">
        <link rel="stylesheet" href="./assets/css/magnific-popup.css">
        <!--<link rel="stylesheet" href="assets/css/fontawesome.min.css">-->
        <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="./assets/css/themify-icons.css">
        <link rel="stylesheet" href="./assets/css/slick.css">
        <link rel="stylesheet" href="./assets/css/nice-select.css">
        <link rel="stylesheet" href="./assets/css/style.css">
        <!--<link rel="stylesheet" href="./assets/css/style.min.css">-->
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
        </style>
    </head>
    <body>
        <jsp:include page="layout/header.jsp" />
        <div class="profile container-fluid bg-secondary-subtle show active">
            <div class="row">
                <div class="col-3 bg-primary mx-2 rounded" style="height: 36rem;">
                    <div class="py-5 d-flex justify-content-center align-items-center">
                        <div class="border border-5 rounded-circle overflow-hidden" style="width: 10rem; height: 10rem;">
                            <c:if test="${not empty user.avatar}">
                                <c:set var="contextPath" value="${pageContext.request.contextPath}" />
                                <c:set var="fullAvatarPath" value="${contextPath}/${user.avatar}" />
                                <img src="${fullAvatarPath}" class="img-fluid rounded-circle" alt="Avatar" style="max-width: 100%; height: auto;">
                            </c:if>
                        </div>
                    </div>

                    <h3 class="text-center text-light text-capitalize">${sessionScope.user.fullName}</h3>
                    <p class="text-center text-light">${sessionScope.user.email}</p>
                    <ul class="m-0 p-0">
                        <li class="py-2 bg-white active">
                            <a class="ps-3 text-decoration-none link-primary" href="profile">
                                <i class="fa fa-user"></i> 
                                <span class="ps-2">My Profile</span>
                            </a>
                        </li>
                        <li class="py-2 bg-white">
                            <a class="ps-3 text-decoration-none link-primary" href="project.jsp">
                                <i class="fa-solid fa-list"></i>
                                <span class="ps-2">My Projects</span>
                            </a>
                        </li>
                        <li class="py-2 bg-white">
                            <a class="ps-3 text-decoration-none link-primary" href="checkpassword.jsp">
                                <i class="fa-solid fa-calendar-days"></i>
                                <span class="ps-2">Change Password</span>
                            </a>
                        </li>
                        <li class="py-2 bg-white">
                            <a class="ps-3 text-decoration-none link-primary" href="editprofile.jsp"> 
                                <i class="fa fa-edit"></i> 
                                <span class="ps-2">Edit profile</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="col-8 mx-2 py-3 bg-white rounded">
                    <nav class="ms-3" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Profile</li>
                        </ol>
                    </nav>
                    <div class="container mt-5">
                        <div class="card mx-auto" style="max-width: 400px;">
                            <div class="card-header bg-primary text-white">
                                <h1 class="h3 mb-0" style="text-align: center">Your Profile</h1>
                            </div>
                            <div class="card-body">
                                <c:if test="${not empty sessionScope.user}">
                                    <c:set var="user" value="${sessionScope.user}" />

                                    <form action="editprofile" method="post" enctype="multipart/form-data">
                                        <div class="form-group">
                                            <label for="avatar">Avatar:</label>
                                            <input type="file" class="form-control-file" id="avatar" name="avatar" size="100" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="fullName">Full Name:</label>
                                            <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="phoneNumber">Phone Number:</label>
                                            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="${user.phoneNumber}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="gender">Gender:</label>
                                            <select class="form-control" id="gender" name="gender" required>
                                                <option value="0" ${user.gender eq 0 ? 'selected' : ''}>Male</option>
                                                <option value="1" ${user.gender eq 1 ? 'selected' : ''}>Female</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="dateOfBirth">Date of Birth:</label>
                                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="<fmt:formatDate value='${user.dateOfBirth}' pattern='yyyy-MM-dd' />" required>
                                        </div>

                                        <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="layout/footer.jsp" />
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
