<%-- 
    Document   : changepassword
    Created on : Feb 2, 2024, 9:53:05 PM
    Author     : OS
--%>

<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Create Project</title>
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
        <c:if test="${!sessionScope.warning.equalsIgnoreCase('') && sessionScope.warning != null}">
            <p class="text-bg-warning m-0 p-2">
                ${sessionScope.warning}
            </p>
        </c:if>
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
        <div class="container mt-5" style="max-width: 1200px">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header" style="text-align: center"><h3>Create Project</h3></div>
                        <div class="card-body">
                            <form action="createproject" method="post" enctype="multipart/form-data">
                                <% CategoryDAO categoryDAO = new CategoryDAO();
                                    List<Category> categoriesList = categoryDAO.getAllCategories();
                                    pageContext.setAttribute("categoriesList", categoriesList);
                                %>
                                <div class="form-group">
                                    <label for="categories">Categories:</label>
                                    <br>
                                    <c:forEach var="category" items="${categoriesList}">
                                        <div class="form-check form-check-inline">
                                            <input type="checkbox" class="form-check-input" id="category_${category.categoryId}" name="categories" value="${category.categoryId}" >
                                            <label class="form-check-label" for="category_${category.categoryId}">${category.categoryName}</label>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="form-group">
                                    <label for="charityOrganizationId">Charity Organization(If have):</label>
                                    <input type="text" class="form-control" id="charityOrganizationName" name="charityOrganizationName">
                                </div>
                                <div class="form-group">
                                    <label for="projectName">Project Name:</label>
                                    <input type="text" class="form-control" id="projectName" name="projectName" required>
                                </div>
                                <div class="form-group">
                                    <label for="projectTarget">Project Target:</label>
                                    <input type="number" class="form-control" id="projectTarget" name="projectTarget" required>
                                </div>
                                <div class="form-group">
                                    <label for="projectImage">Project Image:</label>
                                    <input type="file" class="form-control" id="projectImage1" name="projectImage1" required>
                                    <input type="file" class="form-control" id="projectImage2" name="projectImage2" required>
                                    <input type="file" class="form-control" id="projectImage3" name="projectImage3" required>
                                    <input type="file" class="form-control" id="projectImage4" name="projectImage4" required>
                                </div>
                                <div class="form-group">
                                    <label for="projectDescription">Project Description:</label>
                                    <textarea class="form-control" id="projectDescription" name="projectDescription" rows="3" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="startDate">Start Date:</label>
                                    <input type="date" class="form-control" id="startDate" name="startDate" required>
                                </div>
                                <div class="form-group">
                                    <label for="endDate">End Date:</label>
                                    <input type="date" class="form-control" id="endDate" name="endDate" required>
                                </div>


                                <!-- Các ô mốc quà và mô tả -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward1">Reward 1:</label>
                                            <input type="text" class="form-control" id="reward1" name="reward1">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward1Description">Reward 1 Description:</label>
                                            <textarea class="form-control" id="reward1Description" name="reward1Description" rows="2"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward2">Reward 2:</label>
                                            <input type="text" class="form-control" id="reward2" name="reward2">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward2Description">Reward 2 Description:</label>
                                            <textarea class="form-control" id="reward2Description" name="reward2Description" rows="2"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward3">Reward 3:</label>
                                            <input type="text" class="form-control" id="reward3" name="reward3">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward3Description">Reward 3 Description:</label>
                                            <textarea class="form-control" id="reward3Description" name="reward3Description" rows="2"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward4">Reward 4:</label>
                                            <input type="text" class="form-control" id="reward4" name="reward4">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="reward4Description">Reward 4 Description:</label>
                                            <textarea class="form-control" id="reward4Description" name="reward4Description" rows="2"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <!-- Kết thúc các ô mốc quà và mô tả -->

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
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
