<%-- 
    Document   : projectdetail
    Created on : Mar 4, 2024, 12:59:43 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Project" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Project Detail</title>
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

        <div class="project-detail">
            <div class="bg-body-tertiary py-5">
                <div class="container">
                    <div class="row">
                        <c:if test="${not empty project.projectImage}">
                            <div class="col-6 text-center">
                                <c:set var="contextPath" value="${pageContext.request.contextPath}" />
                                <c:set var="fullProjectPath" value="${contextPath}/${project.projectImage}" />
                                <img src="${fullProjectPath}" class="img-fluid" alt="project" style="width: 100%; height: 390px;">
                            </div>
                        </c:if>

                        <div class="col-6">
                            <div class="mb-2">
                                <span class="text-secondary">
                                    ${project.getCategory().getCategoryName()}
                                </span>
                            </div>

                            <h1 class="mb-2">
                                ${project.projectName}
                            </h1>

                            <div class="user-infor mb-5">
                                <img class="rounded-circle" src="./assets/img/avatar/user.png" height="40" width="40">
                                <span>
                                    <a href="user?userId=${project.getUser().getUserId()}" class="text-decoration-none link-dark">
                                        ${project.getUser().getFullName()}
                                    </a>
                                </span>
                            </div>

                            <div class="d-flex justify-content-between mb-3">
                                <span class="donated-people">
                                    <i class="fa-solid fa-hand-holding-heart"></i>
                                    5 Donator
                                </span>
                                <span class="feedback-count">
                                    <i class="fa-regular fa-star"></i>
                                    0 Feedback
                                </span>
                            </div>

                            <div class=" d-flex justify-content-between">
                                <span class="card-text text-dark m-0">${project.projectTarget} ₫ Goal</span>
                                <span class="card-text text-dark m-0">${project.donatedAmountOfMoney} ₫ Supported</span>
                            </div>
                            <div class="progress mt-2 mb-2" role="progressbar" aria-label="progressLabel" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                <div class="progress-bar bg-danger" style="width: ${project.donatedAmountOfMoney * 100 / project.projectTarget}%">
                                    ${project.donatedAmountOfMoney * 100 / project.projectTarget}%
                                </div>
                            </div>

                            <div class="pt-2 border-top d-flex justify-content-between mb-2">
                                <div class="countdown-day">
                                    <span id="countdown">
                                    </span>
                                </div>
                                <div>
                                    <span>${project.donatedAmountOfMoney * 100 / project.projectTarget}% Success</span>
                                </div>
                            </div>

                            <div>
                                <a href="#" class="btn btn-primary" role="button">
                                    Donate
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container py-2">
                <ul class="nav">
                    <li class="nav-item">
                        <a id="detailLink" class="nav-link border-bottom border-2 border-primary active" href="#">Detail</a>
                    </li>
                    <li class="nav-item">
                        <a id="feedbackLink" class="nav-link" href="#">Feedback</a>
                    </li>
                    <li class="nav-item">
                        <a id="updateHistoryLink" class="nav-link" href="#">Update History</a>
                    </li>
                </ul>
            </div>

            <div class="detail bg-body-tertiary">
                <div class="container py-5">
                    <div class="tab-pane active" id="1">
                        <div class="panel-group" id="accordionMenu" role="tablist" aria-multiselectable="true">
                            ${project.projectDescription}
                        </div>
                    </div>
                </div> 
            </div>


            <div class="feedback container py-5 d-none">
                <div class="tab-pane" id="2">
                    <div class="panel-group" id="accordionMenu2" role="tablist" aria-multiselectable="true">

                        <c:forEach var="productReview" items="${requestScope.projectReviews}">
                            <div class="sin-rattings mb-4">
                                <div class="star-author-all mb-2 clearfix">
                                    <div class="ratting-author float-start">
                                        <h5 class="float-start me-3">${productReview.user.fullName}</h5>
                                        Nội dung:
                                        <h5 class="float-start me-3">${productReview.content}</h5>
                                        <span>
                                            <fmt:parseDate value="${productReview.realTime}"
                                                           pattern="yyyy-MM-dd'T'HH:mm" var="parsedCreatedAt"
                                                           type="both"/>
                                            <fmt:formatDate pattern="HH:mm dd/MM/yyyy " value="${parsedCreatedAt}"/>
                                        </span>
                                    </div>
                                </div>

                                <c:if test="${productReview.userId == sessionScope.currentUser.userId}">
                                    <form action="${pageContext.request.contextPath}/deleteReview" method="post">
                                        <input type="hidden" name="projectReviewId" value="${productReview.commentId}">
                                        <input type="hidden" name="projectId" value="${requestScope.product.projectId}">
                                        <div class="btn-group" role="group">
                                            <a href="${pageContext.request.contextPath}/updateReview?id=${productReview.commentId}"
                                               role="button"
                                               class="btn btn-primary btn-sm">
                                                Sửa
                                            </a>
                                            <button type="submit" class="btn btn-danger btn-sm"
                                                    onclick="return confirm('Bạn có muốn xóa?')">Xóa
                                            </button>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </c:forEach>
                        <form action="${pageContext.request.contextPath}/addReview" method="post">
                            <div class="form-group row mb-3">
                                <div class="col">
                                    <textarea class="form-control ${not empty sessionScope.violations.contentViolations
                                                                    ? 'is-invalid' : (not empty sessionScope.values.content ? 'is-valid' : '')}"
                                              name="content"
                                              placeholder="Nội dung đánh giá"
                                              rows="3">${sessionScope.values.content}</textarea>
                                    <c:if test="${not empty sessionScope.violations.contentViolations}">
                                        <div class="invalid-feedback">
                                            <ul class="list-unstyled mb-0">
                                                <c:forEach var="violation"
                                                           items="${sessionScope.violations.contentViolations}">
                                                    <li>${violation}</li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <input type="hidden" name="userId" value="${sessionScope.currentUser.userId}">
                            <input type="hidden" name="projectId" value="${requestScope.product.projectId}">
                            <button type="submit" class="btn btn-primary">Send Feedback</button>
                        </form>
                        <c:remove var="values" scope="session"/>
                        <c:remove var="violations" scope="session"/>
                        <c:remove var="successMessage" scope="session"/>
                        <c:remove var="errorAddReviewMessage" scope="session"/>
                        <c:remove var="errorDeleteReviewMessage" scope="session"/>
                    </div>
                </div>
            </div>

            <div class="update-history container py-5 d-none">

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
                                                        var countdownElement = document.getElementById('countdown');
                                                        var endDate = new Date("${project.endDate}");
                                                        var currentDate = new Date();
                                                        var remainingMillis = endDate.getTime() - currentDate.getTime();
                                                        var remainingDays = Math.floor(remainingMillis / (1000 * 60 * 60 * 24));

                                                        countdownElement.textContent = remainingDays + ' days left';
        </script>
        <script>
            const detailLink = document.getElementById('detailLink');
            const feedbackLink = document.getElementById('feedbackLink');
            const updateHistoryLink = document.getElementById('updateHistoryLink');
            const detail = document.querySelector('.detail');
            const feedback = document.querySelector('.feedback');
            const updateHistory = document.querySelector('.update-history');

            detailLink.addEventListener('click', function () {
                detailLink.classList.add('border-bottom');
                detailLink.classList.add('border-2');
                detailLink.classList.add('border-primary');
                detailLink.classList.add('active');
                feedbackLink.classList.remove('border-bottom');
                feedbackLink.classList.remove('border-2');
                feedbackLink.classList.remove('border-primary');
                feedbackLink.classList.remove('active');
                updateHistoryLink.classList.remove('border-bottom');
                updateHistoryLink.classList.remove('border-2');
                updateHistoryLink.classList.remove('border-primary');
                updateHistoryLink.classList.remove('active');
                detail.classList.remove('d-none');
                feedback.classList.add('d-none');
                updateHistory.classList.add('d-none');
            });

            feedbackLink.addEventListener('click', function () {
                feedbackLink.classList.add('border-bottom');
                feedbackLink.classList.add('border-2');
                feedbackLink.classList.add('border-primary');
                feedbackLink.classList.add('active');
                detailLink.classList.remove('border-bottom');
                detailLink.classList.remove('border-2');
                detailLink.classList.remove('border-primary');
                detailLink.classList.remove('active');
                updateHistoryLink.classList.remove('border-bottom');
                updateHistoryLink.classList.remove('border-2');
                updateHistoryLink.classList.remove('border-primary');
                updateHistoryLink.classList.remove('active');
                feedback.classList.remove('d-none');
                detail.classList.add('d-none');
                updateHistory.classList.add('d-none');
            });

            updateHistoryLink.addEventListener('click', function () {
                updateHistoryLink.classList.add('border-bottom');
                updateHistoryLink.classList.add('border-2');
                updateHistoryLink.classList.add('border-primary');
                updateHistoryLink.classList.add('active');
                feedbackLink.classList.remove('border-bottom');
                feedbackLink.classList.remove('border-2');
                feedbackLink.classList.remove('border-primary');
                feedbackLink.classList.remove('active');
                detailLink.classList.remove('border-bottom');
                detailLink.classList.remove('border-2');
                detailLink.classList.remove('border-primary');
                detailLink.classList.remove('active');
                updateHistory.classList.remove('d-none');
                feedback.classList.add('d-none');
                detail.classList.add('d-none');
            });
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
