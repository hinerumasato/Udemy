<%-- 
    Document   : course-max-width
    Created on : Jan 23, 2024, 8:38:14 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<div class="container mt-5">

    <div id="courseMaxWidthBreadcrumb" class="my-5"></div>

    <c:if test="${not empty sessionScope.courseMaxWidthMessage}">
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <strong>${sessionScope.courseMaxWidthMessage}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row row-cols-2 row-cols-md-3 row-cols-lg-4">
        <c:forEach items="${courses}" var="course">
            <div class="col">
                <div class="course-item">
                    <a href="/courses/details/${course.getSlug()}">
                        <div class="course-item-thumbnail">
                            <img class="w-100" src="<c:url value='${course.getThumbnails().get(0).getImg()}' />"
                                 alt="">
                        </div>
                        <div class="course-item-level ${levelMap.get(course).getCode()}">
                            ${levelMap.get(course).getValue()}</div>
                        <div class="course-item-info">
                            <h4 class="course-item-info-title">
                                ${course.getName()}
                            </h4>
                            <div class="course-item-info-category">
                                ${categoryMap.get(course).getName()}
                            </div>
                            <div class="course-item-info-prices d-block d-md-flex gap-2 align-items-center">
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
                                    <img src="${teacherMap.get(course).getAvatar()}"
                                         class="rounded-circle" style="width: 60px; height: 60px;"
                                         alt="Avatar" />
                                    <div>
                                        <h6 class="fw-bold teacher-name">${teacherMap.get(course).getName()}</h6>
                                        <span>${categoryMap.get(course).getName()}</span>
                                    </div>
                                </div>
                            </div>

                            <h4 class="fw-bold mt-3 text-main">${course.getName()}</h4>
                            <div class="course-backside-description">${course.getDescription()}</div>
                            <div
                                class="backside-data d-block d-md-flex justify-content-between align-items-center">
                                <div class="backside-level">
                                    <i class="fa-solid fa-chart-line"></i>
                                    <span>${levelMap.get(course).getValue()}</span>
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
</div>

<script src="<c:url value='/static/js/pages/course-max-width.js?v=${randomNumber}' />"></script>