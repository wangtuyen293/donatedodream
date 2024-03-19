<%-- 
    Document   : footer
    Created on : Mar 19, 2024, 4:53:35 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="footer container-fluid bg-body-secondary pt-5">
    <footer class="mx-5 pt-5">
        <div class="row">
            <div class="col-6 mb-3">
                <h2 class="fw-bold mb-2">DonationDoDreaming</h2>
                <form>
                    <h5>Liên hệ hỏi đáp và tra cứu thông tin mới:</h5>
                    <div class="row">
                        <div class="col-8 p-0 ps-2">
                            <input id="newsletter1" type="text" class="form-control rounded-0" placeholder="Email address (required)">
                        </div>
                        <div class="col-2 p-0">
                            <button class="btn btn-primary rounded-0" type="button">Đăng ký</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-3 mb-3">
                <h5>Dự án</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="project" class="nav-link p-0 text-muted">Tất cả dự án</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">Tạo dự án</a></li>
                </ul>
            </div>
            <div class="col-3 mb-3">
                <h5>Thông tin trang web</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="home" class="nav-link p-0 text-muted">Trang chủ</a></li>
                    <li class="nav-item mb-2"><a href="contact.jsp" class="nav-link p-0 text-muted">Liên hệ</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">FAQs</a></li>
                </ul>
            </div>

        </div>

        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 border-top border-secondary-subtle">
            <p>&copy; 2024 
                <a href="#" class="text-decoration-none link-dark fw-bold">DonationDoDreaming.</a>
                All rights reserved.
            </p>
            <ul class="list-unstyled d-flex">
                <li class="ps-3">
                    <a class="link-dark" href="#">
                        <i class="fab fa-facebook"></i>
                    </a>
                </li>
                <li class="ps-3">
                    <a class="link-dark" href="#">
                        <i class="fab fa-google"></i>
                    </a>
                </li>
                <li class="ps-3">
                    <a class="link-dark" href="#">
                        <svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg>
                    </a>
                </li>
            </ul>
        </div>
    </footer>
</div>
