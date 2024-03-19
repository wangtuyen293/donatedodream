<%-- 
    Document   : profile
    Created on : Feb 2, 2024, 8:01:22 PM
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
        <title>Profile</title>
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
        <style>
            .sidebar-profile {
                background-color: #124076;
            }

            .sidebar-profile li {
                background-color: #fff;
                cursor: pointer;
            }

            .sidebar-profile li a i, .sidebar-profile li a span {
                color: #000;
            }

            .sidebar-profile li:hover, .sidebar-profile li.active {
                background-color: #59D5E0;
            }

            .sidebar-profile li:hover a i, .sidebar-profile li:hover a span {
                color: #fff;
            }

            .breadcrumb {
                background-color: transparent;
                margin-bottom: 1rem;
            }

            .breadcrumb-item a {
                color: #007bff;
                text-decoration: none;
            }

            .breadcrumb-item.active {
                color: #343a40;
            }

            .breadcrumb-item.active:hover {
                text-decoration: underline;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./layout/header.jsp" />
        <c:if test="${!sessionScope.warning.equalsIgnoreCase('') && sessionScope.warning != null}">
            <p class="text-bg-warning m-0 p-2">
                ${sessionScope.warning}
            </p>
        </c:if>
        <div class="profile container-fluid bg-secondary-subtle show active" >
            <%
                String alertMessage = (String) request.getAttribute("alertMessage");
                if (alertMessage != null) {
            %>
            <!-- Hiển thị thông báo lỗi sử dụng Bootstrap Alert -->
            <div class="alert alert-danger" role="alert">
                <%= alertMessage%>
            </div>
            <%
                }
            %>
            <div class="row" >
                <div class="sidebar-profile col-3 pt-3 pb-5">
                    <div class="py-5 d-flex justify-content-center align-items-center">
                        <img class="rounded-circle" src="${sessionScope.user.avatar}" height="150" width="150">
                    </div>
                    <h3 class="text-center text-light text-capitalize">${sessionScope.user.fullName}</h3>
                    <p class="text-center text-light">
                        <span>${sessionScope.user.email}</span>
                    </p>
                    <ul class="m-0 p-0">
                        <li class="sidebar-myprofile py-2 active" onclick="handleUserInfor('myprofile')">
                            <a class="ps-3 text-decoration-none" href="#">
                                <i class="fa fa-user"></i> 
                                <span class="ps-2">My Profile</span>
                            </a>
                        </li>
                        <li class="sidebar-myproject py-2" onclick="handleUserInfor('myproject')">
                            <a class="ps-3 text-decoration-none" href="#">
                                <i class="fa-solid fa-list"></i>
                                <span class="ps-2">My Projects</span>
                            </a>
                        </li>
                        <li class="sidebar-editprofile py-2" onclick="handleUserInfor('editprofile')">
                            <a class="ps-3 text-decoration-none" href="#"> 
                                <i class="fa fa-edit"></i> 
                                <span class="ps-2">Edit Profile</span>
                            </a>
                        </li>
                        <li class="sidebar-changepass py-2" onclick="handleUserInfor('changepass')">
                            <a class="ps-3 text-decoration-none" href="#">
                                <i class="fa-solid fa-calendar-days"></i>
                                <span class="ps-2">Change Password</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="my-profile col-9 bg-white pt-3 pb-5">
                    <nav class="ms-3" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">My Profile</li>
                        </ol>
                    </nav>

                    <h3 class="ms-3 my-3 text-capitalize fw-bold">My Profile</h3>
                    <div class="ms-2 my-4 row">
                        <div class="col-12 col-lg-6">
                            <p>Full Name: ${sessionScope.user.fullName}</p>
                        </div>
                        <div class="col-12 col-lg-6">
                            <p>Username: ${sessionScope.user.userName}</p>
                        </div>
                        <div class="col-12 col-lg-6">
                            <p>Email: ${sessionScope.user.email}</p>
                        </div>
                        <div class="col-12 col-lg-6">
                            <p>Gender: 
                                <c:if test="${empty sessionScope.user.gender}">
                                </c:if>
                                <c:if test="${sessionScope.user.gender eq 1}">
                                    Female
                                </c:if>
                                <c:if test="${sessionScope.user.gender eq 0}">
                                    Male
                                </c:if>
                            </p>
                        </div>
                        <div class="col-12 col-lg-6">
                            <p>Phone: ${sessionScope.user.phoneNumber}</p>
                        </div>
                        <div class="col-12 col-lg-6">
                            <p>Birthday: ${sessionScope.user.dateOfBirth}</p>
                        </div>
                    </div>
                </div>

                <div class="my-project col-9 bg-white pt-3 pb-5 d-none">
                    <nav class="ms-3" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">My Projects</li>
                        </ol>
                    </nav>

                    <h3 class="ms-3 my-3 text-capitalize fw-bold">My Projects</h3>
                    <div class="ms-2 my-4">
                        <c:if test="${projectList != null && !projectList.isEmpty()}">
                            <div id="userProjectCarousel" class="carousel carousel-dark slide">
                                <div class="carousel-inner">
                                    <c:forEach items="${projectList}" var="project" varStatus="status">
                                        <c:if test="${status.index % 2 == 0}">
                                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                                <div class="row d-flex justify-content-evenly mx-5">
                                                </c:if>
                                                <div class="card col-6 m-0 p-0 mx-3 my-5" style="width: 18rem;">
                                                    <img src="${project.prj.image1_path}" class="card-img-top" alt="project">
                                                    <div class="card-body">
                                                        <h5 class="card-title mt-2">
                                                            <a href="projectdetail?action=projectdetail&id=${project.projectId}" class="text-decoration-none link-dark">${project.projectName}</a>
                                                        </h5>
                                                        <div class="goal-target d-flex justify-content-between">
                                                            <span class="card-text text-dark m-0">${project.projectTarget}</span>
                                                            <span class="card-text text-dark m-0">${project.donatedAmountOfMoney}</span>
                                                        </div>
                                                        <div class="d-flex justify-content-between">
                                                            <span class="card-text text-dark m-0">Goal</span>
                                                            <span class="card-text text-dark m-0">Supported</span>
                                                        </div>
                                                        <div class="progress my-3" role="progressbar" aria-label="progressLabel"
                                                             aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                                            <div class="progress-bar bg-danger"
                                                                 style="width: ${project.donatedAmountOfMoney * 100 / project.projectTarget}%">
                                                                ${project.donatedAmountOfMoney * 100 / project.projectTarget}%
                                                            </div>
                                                        </div>
                                                        <div class="card-title mt-2" role="group" aria-label="Basic example">   
                                                            <a href="updateprojectprocess?id=${project.projectId}&donationPercentage=${project.donatedAmountOfMoney * 100 / project.projectTarget}" class="btn btn-danger"">Update Process</a>
                                                        </div>
                                                        <div class="card-title mt-2" role="group" aria-label="Basic example">   
                                                            <a href="viewdonatorwant?id=${project.projectId}" class="btn btn-dark"">View donation types</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <c:if test="${status.index % 2 == 1 || status.last}">
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#userProjectCarousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#userProjectCarousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </c:if>
                    </div>

                </div>

                <div class="edit-profile container col-9 bg-white pt-3 pb-5 d-none">
                    <nav class="ms-3" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Edit Profile</li>
                        </ol>
                    </nav>

                    <h3 class="ms-3 my-3 text-capitalize fw-bold">Edit Profile</h3>

                    <form action="profile?action=updateprofile" method="post" enctype="multipart/form-data">
                        <div class="mx-3 mb-3">
                            <label for="avatar">Avatar:</label>
                            <input type="file" class="form-control-file" id="avatar" name="avatar" size="100" required>
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" value="${sessionScope.user.fullName}">
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" value="${sessionScope.user.userName}" readonly>
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" readonly/>
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${sessionScope.user.phoneNumber}"/>
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-control" id="gender" name="gender">
                                <option value="1" ${sessionScope.user.gender == 1 ? 'selected' : ''}>Male</option>
                                <option value="0" ${sessionScope.user.gender == 0 ? 'selected' : ''}>Female</option>
                                <option ${(sessionScope.user.gender != 0 && sessionScope.user.gender != 1) ? 'selected' : ''}>Choose a gender</option>
                            </select>
                        </div>
                        <div class="mx-3 mt-5 mb-3">
                            <label for="dateOfBirth" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${sessionScope.user.dateOfBirth}"/>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>

                <div class="change-password col-9 bg-white pt-3 pb-5 d-none">
                    
                    <nav class="ms-3" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Change Password</li>
                        </ol>
                    </nav>

                    <h3 class="ms-3 my-3 text-capitalize fw-bold">Change Password</h3>

                    <form action="profile?action=changepass" method="post">
                        <div class="mx-3 mb-3">
                            <label for="oldpass" class="form-label">Old Password</label>
                            <input type="password" class="form-control" id="oldpass" name="oldpass">
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="newpass" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="newpass" name="newpass">
                        </div>
                        <div class="mx-3 mb-3">
                            <label for="confirmpass" class="form-label">Confirm New Password</label>
                            <input type="password" class="form-control" id="confirmpass" name="confirmpass">
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="./layout/footer.jsp" />
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
        <script>
            const sideBars = document.querySelectorAll('.sidebar-profile li');
            const sidebarProfile = document.querySelector('.sidebar-myprofile');
            const sidebarProject = document.querySelector('.sidebar-myproject');
            const sidebarEditProfile = document.querySelector('.sidebar-editprofile');
            const sidebarChangePass = document.querySelector('.sidebar-changepass');
            const profile = document.querySelector('.my-profile');
            const project = document.querySelector('.my-project');
            const editProfile = document.querySelector('.edit-profile');
            const changePass = document.querySelector('.change-password');

            function handleUserInfor(check) {
                sideBars.forEach((sidebarItem) => {
                    sidebarItem.classList.remove('active');
                });

                if (check === "myprofile") {
                    sidebarProfile.classList.add('active');
                    profile.classList.remove('d-none');
                    project.classList.add('d-none');
                    editProfile.classList.add('d-none');
                    changePass.classList.add('d-none');
                } else if (check === "myproject") {
                    sidebarProject.classList.add('active');
                    profile.classList.add('d-none');
                    project.classList.remove('d-none');
                    editProfile.classList.add('d-none');
                    changePass.classList.add('d-none');
                } else if (check === "editprofile") {
                    sidebarEditProfile.classList.add('active');
                    profile.classList.add('d-none');
                    project.classList.add('d-none');
                    editProfile.classList.remove('d-none');
                    changePass.classList.add('d-none');
                } else if (check === "changepass") {
                    sidebarChangePass.classList.add('active');
                    profile.classList.add('d-none');
                    project.classList.add('d-none');
                    editProfile.classList.add('d-none');
                    changePass.classList.remove('d-none');
                }
            }
        </script>
        <script defer
                src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
                data-cf-beacon='{"rayId":"84651653f9703e54","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
                crossorigin="anonymous">
        </script>
    </body>
</html>
