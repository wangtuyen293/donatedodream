<%-- 
    Document   : privacypolicy
    Created on : Jan 29, 2024, 3:03:02 PM
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
        <title>Privacy Policy Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
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
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="projectmanagement">
                                    <i class="fa-solid fa-list-check"></i>
                                    <span class="ps-2">Project Management</span>
                                </a>
                            </li>
                            <li class="sidebar-content text-white ps-4 py-3 border sidebar-js active">
                                <a class="sidebar-content-link link-dark text-decoration-none" href="#">
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
                <div class="container col-10 pt-3 pb-5 bg-secondary-subtle">
                    <h3 class="main-title fw-bold ms-3">
                        <a class="link-dark text-decoration-none text-uppercase" href="privacypolicy">
                            Privacy policy
                        </a>
                    </h3>
                    <p class="ms-3 text-dark">
                        <span>Manage privacy policy</span>
                    </p>
                    <div id="clock" class="ms-3 my-2"></div>
                    <div class="row mx-4 text-center my-5 bg-white rounded text-dark">
                        <h2 class="privacy_title text-center fw-bold mt-5"> The Donation Do Dreaming Privacy Policy</h2>
                        <p class="privacy_content text-dark pb-3">Hello. We are Donation Do Dreaming Company. Here's a
                            summary of how we protect your data and respect your privacy.</p>
                        <hr class="mx-5"/>
                        <ul class="sidebar_list">
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-1">
                                    1. Our role in your privacy
                                </a>
                                <p class="py-2 text-dark"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                                <h5 class="data-collect__title">Our responsibilities</h5>
                                <p class="text-dark pb-2"> If you are a registered Donation Do Dreaming customer or a visitor to our website we act
                                    as the <a href="#" target="_blank">'data controller'</a> of personal data. This means
                                    we determine how and why your data are processed. We are registered as a
                                    data controller at the World Information Commissioner’s Office under number
                                    <a href="#" target="_blank">123456789.</a>
                                </p>
                                <div>
                                    <h5 class="data-collect__title">Your responsibilities</h5>
                                    <ul class="text-dark">
                                        <li>
                                            1. Read this Privacy Policy
                                        </li>
                                        <li>
                                            2. If you are our customer, please also check the contracts between
                                            us: they may contain further details on how we collect and
                                            process your data.
                                        </li>
                                        <li>
                                            3. If you provide us with personal information about other people,
                                            or if others give us your information, we will only use that
                                            information for the specific reason for which it was provided to
                                            us. By submitting
                                            the information, you confirm that you have the right to
                                            authorise us to process it on your behalf in accordance with
                                            this Privacy Policy.
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-2">
                                    2. When and how do we collect data
                                </a> 
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-3">
                                    3. What types of data we collect
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-4">
                                    4. How and why we collect your data
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-5">
                                    5. Your privacy choices and rights
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-6">
                                    6. How secure is the data we collect?
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-7">
                                    7. Where do we store your data?
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-8">
                                    8. For how long do we store your data?
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-9">
                                    9.  Third parties who process your data
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                            <li class="sidebar_item text-start py-3 mx-4"> 
                                <a href="#" class="sidebar__link js-scroll-to text-decoration-none link-dark fw-bold fs-5" data-anchor="privacy-10">
                                    10. How we use cookies
                                </a>
                                <p class="text-dark mt-2"> 
                                    If you are a donator or founder, or just visiting our website, this
                                    policy applies to you. If you are agreeing a contract through Donation Do Dreaming, you should
                                    check the privacy policy of the Donation Do Dreaming user who sent you
                                    the contract - but we also tell you a bit about how we process your data on
                                    their behalf in the “What about if I’m just signing a contract through Donation Do Dreaming?”
                                    section below.
                                </p>
                            </li>
                        </ul>
                        <div class="mb-5">
                            <button type="button" id="remove" class="btn btn-danger delete-project text-uppercase" title="Delete" onclick="deleteProjectSelected(selectedProjectIds)">
                                Update
                            </button>
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
