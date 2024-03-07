<%-- 
    Document   : project
    Created on : Feb 2, 2024, 11:06:30 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Projects</title>
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
        <style>
            .container.page {
                background-color: #f8f9fa;
            }

            .page-numbers .page-link {
                color: #000;
            }

            .page-numbers li span {
                width: 15px;
                height: 15px;
                display: flex;
                justify-content: center;
                align-items: center;
                cursor: pointer;
            }

            .page-numbers li.current {
                background-color: #007bff;
                color: #fff;
                border-radius: 100%;
            }

            .page-numbers li:hover, .page-numbers li:active {
                background-color: #007bff;
                border-radius: 100%;
            }

            .page-numbers li:hover a, .page-numbers li:active {
                color: #fff;
            }

            .page-prev a,
            .page-next a {
                color: #343a40;
                text-decoration: none;
            }

            .page-prev a:hover,
            .page-next a:hover {
                color: #0d6efd;
            }
        </style>
    </head>
    <body>
        <jsp:include page="./layout/header.jsp" />
        <div class="all-project">
            <div class="bg-body-tertiary py-5">
                <h1 class="text-center fw-medium mt-5">
                    All Projects
                </h1>
            </div>
            <div class="projects container-fluid my-5">
                <div class="d-flex row justify-content-around mx-5">
                    <c:forEach items="${projectsApproved}" var="project">
                        <div class="card col-4 m-0 p-0 mx-3 my-5" style="width: 22rem;">
                            <img src="./assets/img/needy/refugee.jpg" class="card-img-top" alt="project">
                            <div class="card-body">
                                <h5 class="card-title mt-2">
                                    <a href="project?action=projectdetail" class="text-decoration-none link-dark">${project.projectName}</a>
                                </h5>
                                <div class="goal-target d-flex justify-content-between ">
                                    <span class="card-text text-dark m-0">${project.projectTarget}</span>
                                    <span class="card-text text-dark m-0">${project.donatedAmountOfMoney}</span>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <span class="card-text text-dark m-0">Goal</span>
                                    <span class="card-text text-dark m-0">Supported</span>
                                </div>
                                <div class="progress my-3" role="progressbar" aria-label="progressLabel" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar bg-danger" style="width: ${project.donatedAmountOfMoney * 100 / project.projectTarget}%">
                                        ${project.donatedAmountOfMoney * 100 / project.projectTarget}%
                                    </div>
                                </div>
                                <div class="user-infor pt-4 border-top d-flex justify-content-between">
                                    <div>
                                        <img class="rounded-circle" src="./assets/img/avatar/user.png" height="40" width="40">
                                        <span>
                                            <a href="user?userId=${project.getUser().getUserId()}" class="text-decoration-none link-dark">
                                                ${project.getUser().getFullName()}
                                            </a>
                                        </span>
                                    </div>
                                    <div>
                                        <span>${project.donatedAmountOfMoney * 100 / project.projectTarget}%</span>
                                        <p>
                                            Success
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <c:set var="page" value="${page}"/>
                <div class="container page d-flex justify-content-between align-items-center border py-2">
                    <div class="page-prev">
                        <span style="cursor: pointer;">
                            <c:choose>
                                <c:when test="${page == 1}">
                                    PREV
                                </c:when>
                                <c:otherwise>
                                    <a href="project?page=${page - 1}">PREV</a>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                    <div class="page-numbers">
                        <ul class="d-flex justify-content-center align-items-center m-0 p-0">
                            <c:forEach begin="${1}" end="${num}" var="i">
                                <li class="p-2 m-1 ${i == page ? 'current' : ''}">
                                    <span style="cursor: pointer;">
                                        <c:choose>
                                            <c:when test="${i == page}">
                                                ${i}
                                            </c:when>
                                            <c:otherwise>
                                                <a href="project?page=${i}" class="page-link text-decoration-none">${i}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="page-next">
                        <span style="cursor: pointer;">
                            <c:choose>
                                <c:when test="${page == num}">
                                    NEXT
                                </c:when>
                                <c:otherwise>
                                    <a href="project?page=${page + 1}">NEXT</a>
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
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
