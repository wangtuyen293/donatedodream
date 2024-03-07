<%-- 
    Document   : project
    Created on : Jan 29, 2024, 3:02:36 PM
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
    <body onload="time()">
        <jsp:include page="../layout/header.jsp" />
        <div class="project-management container-fluid bg-secondary-subtle show active">
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
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js active">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
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
                    </div>
                </div>
                <div class="container-fluid col-10 p-0 pb-5 bg-secondary-subtle">
                    <div class="bg-white">
                        <ul class="nav">
                            <li class="nav-item">
                                <a id="projectManagement" class="nav-link border-bottom border-2 border-primary active" href="#">Projects</a>
                            </li>
                            <li class="nav-item">
                                <a id="unapprovedProjects" class="nav-link" href="#">Projects Pending Approval</a>
                            </li>
                        </ul>
                    </div>
                    <div class="projects">
                        <h3 class="main-title fw-bold ms-4 pt-3">
                            <a class="link-dark text-decoration-none" href="#">
                                Manage projects
                            </a>
                        </h3>
                        <p class="ms-4 text-dark">
                            <span>Manage user' projects and approve or refuse project announcements</span>
                        </p>
                        <div id="clock" class="ms-4 my-2"></div>
                        <div class="ms-2">
                            <form action="updateproject.jsp" method="POST">
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
                                            <th class="text-center">Status</th>
                                            <th>Start Date</th>
                                            <th>End Date</th>
                                            <th class="text-center">Approved</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${projectsApproved}" var="project">
                                            <tr>
                                                <td class="checkbox-project">
                                                    <input type="checkbox" class="project_${project.projectId}" value="${project.projectId}"/>
                                                    <a class="link-dark text-decoration-none" href="#">${project.projectName}</a>
                                                </td>
                                                <td>${project.projectTarget}</td>
                                                <td>
                                                    ${project.donatedAmountOfMoney}
                                                </td>
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
                                                <td class="text-center">
                                                    <c:choose>
                                                        <c:when test="${project.isApproved == 1}">
                                                            <span class="bg-success text-light rounded-pill px-3 py-1">Yes</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="bg-danger text-light rounded-pill px-3 py-1">No</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-primary btn-sm trash" title="Remove" onclick="removeProject(${project.projectId})">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-primary btn-sm edit" title="Edit" onclick="updateProject(${project.projectId})">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <button type="button" id="remove" class="btn btn-danger delete-project d-none" title="Delete" onclick="deleteProjectSelected(selectedProjectIds)">
                                    DELETE
                                </button>
                            </form>
                        </div>
                    </div>

                    <div class="projects-unapproved d-none">
                        <h3 class="main-title fw-bold ms-4 pt-3">
                            <a class="link-dark text-decoration-none" href="#">
                                Projects Pending Approval
                            </a>
                        </h3>
                        <div class="ms-2">
                            <form action="updateproject.jsp" method="POST">

                                <div id="userProjectCarousel" class="carousel carousel-dark slide">
                                    <div class="carousel-inner">
                                        <c:forEach items="${projectsUnapproved}" var="project" varStatus="status">
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
                                                            <div class="d-flex justify-content-around">
                                                                <button type="button" class="btn" onclick="approveProject(${project.projectId})">Approve</button>
                                                                <button type="button" class="btn" onclick="rejectProject(${project.projectId})">Reject</button>
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
                            </form>
                        </div>
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
            const projectManagement = document.getElementById('projectManagement');
            const unapprovedProjects = document.getElementById('unapprovedProjects');
            const projects = document.querySelector('.projects');
            const projectsUnapproved = document.querySelector('.projects-unapproved');

            projectManagement.addEventListener('click', function () {
                projectManagement.classList.add('border-bottom');
                projectManagement.classList.add('border-2');
                projectManagement.classList.add('border-primary');
                projectManagement.classList.add('active');
                unapprovedProjects.classList.remove('border-bottom');
                unapprovedProjects.classList.remove('border-2');
                unapprovedProjects.classList.remove('border-primary');
                unapprovedProjects.classList.remove('active');
                projects.classList.remove('d-none');
                projectsUnapproved.classList.add('d-none');
            });

            unapprovedProjects.addEventListener('click', function () {
                unapprovedProjects.classList.add('border-bottom');
                unapprovedProjects.classList.add('border-2');
                unapprovedProjects.classList.add('border-primary');
                unapprovedProjects.classList.add('active');
                projectManagement.classList.remove('border-bottom');
                projectManagement.classList.remove('border-2');
                projectManagement.classList.remove('border-primary');
                projectManagement.classList.remove('active');
                projectsUnapproved.classList.remove('d-none');
                projects.classList.add('d-none');
            });
        </script>
        <script>
            const selectAll = document.querySelector('#select-all-project');
            const allCheckbox = document.querySelectorAll('.checkbox-project input');
            const deleteProject = document.querySelector('.delete-project');
            let listBoolean = [];
            let selectedProjectIds = [];

            function handleCheckboxChange(projectId) {
                const checkbox = document.querySelector(`.project_` + projectId);

                if (checkbox.checked) {
                    if (!selectedProjectIds.includes(projectId)) {
                        selectedProjectIds.push(projectId); // Add the selected project ID to the list if it doesn't already exist
                    }
                } else {
                    const index = selectedProjectIds.indexOf(projectId);
                    if (index !== -1) {
                        selectedProjectIds.splice(index, 1); // Remove the selected project ID from the list
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
                    deleteProject.classList.remove('d-none');
                } else {
                    deleteProject.classList.add('d-none');
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
            async function updateProject(projectId) {
                const inputOptions = new Promise((resolve) => {
                    setTimeout(() => {
                        resolve({
                            "Approve": "Approve",
                            "Refuse": "Refuse"
                        });
                    }, 0);
                });

                const {value: choice} = await Swal.fire({
                    title: "Do you want to approve the project?",
                    input: "radio",
                    icon: "info",
                    inputOptions,
                    showCancelButton: true,
                    cancelButtonColor: "#d33",

                    inputValidator: (value) => {
                        if (!value) {
                            return "You need to choose something!";
                        }
                    }
                });

                if (choice) {
                    console.log(choice);
                    Swal.fire({
                        text: `You selected: ` + choice,
                        showCancelButton: true,
                        cancelButtonColor: "#d33"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            const isApproved = choice === "Approve" ? "true" : "false";
                            console.log(isApproved);

                            $.ajax({
                                url: "projectmanagement?action=updateproject&projectId=" + projectId + "&isApproved=" + isApproved,
                                type: "POST",
                                success: function (response) {
                                    // Check the response from the server
                                    if (response === "success") {
                                        Swal.fire({
                                            title: "Updated successfully!",
                                            icon: "success"
                                        }).then(() => {
                                            // Reload the page
                                            location.reload();
                                        });
                                    } else {
                                        Swal.fire({
                                            title: "Error!",
                                            text: "Failed to update the project.",
                                            icon: "error"
                                        });
                                    }
                                },
                                error: function (xhr, status, error) {
                                    // Handle the error
                                    Swal.fire({
                                        title: "Error!",
                                        text: "An error occurred while updating the project.",
                                        icon: "error"
                                    });
                                }
                            });
                        }
                    });
                }
            }

            function approveProject(projectId) {
                $.ajax({
                    url: "projectmanagement?action=approve&projectId=" + projectId,
                    type: "POST",
                    success: function (response) {
                        if (response === "success") {
                            Swal.fire({
                                title: "Update successfully!",
                                text: "The project has been approved.",
                                icon: "success"
                            }).then(() => {
                                location.reload();
                            });
                        } else {
                            Swal.fire({
                                title: "Error!",
                                text: "Failed to approve the project.",
                                icon: "error"
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        Swal.fire({
                            title: "Error!",
                            text: "An error occurred while approve the project.",
                            icon: "error"
                        });
                    }
                });
            }
            
            function rejectProject(projectId) {
                $.ajax({
                    url: "projectmanagement?action=reject&projectId=" + projectId,
                    type: "POST",
                    success: function (response) {
                        if (response === "success") {
                            Swal.fire({
                                title: "Update successfully!",
                                text: "The project has been rejected.",
                                icon: "success"
                            }).then(() => {
                                location.reload();
                            });
                        } else {
                            Swal.fire({
                                title: "Error!",
                                text: "Failed to reject the project.",
                                icon: "error"
                            });
                        }
                    },
                    error: function (xhr, status, error) {
                        Swal.fire({
                            title: "Error!",
                            text: "An error occurred while reject the project.",
                            icon: "error"
                        });
                    }
                });
            }

            function deleteProjectSelected(projectId) {
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
                            url: "projectmanagement?action=deleteprojectselected&projectId=" + projectId,
                            type: "POST",
                            success: function (response) {
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The project has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the project.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the project.",
                                    icon: "error"
                                });
                            }
                        });
                    }
                });
            }

            function removeProject(projectId) {
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
                            url: "projectmanagement?action=deleteproject&projectId=" + projectId,
                            type: "POST",
                            success: function (response) {
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The project has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the project.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the project.",
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
