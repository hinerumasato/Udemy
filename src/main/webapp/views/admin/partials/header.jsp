<%-- 
    Document   : header
    Created on : Oct 15, 2023, 1:17:16 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary shadow">
        <div class="container-fluid container-md">
            <a class="navbar-brand" href="/admin">
                <img width="50" height="50" src="<c:url value="/static/imgs/logo/udemy.1024x1024.png" />" alt="alt"/>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/admin">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Khoá học
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/admin/courses/add-course">Thêm khoá học</a></li>
                            <li><a class="dropdown-item" href="/admin/courses">Xem khoá học</a></li>
                            <li><a class="dropdown-item" href="/admin/courses/trash">Xem khoá học đã xoá</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Thể loại
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/admin/categories/add-category">Thêm mới thể loại</a></li>
                            <li><a class="dropdown-item" href="/admin/categories">Danh sách thể loại</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Giáo viên
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/admin/teachers/add-teacher">Thêm mới giáo viên</a></li>
                            <li><a class="dropdown-item" href="/admin/teachers">Danh sách giáo viên</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Tin tức
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/admin/news/add-news">Thêm mới tin tức</a></li>
                            <li><a class="dropdown-item" href="/admin/news">Danh sách tin tức</a></li>
                        </ul>
                    </li>
                </ul>

                <div class="d-flex align-items-center gap-3">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Nhập tên sản phẩm ..." aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>

                    <ul class="list-unstyled mb-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ${sessionScope.adminLoginUser.getLastName()}                            
                            </a>
                            <ul class="dropdown-menu">
                                <li><button id="adminLogoutBtn" class="dropdown-item">Đăng xuất</button></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <form action="" method="POST" id="adminLogoutForm"></form>
</header>

<script src="<c:url value='/static/js/pages/admin-header.js?v=${randomNumber}' />"></script>
