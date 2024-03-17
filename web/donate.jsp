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
        </style>
    </head>
    <body>
        <jsp:include page="layout/header.jsp" />
        <div class="container mt-5 mx-auto">
            <h3 class="card-title text-center mb-4 bg-primary text-white p-2">Thông tin khách hàng</h3>
            <div class="card-body bg-light p-4"> <!-- Add a background color and padding to the card-body -->
                <form action="donation" method="post"> <!-- Add your desired action URL -->                  
                    <div class="form-group">
                        <label for="fullName">Họ và tên *</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" value="${sessionScope.user.fullName}" required>
                    </div>

                    <div class="form-group">
                        <input type="hidden" class="form-control" id="projectId" name="projectId" value="${projectId}" required>
                    </div>
                    <div class="form-group">
                        <input type="hidden" class="form-control" id="pmid" name="pmid" value="${pmid}" required>
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">Số điện thoại *</label>
                        <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="${sessionScope.user.phoneNumber}" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Địa chỉ email *</label>
                        <input type="email" class="form-control" id="email" name ="email" value="${sessionScope.user.email}" required>
                    </div>

                    <div class="form-group">
                        <label for="district">Địa chỉ cụ thể</label>
                        <input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="Nhập địa chỉ cụ thể" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Số tiền *</label>
                        <input type="number" class="form-control" id="amount" name ="amount" required>
                    </div>

                    <input type="hidden" id="donationDate" name="date" required>

                    <div class="row mt-3 justify-content-center">
                        <button type="submit" style="max-width: 150px" class="btn btn-primary">Đặt hàng</button>
                    </div>
                </form>
            </div>
        </div>

        <jsp:include page="layout/footer.jsp" />
        <script>
            // Tự động set giá trị ngày hiện tại
            document.getElementById('donationDate').value = getCurrentDate();

            function getCurrentDate() {
                var currentDate = new Date();
                var year = currentDate.getFullYear();
                var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // Thêm số 0 đằng trước nếu tháng < 10
                var day = ('0' + currentDate.getDate()).slice(-2); // Thêm số 0 đằng trước nếu ngày < 10
                return year + '-' + month + '-' + day;
            }
        </script>
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
