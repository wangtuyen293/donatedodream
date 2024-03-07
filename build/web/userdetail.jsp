<%-- 
    Document   : userdetail
    Created on : Mar 2, 2024, 11:10:01 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>User Detail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <jsp:include page="./layout/header.jsp" />
        <div class="user-detail">
            <div class="row bg-body-tertiary py-5">
                <div class="col-4 text-center">
                    <img class="rounded-circle" src="./assets/img/avatar/user.png" height="160" width="160">
                </div>
                <h1 class="col-8 fw-medium my-5">
                    Author: ${userinfor.fullName}
                </h1>
            </div>

            <div class="container py-2">
                <ul class="nav">
                    <li class="nav-item">
                        <a id="personalInfoLink" class="nav-link border-bottom border-2 border-primary active" href="#">Personal Information</a>
                    </li>
                    <li class="nav-item">
                        <a id="projectsLink" class="nav-link" href="#">Projects</a>
                    </li>
                </ul>
            </div>

            <div class="user-infor container py-5 my-5">
                <h2 class="text-center text-uppercase">
                    Personal information
                </h2>
                <div class="mb-3">
                    <label for="fullName" class="form-label">Full Name</label>
                    <input type="text" class="form-control" id="fullName" value="${userinfor.fullName}" aria-label="fullNameLabel" disabled readonly>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" value="${userinfor.email}" aria-label="emailLabel" disabled readonly>
                </div>
                <c:if test="${user.userTypeId == 1}">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" value="${userinfor.userName}" aria-label="userNameLabel" disabled readonly>
                    </div>
                    <div class="mb-3">
                        <label for="userStatus" class="form-label">User Status</label>
                        <c:choose>
                            <c:when test="${userinfor.userStatus.equalsIgnoreCase('warning')}">
                                <input type="text" class="form-control bg-warning" id="userStatus" value="${userinfor.userStatus}" aria-label="userStatusLabel" disabled readonly>
                            </c:when>
                            <c:otherwise>
                                <input type="text" class="form-control" id="userStatus" value="${userinfor.userStatus}" aria-label="userStatusLabel" disabled readonly>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="mb-3">
                        <label for="dateCreated" class="form-label">Date Created</label>
                        <input type="text" class="form-control" id="dateCreated" value="${userinfor.dateCreated}" aria-label="dateCreatedLabel" disabled readonly>
                    </div>
                </c:if>
                <div class="mb-3">
                    <label for="phone" class="form-label">Phone</label>
                    <input type="text" class="form-control" id="phone" value="${userinfor.phoneNumber}" aria-label="phoneNumberLabel" disabled readonly>
                </div>
                <div class="mb-3">
                    <label for="dateOfBirth" class="form-label">Date Of Birth</label>
                    <input type="text" class="form-control" id="dateOfBirth" value="${userinfor.dateOfBirth}" aria-label="dateOfBirthLabel" disabled readonly>
                </div>
                <div class="mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <c:choose>
                        <c:when test="${userinfor.gender == 1}">
                            <input type="text" class="form-control" id="gender" value="Male" aria-label="genderLabel" disabled readonly>
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="form-control" id="gender" value="Female" aria-label="genderLabel" disabled readonly>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="user-project container-fluid py-5 d-none bg-body-tertiary">
                <h2 class="text-center text-uppercase">
                    Projects
                </h2>
                <div id="userProjectCarousel" class="carousel carousel-dark slide">
                    <div class="carousel-inner">
                        <c:forEach items="${userproject}" var="project" varStatus="status">
                            <c:if test="${status.index % 3 == 0}">
                                <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                    <div class="row d-flex justify-content-evenly mx-5">
                                    </c:if>
                                    <div class="card col-4 m-0 p-0 mx-3 my-5" style="width: 18rem;">
                                        <img src="./assets/img/needy/refugee.jpg" class="card-img-top" alt="project">
                                        <div class="card-body">
                                            <h5 class="card-title mt-2">
                                                <a href="project?action=project" class="text-decoration-none link-dark">${project.projectName}</a>
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
                                        </div>
                                    </div>
                                    <c:if test="${status.index % 3 == 2 || status.last}">
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
            const personalInfoLink = document.getElementById('personalInfoLink');
            const projectsLink = document.getElementById('projectsLink');
            const userInfor = document.querySelector('.user-infor');
            const userProject = document.querySelector('.user-project');

            personalInfoLink.addEventListener('click', function () {
                personalInfoLink.classList.add('border-bottom');
                personalInfoLink.classList.add('border-2');
                personalInfoLink.classList.add('border-primary');
                personalInfoLink.classList.add('active');
                projectsLink.classList.remove('border-bottom');
                projectsLink.classList.remove('border-2');
                projectsLink.classList.remove('border-primary');
                projectsLink.classList.remove('active');
                userInfor.classList.remove('d-none');
                userProject.classList.add('d-none');
            });

            projectsLink.addEventListener('click', function () {
                projectsLink.classList.add('border-bottom');
                projectsLink.classList.add('border-2');
                projectsLink.classList.add('border-primary');
                projectsLink.classList.add('active');
                personalInfoLink.classList.remove('border-bottom');
                personalInfoLink.classList.remove('border-2');
                personalInfoLink.classList.remove('border-primary');
                personalInfoLink.classList.remove('active');
                userProject.classList.remove('d-none');
                userInfor.classList.add('d-none');
            });
        </script>
        <script defer
                src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"
                data-cf-beacon='{"rayId":"84651653f9703e54","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'
        crossorigin="anonymous"></script>
    </body>
</html>
