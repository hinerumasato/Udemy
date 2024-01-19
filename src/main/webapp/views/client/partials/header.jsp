<%-- 
    Document   : header-new
    Created on : Sep 19, 2023, 2:12:23 PM
    Author     : Masato
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/header.css?v=${randomNumber}'/>"/>
</head>

<header class="d-xl-block d-none">
    <div class="py-3 header-info d-flex justify-content-center align-items-center text-white gap-3">
        <div>
            <i class="fa-solid fa-clock"></i>
            <span>Thời gian làm việc: Từ <span class="fw-bold">8h00 đến 22h00</span> các ngày</span>
        </div>

        <div>
            <i class="fa-solid fa-phone"></i>
            <span>Hotline: <span class="fw-bold">1900 6750</span></span>
        </div>
    </div>

    <div class="header-main shadow bg-body-tertiary py-3">
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <div class="header-main-left">
                        <a href="/home">
                            <img class="header-logo-img" src="<c:url value='/static/imgs/logo/logo.png' />">
                        </a>
                    </div>
                </div>
                <div class="col-8">
                    <div class="row align-items-center justify-content-between">
                        <div class="col-9">
                            <div class="row align-items-center">
                                <div class="header-navigation col-3">
                                    <div class="d-flex align-items-center header-navigation-title">
                                        <i class="fa-solid fa-bars me-3"></i>
                                        <span>Danh mục</span>
                                    </div>
                                    <ul class="list-unstyled header-navigation-list shadow">
                                        <li class="header-navigation-item">
                                            <a href="/home" class="header-navigation-link">Trang chủ</a>
                                        </li>
                                        <li class="header-navigation-item">
                                            <a href="/courses" class="header-navigation-link">Danh sách khoá học</a>
                                        </li>
                                        <li class="header-navigation-item">
                                            <a href="/news" class="header-navigation-link">Tin tức</a>
                                        </li>
                                        <li class="header-navigation-item">
                                            <a href="" class="header-navigation-link">Đánh giá</a>
                                        </li>
                                        <li class="header-navigation-item">
                                            <a href="/about" class="header-navigation-link">Giới thiệu</a>
                                        </li>
                                    </ul>
                                </div>

                                <div class="header-search-group col-9 d-flex align-items-center">
                                    <input class="input-header" type="text" placeholder="Tìm kiếm..." />
                                    <i class="las la-search text-main d-block h-100 search-icon"></i>
                                </div>
                            </div>    
                        </div>

                        <div class="col-3">
                            <div class="header-cart">
                                <a href="/courses" title="Xem tất cả khoá học" class="text-decoration-none text-secondary">Tất cả khoá học</a>
                                <a href="/cart" title="Xem giỏ hàng"><i class="las la-shopping-cart fs-4 text-main"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not empty loginUser}">
                        <div class="col-2">
                            <div class="d-flex">
                                <form action="/auth/logout" method="POST">
                                    <div class="text-center">
                                        <div>Xin chào ${loginUser.getLastName()}</div>
                                        <button class="logout-btn" type="submit">Đăng xuất</button>
                                    </div>    
                                </form>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-2">
                            <div class="d-flex">
                                <a href="/register" class="text-secondary auth-btn">Đăng ký</a>
                                <a href="/login" class="auth-btn btn-main">Đăng nhập</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</header>

<header class="d-block d-xl-none">
    <!-- Mobile header -->
    <div class="py-3 header-info d-flex justify-content-center align-items-center text-white gap-3">
        <div>
            <i class="fa-solid fa-phone"></i>
            <span>Hotline: <span class="fw-bold">1900 6750</span></span>
        </div>
    </div>

    <div class="header-main shadow bg-body-tertiary py-3 px-3">
        <div class="container">
            <div class="row align-items-center">
                <div class="col">
                    <button id="openHeaderAsideBtn" class="bars-btn text-main border-0 bg-white"><i class="fa-solid fa-bars"></i></button>
                </div>
                <div class="col">
                    <div class="logo-center">
                        <a href="/home">
                            <img class="header-logo-img" src="<c:url value='/static/imgs/logo/logo.png' />">
                        </a>
                    </div>
                </div>
                <div class="col">
                    <div class="header-cart-right">
                        <a href="/cart" title="Xem giỏ hàng"><i class="las la-shopping-cart fs-4 text-main"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <aside class="side-menu">
        <div class="close-btn"><i class="fa-solid fa-xmark"></i></div>
        <ul>
            <li><a href="/">Trang chủ</a></li>
            <li><a href="/courses">Tất cả khoá học</a></li>
            <li><a href="/news">Tin tức</a></li>
            <li><a href="#">Giới thiệu</a></li>
            <li><a href="/login">Đăng nhập</a></li>
            <li><a href="/register">Đăng ký</a></li>
        </ul>
    </aside>
</header>

<script>
    (function() {
        const openHeaderAsideBtn = document.querySelector('#openHeaderAsideBtn');
        const closeHeaderAsideBtn = document.querySelector('.close-btn');

        openHeaderAsideBtn.onclick = () => {
            const sideMenu = document.querySelector('.side-menu');
            sideMenu.classList.add('active');
        }

        closeHeaderAsideBtn.onclick = () => {
            const sideMenu = document.querySelector('.side-menu');
            sideMenu.classList.remove('active');
        }
    })();
</script>