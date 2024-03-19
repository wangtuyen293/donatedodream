<%-- 
    Document   : contact
    Created on : Feb 23, 2024, 3:27:00 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Donate Do Dreaming</title>
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
        <c:if test="${!sessionScope.warning.equalsIgnoreCase('') && sessionScope.warning != null}">
            <p class="text-bg-warning m-0 p-2">
                ${sessionScope.warning}
            </p>
        </c:if>
        <div class="contact">
            <div class="main-title bg-body-tertiary py-5">
                <h1 class="text-center fw-medium mt-5">
                    Contact
                </h1>
            </div>

            <div class="main-content container">
                <div class="contact-wrapper row py-5">
                    <div class="contact-info col-6">
                        <div>
                            <h4>
                                donationdodreaming@gmail.com
                            </h4>
                        </div>
                        <div>
                            <p>
                                Phone: +123 456 789
                            </p>
                        </div>
                    </div>
                    <div class="col-6">
                        <form class="contact-form" action="#">
                            <div class="mb-3">
                                <label for="fullName" class="form-label fw-bold">
                                    Full Name
                                    <span class="text-danger">*</span>
                                </label>
                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Full Name" required>
                            </div>
                            <div class="mb-3 row">
                                <div class="col-6">
                                    <label for="email" class="form-label fw-bold">
                                        Email
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                                </div>
                                <div class="col-6">
                                    <label for="subject" class="form-label fw-bold">
                                        Subject
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="message" class="form-label fw-bold">
                                    Message
                                    <span class="text-danger">*</span>
                                </label>
                                <textarea class="form-control" id="message" name="message" placeholder="Message" required></textarea>
                            </div>
                            <div class="mb-3">
                                <button id="btn-send" class="btn btn-primary" type="submit">
                                    Send
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="contact-map">

                </div>
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
        <!-- ==================== SMTPJS ==================== -->
        <script src="https://smtpjs.com/v3/smtp.js"></script>
        <!-- ====================SWEET ALERT 2 ==================== -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            // Send Email From Contact Form
            const form = document.querySelector('.contact-form')
            const fullName = document.getElementById('fullName')
            const email = document.getElementById('email')
            const subject = document.getElementById('subject')
            const mess = document.getElementById('message')

            function sendEmail() {
                const bodyMessage = `Full Name: ${fullName.value}<br> Email: ${email.value}<br> Message: ${mess.value}`

                Email.send({
                    SecureToken: "16646ac4-0a86-461a-b4fe-b42c62e8f2ac",
                    Host: "smtp.elasticemail.com",
                    Username: "dangkhoado43@gmail.com",
                    Password: "4E78CAFE72A98B4EF75EE17CF8876766E412",
                    To: 'dangkhoado43@gmail.com',
                    From: "dangkhoado43@gmail.com",
                    Subject: subject.value,
                    Body: bodyMessage
                }).then(
                        message => {
                            if (message === "OK") {
                                Swal.fire({
                                    title: "Success!",
                                    text: "Message sent successfully!",
                                    icon: "success"
                                });
                            }
                        }
                );
            }

            function checkInputs() {
                const items = document.querySelectorAll('.item')

                for (const item of items) {
                    if (item.value === "") {
                        item.classList.add("error")
                        item.parentElement.classList.add("error")
                    }

                    if (items[1].value !== "") {
                        checkEmail()
                    }

                    items[1].addEventListener("keyup", () => {
                        checkEmail()
                    })

                    item.addEventListener("keyup", () => {
                        if (item.value !== "") {
                            item.classList.remove("error")
                            item.parentElement.classList.remove("error")
                        } else {
                            item.classList.add("error")
                            item.parentElement.classList.add("error")
                        }
                    })
                }
            }

            function checkEmail() {
                const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
                const errorTxtEmail = document.querySelector(".error-txt.email")

                if (!email.value.match(emailRegex)) {
                    email.classList.add("error")
                    email.parentElement.classList.add("error")

                    if (email.value !== "") {
                        errorTxtEmail.innerText = "Enter a valid email address"
                    } else {
                        errorTxtEmail.innerText = "Email Address can't be blank"
                    }
                } else {
                    email.classList.remove("error")
                    email.parentElement.classList.remove("error")
                }
            }

            form.addEventListener("submit", (e) => {
                e.preventDefault()
                checkInputs()

                if (!fullName.classList.contains("error") && !email.classList.contains("error") && !subject.classList.contains("error") && !mess.classList.contains("error")) {
                    sendEmail()
                }

                form.reset()
                return false
            })
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
