<%-- 
    Document   : course
    Created on : Oct 13, 2023, 9:57:55 PM
    Author     : Masato
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/course.css?v=${randomNumber}' />">
</head>

<div class="container">
    <div class="mt-5 row row-cols-2 g-3">

        <div class="col">
            <div class="inner">
                <img src="<c:url value='/static/imgs/banners/banner_course_1.webp' />" alt="" class="w-100">
            </div>
        </div>
        <div class="col">
            <div class="inner">
                <img src="<c:url value='/static/imgs/banners/banner_course_2.webp' />" alt="" class="w-100">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12 d-none d-md-block col-md-4">
            <%@include file="/views/client/partials/sidebar.jsp" %>
        </div>
        <div class="col-12 col-md-8 course_container">
            <div class="row row-cols-xl-3 row-cols-sm-2 row-cols-1 g-3">
                <c:forEach items="${courses}" var="course" varStatus="status">
                    <div class="col">
                        <div class="course-item">
                            <a href="">
                                <div class="course-item-thumbnail">
                                    <img class="w-100" src="<c:url value='${course.getThumbnails().get(0).getImg()}' />"
                                        alt="">
                                </div>
                                <div class="course-item-level ${levelMap.get(course.getLevelId()).getCode()}">
                                    ${levelMap.get(course.getLevelId()).getValue()}</div>
                                <div class="course-item-info">
                                    <h4 class="course-item-info-title">
                                        ${course.getName()}
                                    </h4>
                                    <div class="course-item-info-category">
                                        ${categoryMap.get(course.getCategoryId()).getName()}
                                    </div>
                                    <div class="course-item-info-prices d-flex gap-2 align-items-center">
                                        <div class="format-price course-item-info-prices-new-price">
                                            ${course.getSalePrice()}
                                        </div>
                                        <div class="format-price course-item-info-prices-old-price">
                                            ${course.getPrice()}
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>