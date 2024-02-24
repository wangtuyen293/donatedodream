<%-- 
    Document   : home
    Created on : Jan 13, 2024, 3:57:22 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="layout/header.jsp" />
<main>
    <div class="slider-area ">
        <div class="slider-active">

            <div class="single-slider slider-height d-flex align-items-center slide-bg">
                <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
                            <div class="hero__caption">
                                <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">Quyên góp cho những dự án cộng đồng</h1>
                                <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">Vì một cộng đồng chung tay cùng phát triển, vì những người có hoàn cảnh khó khăn có được cuộc sống tốt đẹp hơn.</p>

                                <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s"
                                     data-duration="2000ms">
                                    <a href="industries.html" class="btn hero-btn">Donate now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-none d-sm-block">
                            <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                <img src="assets/img/hero/dona.png" alt class=" heartbeat">
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
                                <h1 data-animation="fadeInLeft" data-delay=".4s" data-duration="2000ms">Tham gia quyên góp cho các chiến dịch từ thiện</h1>
                                <p data-animation="fadeInLeft" data-delay=".7s" data-duration="2000ms">Khi bạn cho đi, bạn không mất đi. Thay vào đó, bạn nhận lại nhiều hơn. 
                                    Bởi vì lòng trắc ẩn biết rằng bạn đã làm nên điều tốt đẹp cho người khác. 
                                </p>

                                <div class="hero__btn" data-animation="fadeInLeft" data-delay=".8s"
                                     data-duration="2000ms">
                                    <a href="industries.html" class="btn hero-btn">Donate Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-4 d-none d-sm-block">
                            <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                <img src="assets/img/hero/tre.jpeg" alt class=" heartbeat">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section class="new-product-area section-padding30">
        <div class="container">

            <div class="row">
                <div class="col-xl-12">
                    <div class="section-tittle mb-70">
                        <h2>Những dự án nổi bật</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-new-pro mb-30 text-center">
                        <div class="product-img">
                            <img src="assets/img/gallery/new_product1.png" alt>
                        </div>
                        <div class="product-caption">
                            <h3><a href="product_details.html">Project 1</a></h3>
                            <div id="progress-container">
                                <progress id="my-progress" value="75" max="100"></progress>
                            </div>
                            <h4> Tiến trình dự án: </h4>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-new-pro mb-30 text-center">
                        <div class="product-img">
                            <img src="assets/img/gallery/new_product2.png" alt>
                        </div>
                        <div class="product-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <div id="progress-container">
                                <progress id="my-progress" value="75" max="100"></progress>
                            </div>
                            <h4> Tiến trình dự án: </h4>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-new-pro mb-30 text-center">
                        <div class="product-img">
                            <img src="assets/img/gallery/new_product3.png" alt>
                        </div>
                        <div class="product-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <div id="progress-container">
                                <progress id="my-progress" value="75" max="100"></progress>
                            </div>
                            <h4> Tiến trình dự án: </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <div class="gallery-area">
        <div class="container-fluid p-0 fix">
            <div class="row">
                <div class="col-xl-6 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-gallery mb-30">
                        <div class="gallery-img big-img"
                             style="background-image: url(assets/img/gallery/gallery1.png);"></div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-gallery mb-30">
                        <div class="gallery-img big-img"
                             style="background-image: url(assets/img/gallery/gallery2.png);"></div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-4 col-md-12">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-6 col-sm-6">
                            <div class="single-gallery mb-30">
                                <div class="gallery-img small-img"
                                     style="background-image: url(assets/img/gallery/gallery3.png);"></div>
                            </div>
                        </div>
                        <div class="col-xl-12 col-lg-12  col-md-6 col-sm-6">
                            <div class="single-gallery mb-30">
                                <div class="gallery-img small-img"
                                     style="background-image: url(assets/img/gallery/gallery4.png);"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="popular-items section-padding30">
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-10">
                    <div class="section-tittle mb-70 text-center">
                        <h2>Những dự án tiềm năng</h2>
                        <p>Tiềm năng khám phá con người là vô hạn, và quỹ cộng đồng như một bước đệm giúp những ước mơ bay xa.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-popular-items mb-50 text-center">
                        <div class="popular-img">
                            <img src="assets/img/gallery/popular1.png" alt>
                            <div class="img-cap">
                                <span>Donate</span>
                            </div>
                            <div class="favorit-items">
                                <span class="flaticon-heart"></span>
                            </div>
                        </div>
                        <div class="popular-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <span>$ 45,743</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-popular-items mb-50 text-center">
                        <div class="popular-img">
                            <img src="assets/img/gallery/popular2.png" alt>
                            <div class="img-cap">
                                <span>Donate</span>
                            </div>
                            <div class="favorit-items">
                                <span class="flaticon-heart"></span>
                            </div>
                        </div>
                        <div class="popular-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <span>$ 45,743</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-popular-items mb-50 text-center">
                        <div class="popular-img">
                            <img src="assets/img/gallery/popular3.png" alt>
                            <div class="img-cap">
                                <span>Donate</span>
                            </div>
                            <div class="favorit-items">
                                <span class="flaticon-heart"></span>
                            </div>
                        </div>
                        <div class="popular-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <span>$ 45,743</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-popular-items mb-50 text-center">
                        <div class="popular-img">
                            <img src="assets/img/gallery/popular4.png" alt>
                            <div class="img-cap">
                                <span>Donate</span>
                            </div>
                            <div class="favorit-items">
                                <span class="flaticon-heart"></span>
                            </div>
                        </div>
                        <div class="popular-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <span>$ 45,743</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-popular-items mb-50 text-center">
                        <div class="popular-img">
                            <img src="assets/img/gallery/popular5.png" alt>
                            <div class="img-cap">
                                <span>Donate</span>
                            </div>
                            <div class="favorit-items">
                                <span class="flaticon-heart"></span>
                            </div>
                        </div>
                        <div class="popular-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <span>$ 45,743</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                    <div class="single-popular-items mb-50 text-center">
                        <div class="popular-img">
                            <img src="assets/img/gallery/popular6.png" alt>
                            <div class="img-cap">
                                <span>Donate</span>
                            </div>
                            <div class="favorit-items">
                                <span class="flaticon-heart"></span>
                            </div>
                        </div>
                        <div class="popular-caption">
                            <h3><a href="product_details.html">Thermo Ball Etip Gloves</a></h3>
                            <span>$ 45,743</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="room-btn pt-70">
                    <a href="catagori.html" class="btn view-btn1">Xem thêm dự án</a>
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
                        <a href="shop.html" class="btn">Xem thêm các chiến dịch</a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-10">
                    <div class="choice-watch-img mb-40">
                        <img src="Images/lam-tu-thien.jpg" alt>
                    </div>
                </div>
            </div>

        </div>
    </div>


</main>



<jsp:include page="layout/footer.jsp" />