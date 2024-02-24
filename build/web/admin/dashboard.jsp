<%-- 
    Document   : dashboard
    Created on : Feb 2, 2024, 10:11:31 PM
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
        <title>Dashboard</title>
        <!--<meta name="viewport" content="width=device-width, initial-scale=1">-->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <!--<link rel="stylesheet" href="assets/css/fontawesome.min.css">-->
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

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

            .sidebar-content:hover, .sidebar-content:focus ,.sidebar-content:active,
            .accordion-button:hover, .accordion-button:focus ,.accordion-button:active  {
                background-color: #5500C9 !important;
                text-decoration: none !important;
                border: hidden !important;
            }

            .sidebar-js.active {
                background-color: #5500C9 !important;
                text-decoration: none !important;
                border: hidden !important;
            }

            .sidebar-js.active .sidebar-item {
                background: #fff;
            }

            .sidebar-content:hover .sidebar-content-link, .sidebar-content:focus .sidebar-content-link, .sidebar-content:active .sidebar-content-link {
                color: #FFF !important;
            }

            .sidebar-js.active .sidebar-content-link {
                color: #FFF !important;
            }

            .sidebar-item:hover {
                background: #e9ecef !important;
            }

            .sidebar-item:active, .sidebar-item:focus {
                background: #009cff !important;
            }

            .sidebar-item:active .sidebar-link-item, .sidebar-item:focus .sidebar-link-item {
                color:#FFF !important;
            }
        </style>
    </head>
    <body onload="time()">
        <jsp:include page="../layout/header.jsp" />
        <div class="container-fluid bg-secondary-subtle show active" style="height: 36rem;">
            <div class="row">
                <div class="sidebar col-2 p-0" style="background: #f3f6f9">
                    <div class="accordion" id="dashboard-sidebar">
                        <ul class="m-0 p-0">
                            <li class="sidebar-content ps-4 py-3 border sidebar-js active">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
                                    <i class="fa-solid fa-house"></i>
                                    <span class="ps-2">Dashboard</span>
                                </a>
                            </li>
                            <li class="accordion-item text-white shadow-none border sidebar-js">
                                <a class="accordion-button text-decoration-none shadow-none border-0" href="#" data-bs-toggle="collapse" data-bs-target="#posts" aria-expanded="true" aria-controls="posts">
                                    <i class="fa-solid fa-file-lines ms-1"></i>
                                    <span class="ps-2 ms-2 main-title">Posts</span>
                                </a>
                                <ul id="posts" class="accordion-collapse collapse m-0 p-0">
                                    <li class="sidebar-item ps-5 py-2">
                                        <a class="sidebar-link text-dark text-decoration-none" href="#" data-bs-parent="#dashboard-sidebar">
                                            <span class="sidebar-link-item ps-2">All Post</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ps-5 py-2">
                                        <a class="sidebar-link text-dark text-decoration-none" href="#" data-bs-parent="#dashboard-sidebar">
                                            <span class="sidebar-link-item ps-2">Create new post</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="usermanagement">
                                    <i class="fa-solid fa-users"></i>
                                    <span class="ps-2">User Management</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="charityorgmanagement">
                                    <i class="fa-solid fa-sitemap"></i>
                                    <span class="ps-2">Charity Organization Management</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="projectmanagement">
                                    <i class="fa-solid fa-list-check"></i>
                                    <span class="ps-2">Project Management</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="privacypolicy">
                                    <i class="fa-solid fa-user-lock"></i>
                                    <span class="ps-2">Privacy Policy</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="categorymanagement">
                                    <i class="fa-regular fa-file"></i>
                                    <span class="ps-2">Categories</span>
                                </a>
                            </li>
                        </ul>
                        <div class="py-3 border">
                            <span class="ps-2 link-dark">SYSTEM</span>
                        </div>
                        <ul class="m-0 p-0">
                            <li class="accordion-item text-white shadow-none border rounded-0 accordion-active-light sidebar-js">
                                <a class="accordion-button text-decoration-none shadow-none border-0 rounded-0" href="#" data-bs-toggle="collapse" data-bs-target="#extensions" aria-expanded="true" aria-controls="extensions">
                                    <i class="fa-solid fa-puzzle-piece ms-1"></i>
                                    <span class="ps-2 ms-2 main-title">Extensions</span>
                                </a>
                                <ul id="extensions" class="accordion-collapse collapse m-0 p-0">
                                    <li class="sidebar-item ps-5 py-2">
                                        <a class="sidebar-link text-dark text-decoration-none" href="#" data-bs-parent="#dashboard-sidebar">
                                            <span class="sidebar-link-item ps-2">Extension 1</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ps-5 py-2">
                                        <a class="sidebar-link text-dark text-decoration-none" href="#" data-bs-parent="#dashboard-sidebar">
                                            <span class="sidebar-link-item ps-2">Extension 2</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
                                    <i class="fa-solid fa-gear"></i>
                                    <span class="ps-2">Settings</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="dashboard container col-10 py-3 bg-secondary-subtle">
                    <h3 class="main-title fw-bold ms-3">
                        <a class="link-dark text-decoration-none" href="#">
                            Dashboard
                        </a>
                    </h3>
                    <div id="clock" class="ms-3 my-2"></div>
                    <div class="row ms-3">
                        <div class="bg-light col-md-6 col-lg-5 rounded">
                            <article class="row p-3">
                                <div class="col-lg-3 d-flex justify-content-center align-items-center" >
                                    <div class="bg-secondary-subtle rounded-circle d-flex justify-content-center align-items-center" style="height: 4rem; width: 4rem">
                                        <i class="fa-solid fa-users"></i>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <h5 class="m-0">Total Users</h5>
                                    <p class="number fw-bold m-0">
                                        <a class="link-dark text-decoration-none" href="usermanagement">
                                            ${requestScope.user}
                                        </a>
                                    </p>
                                    <p class="title m-0">Total visits</p>
                                    <p class="m-0">
                                        <span class="stat-cards-info__profit success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trending-up" aria-hidden="true"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>4.07%
                                        </span>
                                        Last month
                                    </p>
                                </div>
                            </article>
                        </div>
                        <div class="bg-light col-md-6 col-lg-5 ms-4 rounded">
                            <article class="row p-3">
                                <div class="col-lg-3 d-flex justify-content-center align-items-center">
                                    <div class="bg-secondary-subtle rounded-circle d-flex justify-content-center align-items-center" style="height: 4rem; width: 4rem">
                                        <i class="fa-solid fa-people-group"></i>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <h5 class="m-0">Total organizations</h5>
                                    <p class="number fw-bold m-0">
                                        <a class="link-dark text-decoration-none" href="#">
                                            ${requestScope.charityOrg}
                                        </a>
                                    </p>
                                    <p class="title m-0">Total visits</p>
                                    <p class="m-0">
                                        <span class="stat-cards-info__profit success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trending-up" aria-hidden="true"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>0.24%
                                        </span>
                                        Last month
                                    </p>
                                </div>
                            </article>
                        </div>
                        <div class="bg-light col-md-6 col-lg-5 mt-4 rounded">
                            <article class="row p-3">
                                <div class="col-lg-3 d-flex justify-content-center align-items-center">
                                    <div class="bg-secondary-subtle rounded-circle d-flex justify-content-center align-items-center" style="height: 4rem; width: 4rem">
                                        <i class="fa-regular fa-file"></i>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <h5 class="m-0">Total Projects</h5>
                                    <p class="number fw-bold m-0">
                                        <a class="link-dark text-decoration-none" href="projectmanagement">
                                            ${requestScope.project}
                                        </a>
                                    </p>
                                    <p class="title m-0">Total visits</p>
                                    <p class="m-0">
                                        <span class="stat-cards-info__profit success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trending-up" aria-hidden="true"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>0.24%
                                        </span>
                                        Last month
                                    </p>
                                </div>
                            </article>
                        </div>
                        <div class="bg-light col-md-6 col-lg-5 ms-4 mt-4 rounded">
                            <article class="row p-3">
                                <div class="col-lg-3 d-flex justify-content-center align-items-center">
                                    <div class="bg-secondary-subtle rounded-circle d-flex justify-content-center align-items-center" style="height: 4rem; width: 4rem">
                                        <i class="fa-solid fa-file-circle-check"></i>
                                    </div>
                                </div>
                                <div class="col-lg-9">
                                    <h5 class="m-0">Succeed Projects</h5>
                                    <p class="number fw-bold m-0">
                                        <a class="link-dark text-decoration-none" href="#">
                                            ${requestScope.feedback}
                                        </a>
                                    </p>
                                    <p class="title m-0">Total visits</p>
                                    <p class="m-0">
                                        <span class="stat-cards-info__profit success">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trending-up" aria-hidden="true"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>0.24%
                                        </span>
                                        Last month
                                    </p>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>

                <div class="post d-none">
                    <h1>Post</h1>
                </div>

                <div class="user-management container col-10 py-3 bg-secondary-subtle d-none">
                    <h3 class="main-title fw-bold ms-3">
                        <a class="link-dark text-decoration-none" href="#">
                            Management invitations and users
                        </a>
                    </h3>
                    <div id="clock" class="ms-3 my-2"></div>
                    <p class="ms-3">Manage users and their role, account access and projects from user section.</p>
                    <div class="row ms-1">
                        <form action="usermanagement?action=updateuser" method="POST">
                            <table class="table table-hover table-bordered" id="usermanager">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="select-all" id="select-all-user"/>
                                            User
                                        </th>
                                        <th>Email</th>
                                        <th>Roles</th>
                                        <th>Status</th>
                                        <th>Created</th>
                                        <th>Site Admin</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${userList}" var="user">
                                        <tr>
                                            <td class="checkbox-user">
                                                <!--<a data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">-->
                                                <input type="checkbox" class="user_${user.userId}" value="${user.userId}"/>
                                                <!--</a>-->
                                                ${user.fullName}
                                            </td>
                                            <td>${user.email}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.userTypeId == 1}">
                                                        Admin
                                                    </c:when>
                                                    <c:otherwise>
                                                        Donator
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="text-center">
                                                <c:if test="${user.userStatus.equalsIgnoreCase('active')}">
                                                    <span class="bg-success text-light rounded-pill px-3 py-1">${user.userStatus}</span>
                                                </c:if>
                                                <c:if test="${user.userStatus.equalsIgnoreCase('warning')}">
                                                    <span class="bg-warning text-dark rounded-pill px-3 py-1">${user.userStatus}</span>
                                                </c:if>
                                                <c:if test="${user.userStatus.equalsIgnoreCase('block')}">
                                                    <span class="bg-danger text-light rounded-pill px-3 py-1">${user.userStatus}</span>
                                                </c:if>
                                            </td>
                                            <td>${user.dateCreated}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${user.userTypeId == 1}">
                                                        Yes
                                                    </c:when>
                                                    <c:otherwise>
                                                        No
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-danger btn-sm trash" title="Remove" onclick="removeUser(${user.userId})">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                                <button type="button" class="btn btn-warning btn-sm edit" title="Edit" id="show-emp"
                                                        data-toggle="modal" data-target="#ModalUP${user.userId}">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="button" id="remove" class="btn btn-danger delete-user d-none" title="Delete" onclick="deleteUserSelected(selectedUserIds)">
                                DELETE
                            </button>
                            <!--                            <button class="btn btn-primary">
                                                            Save
                                                        </button>-->
                            <!--                            <button class="btn btn-primary">
                                                            Cancel
                                                        </button>-->
                        </form>
                    </div>
                </div>

                <div class="project-management d-none">
                    <h1>Project Management</h1>
                </div>

                <div class="privacy-policy d-none">
                    <h1>Privacy Policy</h1>
                </div>

                <div class="category d-none">
                    <h1>Categories</h1>
                </div>
            </div>
        </div>
        <jsp:include page="../layout/footer.jsp" />

        <script src="assets/js/vendor/modernizr-3.5.0.min.js"></script>

        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

        <script src="assets/js/jquery.slicknav.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/slick.min.js"></script>

        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/animated.headline.js"></script>
        <script src="assets/js/jquery.magnific-popup.js"></script>

        <script src="assets/js/jquery.scrollUp.min.js"></script>
        <script src="assets/js/jquery.nice-select.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>

        <script src="assets/js/contact.js"></script>
        <script src="assets/js/jquery.form.js"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/mail-script.js"></script>
        <script src="assets/js/jquery.ajaxchimp.min.js"></script>

        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script type="text/javascript">
                                //Time
                                function time() {
                                    var today = new Date();
                                    var weekday = new Array(7);
                                    weekday[0] = "Sunday";
                                    weekday[1] = "Monday";
                                    weekday[2] = "Tuesday";
                                    weekday[3] = "Wednesday";
                                    weekday[4] = "Thursday";
                                    weekday[5] = "Friday";
                                    weekday[6] = "Saturday";
                                    var day = weekday[today.getDay()];
                                    var dd = today.getDate();
                                    var mm = today.getMonth() + 1;
                                    var yyyy = today.getFullYear();
                                    var h = today.getHours();
                                    var m = today.getMinutes();
                                    var s = today.getSeconds();
                                    m = checkTime(m);
                                    s = checkTime(s);
                                    nowTime = h + ":" + m + ":" + s;
                                    if (dd < 10) {
                                        dd = '0' + dd;
                                    }
                                    if (mm < 10) {
                                        mm = '0' + mm;
                                    }
                                    today = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                    tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                                            '</span>';
                                    document.getElementById("clock").innerHTML = tmp;
                                    clocktime = setTimeout("time()", "1000", "Javascript");

                                    function checkTime(i) {
                                        if (i < 10) {
                                            i = "0" + i;
                                        }
                                        return i;
                                    }
                                }
        </script>

<!--        <script>
            const sideBars = document.querySelectorAll('.sidebar-js');

            sideBars.forEach(item => {
                item.addEventListener('click', () => {
                    sideBars.forEach(sidebar => {
                        sidebar.classList.remove('active');
                    });
                    item.classList.add('active');
                });
            });
        </script>-->
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
