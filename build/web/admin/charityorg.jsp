<%-- 
    Document   : charityorg
    Created on : Jan 15, 2024, 1:03:44 AM
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
        <title>Charity Organization Management</title>
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
        <div class="charityorg-management container-fluid bg-secondary-subtle show active">
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
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js active">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
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
                    </div>
                </div>
                <div class="charityorg-management container col-10 pt-3 pb-5 bg-secondary-subtle">
                    <h3 class="main-title fw-bold ms-3">
                        <a class="link-dark text-decoration-none" href="#">
                            Manage charity organizations
                        </a>
                    </h3>
                    <p class="ms-3 text-dark">
                        <span>
                            Manage their account access and projects from charity organization section.
                        </span>
                    </p>
                    <div id="clock" class="ms-3 my-2"></div>

                    <c:if test="${not empty insertSuccess}">
                        <p class="ms-3 text-success">
                            ${insertSuccess}
                        </p>
                    </c:if>
                    <c:if test="${not empty insertFail}">
                        <p class="ms-3 text-danger">
                            ${insertFail}
                        </p>
                    </c:if>
                    <c:if test="${not empty updateSuccess}">
                        <p class="ms-3 text-success">
                            ${updateSuccess}
                        </p>
                    </c:if>
                    <c:if test="${not empty updateFail}">
                        <p class="ms-3 text-danger">
                            ${updateFail}
                        </p>
                    </c:if>

                    <div class="ms-1">
                        <div>
                            <form action="charityorgmanagement?action=updatecharityorg" method="POST">
                                <table class="table table-hover table-bordered" id="charityorgmanager">
                                    <thead>
                                        <tr>
                                            <th>
                                                <input type="checkbox" class="select-all" id="select-all-charityorg"/>
                                                Charity Organization
                                            </th>
                                            <th>Email</th>
                                            <th class="text-center">Logo</th>
                                            <th>Address</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${charityOrgList}" var="org">
                                            <tr>
                                                <td class="checkbox-charityorg">
                                                    <input type="checkbox" class="charityorg_${org.charityOrganizationId}" value="${org.charityOrganizationId}"/>
                                                    <a class="link-dark text-decoration-none" href="#">${org.charityOrganizationName}</a>
                                                </td>
                                                <td>${org.charityOrganizationEmail}</td>
                                                <td class="text-center">
                                                    <c:if test="${not empty org.charityOrganizationLogo}">
                                                        <c:set var="contextPath" value="${pageContext.request.contextPath}" />
                                                        <c:set var="fullCharityOrgPath" value="${contextPath}/${org.charityOrganizationLogo}" />
                                                        <img src="${fullCharityOrgPath}" class="img-fluid" alt="CharityOrg" style="width: 100%; height: 4rem;">
                                                    </c:if>
                                                </td>
                                                <td>
                                                    ${org.charityOrganizationAddress}
                                                </td>
                                                <td>
                                                    <button type="button" class="btn btn-danger btn-sm trash" title="Remove" onclick="removeCharityOrg(${org.charityOrganizationId})">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-warning btn-sm edit" title="Edit" onclick="openEditModal(${org.charityOrganizationId}, '${org.charityOrganizationName}', '${org.charityOrganizationEmail}', '${org.charityOrganizationAddress}', '${org.charityOrganizationPhone}'); $('#updateCharityOrg').modal('show');">
                                                        <i class="fas fa-edit"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <button type="button" id="remove" class="btn btn-danger delete-charityorg d-none" title="Delete" onclick="deleteCharityOrgSelected(selectedCharityOrgIds)">
                                    DELETE
                                </button>
                                <button type="button" id="create" class="btn btn-success create-charityorg" title="Create" data-bs-toggle="modal" data-bs-target="#createCharityOrg">
                                    CREATE
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="insert-charityorg modal fade" id="createCharityOrg" tabindex="-1" aria-labelledby="createCharityOrgLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 fw-bold" id="createCharityOrgLabel">Create a new Charity Organization</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="createCharityOrgForm" action="charityorgmanagement?action=insertcharityorg" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="name" class="form-label">
                                    Charity Organization Name 
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="name" name="charityOrganizationName" placeholder="Name..." required="">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    Email
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="email" class="form-control" id="email" name="charityOrganizationEmail" placeholder="Email..." required="">
                            </div>
                            <div class="mb-3">
                                <label for="logo">
                                    Logo
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="file" class="form-control" id="logo" name="logo" size="100" required="">
                            </div>
                            <div class="mb-3">
                                <label for="address">
                                    Address
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="address" name="charityOrganizationAddress" placeholder="Address..." required="">
                            </div>
                            <div class="mb-3">
                                <label for="phone">
                                    Phone
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="phone" name="charityOrganizationPhone" placeholder="Phone..." required="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div class="update-charityorg modal fade" id="updateCharityOrg" tabindex="-1" aria-labelledby="updateCharityOrgLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 fw-bold" id="updateCharityOrgLabel">Update Charity Organization</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="updateCharityOrgForm" action="charityorgmanagement?action=updatecharityorg" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <input type="hidden" id="editId" name="charityOrganizationId" />
                            <div class="mb-3">
                                <label for="editName" class="form-label">
                                    Charity Organization Name
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="editName" name="charityOrganizationName" placeholder="Name..." required>
                            </div>
                            <div class="mb-3">
                                <label for="editEmail" class="form-label">
                                    Email
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="email" class="form-control" id="editEmail" name="charityOrganizationEmail" placeholder="Email..." required>
                            </div>
                            <div class="mb-3">
                                <label for="editLogo">
                                    Logo
                                </label>
                                <input type="file" class="form-control" id="editLogo" name="charityOrganizationLogo">
                            </div>
                            <div class="mb-3">
                                <label for="editAddress">
                                    Address
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="editAddress" name="charityOrganizationAddress" placeholder="Address..." required>
                            </div>
                            <div class="mb-3">
                                <label for="editPhone">
                                    Phone
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="editPhone" name="charityOrganizationPhone" placeholder="Phone..." required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
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
            document.getElementById('createCharityOrgForm').addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                }
            });
            document.getElementById('updateCharityOrgForm').addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                }
            });
        </script>
        <script>
            function openEditModal(charityOrganizationId, charityOrganizationName, charityOrganizationEmail, charityOrganizationAddress, charityOrganizationPhone) {
                document.getElementById('editId').value = charityOrganizationId;
                document.getElementById('editName').value = charityOrganizationName;
                document.getElementById('editEmail').value = charityOrganizationEmail;
                document.getElementById('editAddress').value = charityOrganizationAddress;
                document.getElementById('editPhone').value = charityOrganizationPhone;
            }
        </script>
        <script>
            const selectAll = document.querySelector('#select-all-charityorg');
            const allCheckbox = document.querySelectorAll('.checkbox-charityorg input');
            const deleteCharityOrg = document.querySelector('.delete-charityorg');
            let listBoolean = [];
            let selectedCharityOrgIds = [];

            function handleCheckboxChange(charityOrganizationId) {
                const checkbox = document.querySelector(`.charityorg_` + charityOrganizationId);

                if (checkbox.checked) {
                    if (!selectedCharityOrgIds.includes(charityOrganizationId)) {
                        selectedCharityOrgIds.push(charityOrganizationId); // Add the selected charity organization ID to the list if it doesn't already exist
                    }
                } else {
                    const index = selectedCharityOrgIds.indexOf(charityOrganizationId);
                    if (index !== -1) {
                        selectedCharityOrgIds.splice(index, 1); // Remove the selected charity organization ID from the list
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
                    deleteCharityOrg.classList.remove('d-none');
                } else {
                    deleteCharityOrg.classList.add('d-none');
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
                    const charityOrganizationId = item.value;
                    handleCheckboxChange(charityOrganizationId);
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
            async function updateCharityOrg(charityOrganizationId) {
                const inputOptions = new Promise((resolve) => {
                    setTimeout(() => {
                        resolve({
                            "Active": "Active",
                            "Warning": "Warning",
                            "Block": "Block"
                        });
                    }, 0);
                });

                const {value: choice} = await Swal.fire({
                    title: "Do you want to update the charity organization's status?",
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
                    Swal.fire({
                        text: `You selected: ` + choice,
                        showCancelButton: true,
                        cancelButtonColor: "#d33"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url: "charityorgmanagement?action=updatecharityorg&charityOrganizationId=" + charityOrganizationId + "&userStatus=" + choice,
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

            function deleteCharityOrgSelected(charityOrganizationId) {
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
                            url: "charityorgmanagement?action=deletecharityorgselected&charityOrganizationId=" + charityOrganizationId,
                            type: "POST",
                            success: function (response) {
                                // Check the response from the server
                                console.log(response);
                                console.log(response === "success");
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The charity organization has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        // Reload the page
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the charity organization.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                // Handle the error
                                console.log(error);
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the charity organization.",
                                    icon: "error"
                                });
                            }
                        });
                    }
                });
            }

            function removeCharityOrg(charityOrganizationId) {
                console.log(charityOrganizationId);
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
                            url: "charityorgmanagement?action=deletecharityorg&charityOrganizationId=" + charityOrganizationId,
                            type: "POST",
                            success: function (response) {
                                // Check the response from the server
                                console.log(response);
                                console.log(response === "success");
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The charity organization has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        // Reload the page
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the charity organization.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                // Handle the error
                                console.log(error);
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the charity organization.",
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
