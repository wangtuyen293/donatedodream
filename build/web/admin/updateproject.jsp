<%-- 
    Document   : updateproject
    Created on : Feb 8, 2024, 3:16:28 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Project Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

            .sidebar-js.active .main-title {
                color: #fff;
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
    <body>
        <jsp:include page="../layout/header.jsp" />
        <div class="project-management container-fluid bg-secondary-subtle show active" style="height: 36rem;">
            <div class="row">
                <div class="col-2 p-0" style="background: #f3f6f9">
                    <div class="accordion" id="sidebar">
                        <ul class="m-0 p-0">
                            <li class="sidebar-content ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="dashboard">
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
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js active">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="projectmanagement">
                                    <i class="fa-solid fa-list-check"></i>
                                    <span class="ps-2">Project Management</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
                                    <i class="fa-solid fa-user-lock"></i>
                                    <span class="ps-2">Privacy Policy</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
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
                                        <a class="sidebar-link text-dark text-decoration-none" href="#" data-bs-parent="#sidebar">
                                            <span class="sidebar-link-item ps-2">Extension 1</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item ps-5 py-2">
                                        <a class="sidebar-link text-dark text-decoration-none" href="#" data-bs-parent="#sidebar">
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
                <div class="container col-10 py-3 bg-secondary-subtle">
                    <h3 class="main-title fw-bold ms-3">
                        <a class="link-dark text-decoration-none" href="#">
                            Management projects
                        </a>
                    </h3>
                    <div id="clock" class="ms-3 my-2"></div>
                    <p class="ms-3">Manage user' projects and approve or refuse project announcements</p>
                    <div class="row ms-1">
                        <form action="projectmanagement?action=updateproject" method="POST">
                            <table class="table table-hover table-bordered" id="projectmanager">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="select-all" id="select-all-project"/>
                                            Project
                                        </th>
                                        <th>Target</th>
                                        <th>Donated</th>
                                        <!--<th>Image</th>-->
                                        <th>Status</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Approved</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${projectList}" var="project">
                                    <tr>
                                        <td class="checkbox-project">
                                            <input type="checkbox" class="project_${project.projectId}" value="${project.projectId}"/>
                                            ${project.projectName}
                                        </td>
                                        <td>${project.projectTarget}</td>
                                        <td>
                                            ${project.donatedAmountOfMoney}
                                        </td>
                                        <!--                                            <td>
                                                                                        <button class="btn btn-warning rounded-pill px-3 py-1 fw-bold" style="font-size: 10px;">
                                                                                            View
                                                                                            <span class="bg-warning text-dark rounded-pill px-3 py-1">View</span>
                                                                                        </button>
                                                                                    </td>-->
                                        <td class="text-center">
                                    <c:if test="${project.projectStatus.equalsIgnoreCase('active')}">
                                        <span class="bg-success text-light rounded-pill px-3 py-1">${project.projectStatus}</span>
                                    </c:if>
                                    <c:if test="${project.projectStatus.equalsIgnoreCase('outdated')}">
                                        <span class="bg-warning text-dark rounded-pill px-3 py-1">${project.projectStatus}</span>
                                    </c:if>
                                    <c:if test="${project.projectStatus.equalsIgnoreCase('new')}">
                                        <span class="bg-danger text-light rounded-pill px-3 py-1">${project.projectStatus}</span>
                                    </c:if>
                                    </td>
                                    <td>${project.startDate}</td>
                                    <td>${project.endDate}</td>
                                    <td>
                                    <c:choose>
                                        <c:when test="${project.isApproved == 1}">
                                            Yes
                                        </c:when>
                                        <c:otherwise>
                                            No
                                        </c:otherwise>
                                    </c:choose>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm trash" title="Remove" onclick="removeProject(${project.projectId})">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                        <button type="button" class="btn btn-primary btn-sm edit" title="Edit" id="show-emp"
                                                data-toggle="modal" data-target="#ModalUP${c.courseId}">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <button type="button" id="remove" class="btn btn-danger delete-project d-none" title="Delete" onclick="deleteUserSelected(selectedUserIds)">
                                DELETE
                            </button>
                        </form>
                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
        <script>
            const selectAll = document.querySelector('#select-all-project');
            const allCheckbox = document.querySelectorAll('.checkbox-project input');
            const deleteUser = document.querySelector('.delete-project');
            let listBoolean = [];
            let selectedUserIds = [];

            function handleCheckboxChange(projectId) {
                const checkbox = document.querySelector(`.project_` + projectId);

                if (checkbox.checked) {
                    if (!selectedUserIds.includes(projectId)) {
                        selectedUserIds.push(projectId); // Add the selected user ID to the list if it doesn't already exist
                    }
                } else {
                    const index = selectedUserIds.indexOf(projectId);
                    if (index !== -1) {
                        selectedUserIds.splice(index, 1); // Remove the selected user ID from the list
                    }
                }
            }

            function checkDeleteButtonVisibility() {
                let isChecked = false;
                allCheckbox.forEach(item => {
                    if (item.checked) {
                        isChecked = true;
                        handleCheckboxChange(item.value);
                        return;
                    }
                    handleCheckboxChange(item.value);
                });

                if (isChecked) {
                    deleteUser.classList.remove('d-none');
                } else {
                    deleteUser.classList.add('d-none');
                }
            }

            allCheckbox.forEach(item => {
                item.addEventListener('change', function () {
                    allCheckbox.forEach(i => {
                        listBoolean.push(i.checked);
                    });
                    if (listBoolean.includes(false)) {
                        selectAll.checked = false;
                    } else {
                        selectAll.checked = true;
                    }
                    listBoolean = [];
                    checkDeleteButtonVisibility();
                    const projectId = item.value;
                    handleCheckboxChange(projectId);
                });
            });

            selectAll.addEventListener('change', function () {
                if (this.checked) {
                    allCheckbox.forEach(i => {
                        i.checked = true;
                    });
                } else {
                    allCheckbox.forEach(i => {
                        i.checked = false;
                    });
                }

                checkDeleteButtonVisibility();
            });
        </script>
        <script>
            function deleteUserSelected(userId) {
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "usermanagement?action=deleteuserselected&userId=" + userId,
                            type: "POST",
                            success: function (response) {
                                // Check the response from the server
                                console.log(response);
                                console.log(response === "success");
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The user has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        // Reload the page
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the user.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                // Handle the error
                                console.log(error);
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the user.",
                                    icon: "error"
                                });
                            }
                        });
                    }
                });
            }

            function removeProject(userId) {
                Swal.fire({
                    title: "Are you sure?",
                    text: "You won't be able to revert this!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Yes, delete it!"
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: "usermanagement?action=deleteuser&userId=" + userId,
                            type: "POST",
                            success: function (response) {
                                // Check the response from the server
                                console.log(response);
                                console.log(response === "success");
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The user has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        // Reload the page
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the user.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                // Handle the error
                                console.log(error);
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the user.",
                                    icon: "error"
                                });
                            }
                        });
                    }
                });
            }
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
                data-cf-beacon='{"rayId":"84651653f9703e54","version":"2023.10.0","token":"cd0b4b3a733644fc843ef0b185f98241"}'>
        </script>
    </body>
</html>
