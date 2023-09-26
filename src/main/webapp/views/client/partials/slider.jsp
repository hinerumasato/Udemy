<%-- 
    Document   : newjspslider
    Created on : Sep 23, 2023, 9:00:14 PM
    Author     : Masato
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/slider.css?v=${randomNumber}'/>">
</head>

<div class="slider">
    <div class="slider-img">
        <img src="<c:url value='/static/imgs/sliders/home_slider.webp' />" alt="">
    </div>
    <div class="slider-services">
        <div class="container">
            <div class="row text-white">
                <div class="col-3 d-flex gap-3">
                    <img src="<c:url value='/static/imgs/services/service_1.webp' />" alt="" class="service-img">
                    <div class="slider-service-content">
                        <div class="services-title fw-bold text-uppercase">GIẢNG VIÊN UY TÍN</div>
                        <div class="services-description">Bài học chất lượng</div>
                    </div>
                </div>
                <div class="col-3 d-flex gap-3">
                    <img width="42" height="42" src="<c:url value='/static/imgs/services/service_2.webp' />" alt="" class="service-img">
                    <div class="slider-service-content">
                        <div class="services-title fw-bold text-uppercase">Thanh toán 1 lần</div>
                        <div class="services-description">Học mãi mãi</div>
                    </div>
                </div>
                <div class="col-3 d-flex gap-3">
                    <img width="44" height="38" src="<c:url value='/static/imgs/services/service_3.webp' />" alt="" class="service-img">
                    <div class="slider-service-content">
                        <div class="services-title fw-bold text-uppercase">Học trực tuyến</div>
                        <div class="services-description">Hỗ trợ trực tuyến</div>
                    </div>
                </div>
                <div class="col-3 d-flex gap-3">
                    <img width="37" height="49" src="<c:url value='/static/imgs/services/service_4.webp' />" alt="" class="service-img">
                    <div class="slider-service-content">
                        <div class="services-title fw-bold text-uppercase">Cam kết chất lượng</div>
                        <div class="services-description">Chứng chỉ giáo dục</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>