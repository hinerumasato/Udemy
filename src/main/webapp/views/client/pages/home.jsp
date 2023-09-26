<%-- 
    Document   : newjsp
    Created on : Sep 19, 2023, 2:14:44 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<% 
    String p = "123";
%>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/home.css'/>">
</head>

<div class="container">
    <div class="home_container_group">
        <div class="home_container_title fs-1 fw-bold text-uppercase">
            DANH MỤC KHOÁ HỌC
        </div>
        <div class="home_container_content home_container_course_list">
            <div class="row row-cols-4">
                <div class="col">Kỹ năng ngoại ngữ</div>
                <div class="col">Phát triển cá nhân</div>
                <div class="col">Sales, bán hàng</div>
                <div class="col">Phong cách sống</div>
                <div class="col">Thiết kế đồ hoạ</div>
                <div class="col">Tin học văn phòng</div>
                <div class="col">Công nghệ thông tin</div>
                <div class="col">Nhiếp ảnh, quay phim</div>
                <div class="col">Marketing</div>
                <div class="col">Kinh doanh, khởi nghiệp</div>
                <div class="col">Sức khoẻ - Giới tính</div>
                <div class="col">Gia đình</div>
            </div>
        </div>
    </div>

    <div class="home_container_group">
        <div class="home_container_title d-flex justify-content-between align-items-center">
            <div class="fs-1 fw-bold text-uppercase">KHOÁ HỌC MỚI NHẤT</div>

            <ul class="nav nav-pills gap-3">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Tất cả</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Thiết kế đồ hoạ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Tin học văn phòng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Sale, bán hàng</a>
                </li>
            </ul>
        </div>

        <div class="home_container_content">
            <div class="row row-cols-3">
                <div class="col course-item">
                    <div class="course-item-thumbnail">
                        <img class="w-100 h-100" src="<c:url value='/static/imgs/courses/course_1.webp' />" alt="">
                    </div>
                    <div class="course-item-level basic">Cơ bản</div>
                    <div class="course-item-info">
                        <h4 class="course-item-info-title">
                            Hướng dẫn sử dụng Illutrator cho người mới bắt đầu
                        </h4>
                        <div class="course-item-info-category">
                            Công nghệ thông tin
                        </div>
                        <div class="course-item-info-prices d-flex gap-2 align-items-center">
                            <div class="course-item-info-prices-new-price">700.000đ</div>
                            <div class="course-item-info-prices-old-price">1.200.000đ</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>