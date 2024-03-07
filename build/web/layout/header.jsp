<%-- 
    Document   : header
    Created on : Jan 13, 2024, 3:48:33 PM
    Author     : quang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="${request.contextPath}/project_donator_3/assets/img/logo/dendi2.png" alt="logo">
            </div>
        </div>
    </div>
</div>
<header>
    <div class="header-area">
        <div class="main-header header-sticky">
            <div class="container-fluid">
                <div class="menu-wrapper row">
                    <div class="col-2 logo d-flex justify-content-center align-items-center mb-0">
                        <a href="home">
                            <img src="${request.contextPath}/project_donator_3/assets/img/logo/dendi2.png" style="width: 12rem;" alt="logo">
                        </a>
                    </div>
                    <div class="col-6 main-menu d-none d-lg-block">
                        <nav>
                            <ul id="navigation" class="mb-0">
                                <li><a class="text-decoration-none" href="home">Home</a></li>
                                <li><a class="text-decoration-none" href="buildproject.jsp">Start a project</a></li>
                                <li><a class="text-decoration-none" href="project">Projects</a></li>
                                <li><a class="text-decoration-none" href="contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>

                    <div class="col-4 header-right row">
                        <!--                        <ul class="col-8 d-flex justify-content-center align-items-center mb-0">
                                                    <li>
                                                        <form class="d-flex" role="search">
                                                            <input class="form-control rounded-0 m-0" type="search" placeholder="Search"
                                                                   aria-label="Search"/>
                                                            <button class="btn btn-primary rounded-0" title="" type="submit">
                                                                <i class="fa-solid fa-magnifying-glass"></i>
                                                            </button>
                                                        </form>
                                                    </li>
                                                </ul>-->
                        <c:choose>
                            <c:when test="${sessionScope.user == null && sessionScope.userName == null}">
                                <div class="col-9"></div>

                                <div class="dropdown col-3 d-flex justify-content-center align-items-center">
                                    <c:if test="${sessionScope.user == null && sessionScope.userName == null}">
                                        <a class="dropdown-toggle link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="p-0">ACCOUNT<i class="ion-chevron-down"></i></span></a>
                                            </c:if>
                                            <c:if test="${sessionScope.user != null}">
                                        <a class="dropdown-toggle link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="p-0">Welcome ${sessionScope.user.userName}<i class="ion-chevron-down"></i></span></a>
                                            </c:if>
                                            <c:if test="${sessionScope.userName != null}">
                                        <a class="dropdown-toggle link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="p-0">Welcome ${sessionScope.userName}<i class="ion-chevron-down"></i></span></a>
                                            </c:if>
                                    <ul class="dropdown-menu">
                                        <c:if test="${sessionScope.user != null || sessionScope.userName != null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="profile.jsp">My Profile</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user.userTypeId == 1}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="${request.contextPath}/project_donator_3/dashboard">Dashboard</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user == null && sessionScope.userName == null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="login.jsp"><span>Login</span></a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user == null && sessionScope.userName == null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="signup.jsp"><span>Sign up</span></a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null || sessionScope.userName != null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="logout">Sign out</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="col-6"></div>

                                <div class="notification dropdown dropstart col-3 d-flex justify-content-center align-items-center">
                                    <a class="dropdown-toggle dropdown-toggle-arrow link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fa-regular fa-bell"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>
                                </div>

                                <div class="dropdown col-3 d-flex justify-content-center align-items-center">
                                    <c:if test="${sessionScope.user == null && sessionScope.userName == null}">
                                        <a class="dropdown-toggle link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="p-0">ACCOUNT<i class="ion-chevron-down"></i></span></a>
                                            </c:if>
                                            <c:if test="${sessionScope.user != null}">
                                        <a class="dropdown-toggle link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="p-0">Welcome ${sessionScope.user.userName}<i class="ion-chevron-down"></i></span></a>
                                            </c:if>
                                            <c:if test="${sessionScope.userName != null}">
                                        <a class="dropdown-toggle link-primary text-decoration-none" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span class="p-0">Welcome ${sessionScope.userName}<i class="ion-chevron-down"></i></span></a>
                                            </c:if>
                                    <ul class="dropdown-menu">
                                        <c:if test="${sessionScope.user != null || sessionScope.userName != null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="profile.jsp">My Profile</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user.userTypeId == 1}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="${request.contextPath}/project_donator_3/dashboard">Dashboard</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user == null && sessionScope.userName == null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="login.jsp"><span>Login</span></a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user == null && sessionScope.userName == null}">
                                            <li>
                                                <a class="dropdown-item text-capitalize" href="signup.jsp"><span>Sign up</span></a>
                                            </li>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null || sessionScope.userName != null}">
                                            <li>
                                                <a class="dropdown-item capitalize" href="logout">Sign out</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="col-12">
                    <div class="mobile_menu d-block d-lg-none"></div>
                </div>
            </div>
        </div>
    </div>
</header>