<%-- 
    Document   : category
    Created on : Jan 21, 2024, 2:23:39 PM
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
        <title>Category Management</title>
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
        <div class="category-management container-fluid bg-secondary-subtle show active">
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
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js active">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
                                    <i class="fa-regular fa-file"></i>
                                    <span class="ps-2">Categories</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="container col-10 pt-3 pb-5 bg-secondary-subtle">

                    <h3 class="main-title fw-bold ms-3">
                        <a class="link-dark text-decoration-none" href="#">
                            Manage categories
                        </a>
                    </h3>
                    <p class="ms-3 text-dark">
                        <span>Manage categories and create new for necessary</span>
                    </p>
                    <div id="clock" class="ms-3 my-2"></div>

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
                    <div class="row ms-1">
                        <form action="categorymanagement?updatecategory" method="POST">
                            <table class="table table-hover table-bordered" id="categorymanager">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" class="select-all" id="select-all-category"/>
                                            Category
                                        </th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${categoryList}" var="category">
                                        <tr>
                                            <td class="checkbox-category">
                                                <input type="checkbox" class="category_${category.categoryId}" value="${category.categoryId}"/>
                                                ${category.categoryName}
                                            </td>
                                            <td>
                                                <button type="button" class="btn btn-primary btn-sm trash" title="Remove" onclick="removeCategory(${category.categoryId})">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                                <button type="button" class="btn btn-primary btn-sm edit" title="Edit" onclick="openEditModal(${category.categoryId}, '${category.categoryName}'); $('#updateCategoryModal').modal('show');">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <button type="button" id="remove" class="btn btn-danger delete-category d-none" title="Delete" onclick="deleteCategorySelected(selectedCategoryIds)">
                                DELETE
                            </button>
                            <button type="button" id="create" class="btn btn-success create-category" title="Create" data-bs-toggle="modal" data-bs-target="#createCategory">
                                CREATE
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="create-category modal fade" id="createCategory" tabindex="-1" aria-labelledby="createCategoryLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 fw-bold" id="createCategoryLabel">Create Category</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="createCategoryForm" action="categorymanagement?action=insertcategory" method="post">
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="name" class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="name" name="categoryName" placeholder="Category Name..." required>
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

        <div class="update-category modal fade" id="updateCategoryModal" tabindex="-1" aria-labelledby="updateCategoryLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5 fw-bold" id="updateCategoryLabel">Update Category</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="updateCategoryForm" action="categorymanagement?action=updatecategory" method="post">
                        <div class="modal-body">
                            <input type="hidden" id="editCategoryId" name="categoryId"/>
                            <div class="mb-3">
                                <label for="editCategoryName" class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="editCategoryName" name="categoryName" required>
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
            const selectAll = document.querySelector('#select-all-category');
            const allCheckbox = document.querySelectorAll('.checkbox-category input');
            const deleteCategory = document.querySelector('.delete-category');
            let listBoolean = [];
            let selectedCategoryIds = [];

            function handleCheckboxChange(categoryId) {
                const checkbox = document.querySelector(`.category_` + categoryId);

                if (checkbox.checked) {
                    if (!selectedCategoryIds.includes(categoryId)) {
                        selectedCategoryIds.push(categoryId); // Add the selected category ID to the list if it doesn't already exist
                    }
                } else {
                    const index = selectedCategoryIds.indexOf(categoryId);
                    if (index !== -1) {
                        selectedCategoryIds.splice(index, 1); // Remove the selected category ID from the list
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
                    deleteCategory.classList.remove('d-none');
                } else {
                    deleteCategory.classList.add('d-none');
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
                    const categoryId = item.value;
                    handleCheckboxChange(categoryId);
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
            // Prevent event default submit of form
            document.getElementById('createCategoryForm').addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                }
            });
            document.getElementById('updateCategoryForm').addEventListener('keydown', function (event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                }
            });
        </script>
        <script>
            function openEditModal(categoryId, categoryName) {
                event.preventDefault();
                document.getElementById('editCategoryId').value = categoryId;
                document.getElementById('editCategoryName').value = categoryName;

                // Show the modal
                $('#updateCategory').modal('show');
            }

            function deleteCategorySelected(categoryId) {
                event.preventDefault();
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
                            url: "categorymanagement?action=deletecategoryselected&categoryId=" + categoryId,
                            type: "POST",
                            success: function (response) {
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The category has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the category.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the category.",
                                    icon: "error"
                                });
                            }
                        });
                    }
                });
            }

            function removeCategory(categoryId) {
                event.preventDefault();
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
                            url: "categorymanagement?action=deletecategory&categoryId=" + categoryId,
                            type: "POST",
                            success: function (response) {
                                if (response === "success") {
                                    Swal.fire({
                                        title: "Deleted!",
                                        text: "The category has been deleted.",
                                        icon: "success"
                                    }).then(() => {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        title: "Error!",
                                        text: "Failed to delete the category.",
                                        icon: "error"
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                Swal.fire({
                                    title: "Error!",
                                    text: "An error occurred while deleting the category.",
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
