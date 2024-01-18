<%-- 
    Document   : course
    Created on : Oct 13, 2023, 9:57:55 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

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
        <div class="col-12 d-none d-md-block col-md-3">
            <%@include file="/views/client/partials/sidebar.jsp" %>
        </div>
        <div class="col-12 col-md-9 course_container py-5">
            <div id="coursePageList" class="row row-cols-xl-3 row-cols-sm-2 row-cols-2 g-3">
                <c:forEach items="${courses}" var="course" varStatus="status">
                    <div class="col">
                        <div class="course-item">
                            <a href="/courses/details/${course.getSlug()}">
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

                                <div class="course-backside">
                                    <div class="course-teacher">
                                        <div class="course-teacher-info d-md-flex d-block gap-2 align-items-center">
                                            <img src="${teacherMap.get(course.getTeacherId()).getAvatar()}"
                                                class="rounded-circle" style="width: 60px; height: 60px;"
                                                alt="Avatar" />
                                            <div>
                                                <h6 class="fw-bold teacher-name">${teacherMap.get(course.getTeacherId()).getName()}</h6>
                                                <span>${categoryMap.get(teacherMap.get(course.getTeacherId()).getCategoryId()).getName()}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <h4 class="fw-bold mt-3 text-main">${course.getName()}</h4>
                                        <div class="course-backside-description">${course.getDescription()}</div>
                                    <div
                                        class="backside-data d-block d-md-flex justify-content-between align-items-center">
                                        <div class="backside-level">
                                            <i class="fa-solid fa-chart-line"></i>
                                            <span>Cơ bản</span>
                                        </div>

                                        <div class="backside-lesson">
                                            <i class="fa fa-video-camera" aria-hidden="true"></i>
                                            <span>7 bài giảng</span>
                                        </div>

                                        <div class="backside-time">
                                            <i class="fa-solid fa-clock"></i>
                                            <span>7 giờ</span>
                                        </div>
                                    </div>

                                    <div class="mt-5">
                                        <button class="btn-main-course w-100">Preview về khoá học</button>
                                    </div>

                                    <div class="d-block d-md-flex justify-content-between mt-3">
                                        <div class="like rounded bg-body-tertiary p-1 rounded-circle">
                                            <i class="fa-regular fa-heart"></i>
                                        </div>
                                        <div class="share rounded bg-body-tertiary p-1 rounded-circle">
                                            <i class="fa-regular fa-share-from-square"></i>
                                        </div>
                                    </div>
                                </div>

                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="custom-pagination"></div>

        </div>
    </div>
</div>