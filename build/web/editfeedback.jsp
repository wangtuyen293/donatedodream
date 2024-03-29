<%-- 
    Document   : changepassword
    Created on : Feb 2, 2024, 9:53:05 PM
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
        <title>Change Password</title>
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
            .rating {
                display: inline-block;
                unicode-bidi: bidi-override;
                direction: rtl;
            }

            .rating input {
                display: none;
            }

            .rating label {
                float: right;
                color: #aaa;
                font-size: 1.5rem;
                padding: 0;
                cursor: pointer;
            }

            .rating label:before {
                content: '\2605';
                padding: 5px;
                font-size: 2rem;
            }

            .rating input:checked ~ label,
            .rating input:checked ~ label ~ label {
                color: #f8d61c;
            }

            .rating:not(:checked) > label:hover,
            .rating:not(:checked) > label:hover ~ label {
                color: #f8d61c;
            }

            .rating input:checked + label:hover,
            .rating input:checked + label:hover ~ label,
            .rating input:checked ~ label:hover ~ label,
            .rating input:checked ~ label:hover ~ label:hover {
                color: #f8d61c;
            }

            .rating label:hover:before,
            .rating label:hover ~ label:before,
            .rating input:checked:hover ~ label:before,
            .rating input:checked:hover ~ label ~ label:before,
            .rating input:checked ~ label:hover ~ label:before,
            .rating input:checked ~ label:hover ~ label:hover:before {
                content: '\2605';
                color: #f8d61c;
            }

            .rating input:checked + label:hover:before,
            .rating input:checked + label:hover ~ label:before,
            .rating input:checked ~ label:hover ~ label:before,
            .rating input:checked ~ label:hover ~ label:hover:before {
                content: '\2605';
                color: #f8d61c;
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
        <h2>Edit Feedback</h2>
        <form action="editfeedback" method="post">
            <div>
                <input type="hidden" id="projectId" name="projectId" value="${project.projectId}">
            </div>
            <div class="mb-3">
                <label for="rating">Rating:</label>
                <div class="rating">
                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 stars"></label>
                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 stars"></label>
                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 stars"></label>
                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 stars"></label>
                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 star"></label>
                </div>
            </div>
            <div class="mb-3">
                <label for="comment">Comment:</label>
                <textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

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
