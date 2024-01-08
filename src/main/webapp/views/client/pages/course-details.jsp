<%-- 
    Document   : course-details
    Created on : Jan 5, 2024, 12:08:08 AM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<head>
    <link rel="stylesheet" href="<c:url value='/static/css/course-details.css?v=${randomNumber}' />">
</head>
<div id="courseDetail" class="mt-5">
    <div class="container">
        <div class="row justify-content-between">
            <div class="col-7">
                <h1 class="fw-bold">${course.getName()}</h1>
                <div class="tag bg-main-light fit px-4 py-2 rounded-4 my-4">${categoryMap.get(course).getName()}</div>

                <div class="row justify-content-between">
                    <div class="col-9">
                        <div class="row">
                            <div class="col-3">
                                <div class="course-info">
                                    <div class="key">Ngày đăng</div>
                                    <div class="value">26/04/2022</div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="course-info">
                                    <div class="key">Level</div>
                                    <div class="value">${levelMap.get(course).getValue()}</div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="course-info">
                                    <div class="key">Học viên</div>
                                    <div class="value">Đang cập nhật</div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="course-info">
                                    <div class="key">Ngôn ngữ</div>
                                    <div class="value">Tiếng Việt</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-3">
                        <button class="btn-second px-4 text-center w-100 py-3 rounded-4">
                            <i class="d-inline fa-regular fa-heart"></i>
                            <span class="d-inline ms-2 fw-bold">Yêu thích</span>
                        </button>
                    </div>
                </div>

                <div class="thumbnails mt-4">
                    <img src="${course.getThumbnails().get(0).getImg()}" alt=""
                         class="w-100">
                    <div class="small-thumbnails mt-3">
                        <c:forEach items="${course.getThumbnails()}" var="thumbnail">
                            <img src="${thumbnail.getImg()}" alt="">
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-4">
                <div class="course-price">
                    <h2 class="text-danger fw-bold format-price">${course.getSalePrice()}</h2>
                    <span class="text-decoration-line-through text-secondary format-price">${course.getPrice()}</span>
                </div>

                <div class="mt-3">
                    <span class="fw-bold">Cấp độ</span>
                    <div class="course-level mt-2 bg-main fit px-3 py-1 rounded-3">${levelMap.get(course).getValue()}</div>
                </div>

                <div class="mt-3">
                    <span>Số lượng:</span>
                    <div class="course-detail-amount mt-3">
                        <button class="decrease-btn">-</button>
                        <input type="text" value="1" name="amount">
                        <button class="increase-btn">+</button>
                    </div>
                </div>

                <div class="mt-3">
                    <div class="buy-btn-group">
                        <div class="add-to-cart-btn btn-main rounded-4 px-4 py-3">Thêm vào giỏ hàng</div>
                        <div class="buy-immediately-btn btn-main-outline mt-3 rounded-4 px-4 py-3">Mua ngay</div>
                    </div>
                </div>

                <div class="mt-5">
                    <h4>Khoá học bao gồm</h4>
                    <ul class="list-unstyled course-detail-info-list">
                        <li><i class="fa-solid fa-play"></i> <span>7 giờ</span></li>
                        <li><i class="fa-regular fa-file"></i> <span>7 bài giảng</span></li>
                        <li><i class="fa-regular fa-clock"></i> <span>Sở hữu khoá học trọn đời</span></li>
                        <li><i class="fa-solid fa-laptop"></i> <span>Truy cập trên mọi nền tảng</span></li>
                        <li><i class="fa-solid fa-medal"></i> <span>Cấp chứng nhận hoàn thành</span></li>
                    </ul>
                </div>

                <div class="mt-5">
                    <h4>Thông tin về giảng viên</h4>
                    <div class="row">
                        <div class="col-2">
                            <div class="teacher-avatar">
                                <img height="61px" width="61px" src="${teacherMap.get(course).getAvatar()}" alt="">                                
                            </div>
                        </div>
                        <div class="col-10">
                            <div class="teacher-info">
                                <strong class="d-block">${teacherMap.get(course).getName()}</strong>
                                <small class="d-block">${categoryMap.get(course).getName()}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="course-description mt-5">
            <h2 class="text-main py-4 fw-bold">Thông tin sản phẩm</h2>
            <p>
                ${course.getDescription()}
            </p>
        </div>
    </div>

</div>