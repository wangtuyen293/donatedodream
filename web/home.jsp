<%-- 
    Document   : home
    Created on : Feb 2, 2024, 10:30:39 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Trang chủ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
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
        <main>
            <div class="slider-area ">
                <div class="slider-active">

                    <div class="single-slider slider-height d-flex align-items-center slide-bg">
                        <div class="container">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                                    <div class="hero__caption">
                                        <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">Nền tảng kêu gọi quỹ cộng đồng</h1>
                                        <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">Những dự án và quỹ từ thiện cần được xã hội chung tay.</p>

                                        <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s"
                                             data-duration="2000ms">
                                            <a href="project" class="btn hero-btn fw-bold btn-light">Ủng hộ ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-none d-sm-block">
                                    <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                        <img src="assets/img/hero/dona.png" alt="Underprivileged Children" class="heartbeat">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="single-slider slider-height d-flex align-items-center slide-bg">
                        <div class="container">
                            <div class="row justify-content-between align-items-center">
                                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                                    <div class="hero__caption">
                                        <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">Quỹ từ thiện</h1>
                                        <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">
                                            Khi Bạn Cho Đi, Bạn Không Mất. Thay vào đó, bạn còn đạt được nhiều hơn nữa. Bởi vì Lòng trắc ẩn bên trong biết rằng bạn đã góp phần tạo nên sự khác biệt tốt đẹp trong cuộc sống của người khác. 
                                        </p>

                                        <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s"
                                             data-duration="2000ms">
                                            <a href="project" class="btn hero-btn fw-bold btn-light">Ủng hộ ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-none d-sm-block">
                                    <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                        <img src="assets/img/hero/remotechild.jpg" alt="Underprivileged Children" class="heartbeat" style="width: 28rem;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>         
            <div class="watch-area section-padding30">
                <div class="container">
                    <div class="row align-items-center justify-content-between padding-130">
                        <div class="col-lg-5 col-md-6">
                            <div class="watch-details mb-40">
                                <h2>Từ thiện cộng đồng</h2>
                                <p>Trong mỗi hành động thiện nguyện, chúng ta đang chứng tỏ sự nhân ái và lòng tử tế của con người. 
                                    Những lời chia sẻ, nụ cười, và sự quan tâm chân thành không chỉ làm thay đổi cuộc sống của những người khác, mà còn lan tỏa năng lượng tích cực và hy vọng trong xã hội. 
                                    Khi ta góp phần vào công việc thiện nguyện, ta không chỉ đem lại những lợi ích vật chất mà còn làm thay đổi sâu sắc trong tâm hồn của chính mình. 
                                    Từ những trải nghiệm này, ta học cách trân trọng những điều nhỏ bé trong cuộc sống, nhận ra sự quan trọng của sự nhân ái và lòng biết ơn.</p>
                                <a href="shop.html" class="btn view-btn1 hero-btn fw-bold">View More</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-10">
                            <div class="choice-watch-img mb-40">
                                <img src="assets/img/charity/lam-tu-thien.jpg" alt>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
