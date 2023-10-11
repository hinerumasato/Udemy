<%-- 
    Document   : newjsp
    Created on : Sep 19, 2023, 2:14:44 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/home.css?v=${randomNumber}'/>">
</head>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="home_container_title fs-1 fw-bold text-uppercase">
            DANH MỤC KHOÁ HỌC
        </div>
        <div class="home_container_content home_container_course_list">
            <div class="row row-cols-4">
                <c:forEach items="${categories}" var="category">
                    <div class="col">
                        <img src="<c:url value=" ${category.getIcon()}" />" alt="">
                        <span>${category.getName()}</span>
                    </div>
                </c:forEach>

            </div>
        </div>

    </div>
</div>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="home_container_title d-flex justify-content-between align-items-center">
            <div class="fs-1 fw-bold text-uppercase">KHOÁ HỌC MỚI NHẤT</div>

            <ul class="nav nav-pills gap-3" id="news_course_pills" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-all" type="button" role="tab" aria-controls="pills-all"
                            aria-selected="true">Tất cả</button></li>
                </li>

                <c:forEach items="${categories}" begin="0" end="2" var="category">
                    <li class="nav-item" code="${category.getCode()}">
                        <button class="nav-link" id="pills-${category.getCode()}-tab" data-bs-toggle="pill"
                                data-bs-target="#pills-${category.getCode()}" type="button" role="tab" aria-controls="pills-${category.getCode()}"
                                aria-selected="true">${category.getName()}</button></li>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="home_container_content tab-content">
            <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab" tabindex="0">
                <div class="row row-cols-lg-3 row-cols-md-2 row-cols-1">
                    <c:forEach items="${courses}" var="course" varStatus="status">
                        <div class="col course-item">
                            <a href="">
                                <div class="course-item-thumbnail">
                                    <img class="w-100"
                                         src="<c:url value='${course.getThumbnails().get(0).getImg()}' />" alt="">
                                </div>
                                <div class="course-item-level ${levels.get(status.index).getCode()}">${levels.get(status.index).getValue()}</div>
                                <div class="course-item-info">
                                    <h4 class="course-item-info-title">
                                        ${course.getName()}
                                    </h4>
                                    <div class="course-item-info-category">
                                        ${courseCategories.get(status.index).getName()}
                                    </div>
                                    <div class="course-item-info-prices d-flex gap-2 align-items-center">
                                        <div class="format-price course-item-info-prices-new-price">
                                            ${course.getSalePrice()}</div>
                                        <div class="format-price course-item-info-prices-old-price">${course.getPrice()}
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <c:forEach items="${categories}" begin="0" end="2" var="category">
                <div code="${category.getCode()}" class="tab-pane fade" id="pills-${category.getCode()}" role="tabpanel" aria-labelledby="pills-${category.getCode()}-tab" tabindex="0">
                    <div class="spinner-border" role="status" style="display: block; margin: 0 auto;">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </c:forEach>
        </div>


    </div>
</div>

<div class="home_container_group popular_container_group py-5">
    <div class="container">
        <div class="container-line"></div>
        <div class="home_container_title d-flex justify-content-between align-items-center">
            <div class="fs-1 fw-bold text-uppercase">KHOÁ HỌC NỔI BẬT</div>

            <ul class="nav nav-pills gap-3">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Tất cả</a>
                </li>
                <c:forEach items="${categories}" begin="0" end="2" var="category">
                    <li class="nav-item">
                        <a class="nav-link" href="#">${category.getName()}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="home_container_content">
            <div class="row">
                <div class="col-6">
                    <img src="<c:url value='/static/imgs/banners/banner_1.webp' />" alt="">
                </div>
                <div class="col-6">
                    <img src="<c:url value='/static/imgs/banners/banner_2.webp' />" alt="">
                </div>
            </div>

            <div class="row row-cols-4 pt-5">
                <c:forEach items="${courses}" var="course" varStatus="status">
                    <div class="col course-item">
                        <a href="">
                            <div class="course-item-thumbnail">
                                <img class="w-100"
                                     src="<c:url value='${course.getThumbnails().get(0).getImg()}' />" alt="">
                            </div>
                            <div class="course-item-level ${levels.get(status.index).getCode()}">${levels.get(status.index).getValue()}</div>
                            <div class="course-item-info">
                                <h4 class="course-item-info-title">
                                    ${course.getName()}
                                </h4>
                                <div class="course-item-info-category">
                                    ${courseCategories.get(status.index).getName()}
                                </div>
                                <div class="course-item-info-prices d-flex gap-2 align-items-center">
                                    <div class="format-price course-item-info-prices-new-price">${course.getSalePrice()}
                                    </div>
                                    <div class="format-price course-item-info-prices-old-price">${course.getPrice()}
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="home_container_title d-flex justify-content-between align-items-center">
            <div class="fs-1 fw-bold text-uppercase">GIẢNG VIÊN TIÊU BIỂU</div>
        </div>

        <div class="home_container_content">
            <div class="row row-cols-4">
                <div class="col teacher-item">
                    <div class="teacher_avatar">
                        <img src="<c:url value='/static/imgs/teachers/teacher_1.webp' />" alt="" class="w-100">
                    </div>
                    <b class="teacher-name text-center d-block w-100">Huỳnh Ngọc Thanh</b>
                    <p class="teacher-sobject text-center w-100">Digital Marketing</p>
                </div>

                <div class="col teacher-item">
                    <div class="teacher_avatar">
                        <img src="<c:url value='/static/imgs/teachers/teacher_2.webp' />" alt="" class="w-100">
                    </div>
                    <b class="teacher-name text-center d-block w-100">Hannah Pham</b>
                    <p class="teacher-sobject text-center w-100">UX/UI Design</p>
                </div>

                <div class="col teacher-item">
                    <div class="teacher_avatar">
                        <img src="<c:url value='/static/imgs/teachers/teacher_3.webp' />" alt="" class="w-100">
                    </div>
                    <b class="teacher-name text-center d-block w-100">Trần Trung Anh</b>
                    <p class="teacher-sobject text-center w-100">Programmer</p>
                </div>

                <div class="col teacher-item">
                    <div class="teacher_avatar">
                        <img src="<c:url value='/static/imgs/teachers/teacher_4.webp' />" alt="" class="w-100">
                    </div>
                    <b class="teacher-name text-center d-block w-100">Tuấn Deno</b>
                    <p class="teacher-sobject text-center w-100">Life Skill</p>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="home_container_group about_container_group popular_container_group py-5">
    <div class="container">
        <div class="home_container_content">
            <div class="row">
                <div class="col-6">
                    <img src="<c:url value='/static/imgs/banners/banner_about.webp' />" alt="" class="about-img w-100">
                </div>
                <div class="col-6">
                    <a href="" class="text-main">About Udemy</a>
                    <h4>Tại sao nên chọn Udemy?</h4>
                    <p>
                        Udemy không chỉ là một lĩnh vực đầu tư tiềm năng mà còn là một sản phẩm nhân văn, mang lại cơ
                        hội
                        tiếp cận tri thức tinh hoa cho tất cả mọi người.
                    </p>

                    <ul class="home_container_about_list">
                        <li class="d-flex align-items-start gap-2">
                            <i style="color: #F87F72;" class="las la-check-circle d-inline-block mt-1"></i>
                            <div>Udemy luôn chào đón những nhân tố tài năng và tâm huyết với sứ mệnh "nâng cao giá trị
                                tri thức, phục vụ hàng triệu người Việt Nam"</div>
                        </li>
                        <li class="d-flex align-items-start gap-2">
                            <i style="color: #B398FF;" class="las la-check-circle d-inline-block mt-1"></i>
                            <div>An toàn và bảo mật thông tin học viện</div>
                        </li>
                        <li class="d-flex align-items-start gap-2">
                            <i style="color: #FFC107;" class="las la-check-circle d-inline-block mt-1"></i>
                            <div>Chất lượng bài giảng tốt, nội dung đã qua thẩm định, chọn lọc</div>
                        </li>
                    </ul>

                    <button class="text-white bg-main px-4 py-2 no-border-outline view-all-btn">Xem tất cả</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="wrapper d-flex gap-3">
            <div class="home_container_title">
                <div class="fs-3 fw-bold text-uppercase">REVIEW VỀ UDEMY</div>
                <p class="fw-normal p-2 review-content">
                    Udemy mong nhận được những góp ý và phản hồi từ các bạn để không ngừng nâng cao chất lượng khóa học
                    trong tương lai
                </p>
                <button class="text-white bg-main px-4 py-2 no-border-outline view-all-btn">Xem tất cả</button>
            </div>

            <div class="home_container_content">
                <div class="row row-cols-3 justify-content-between">
                    <div class="col comment-item">
                        <img src="<c:url value='/static/imgs/rating/star.webp' />" alt="">
                        <h4 class="text-main">Tuyệt vời!</h4>
                        <p>
                            Mình thấy Udemy có rất nhiều khóa học bổ ích. Học viên được nghe trực tiếp sự giảng dạy của
                            giáo viên, thực hành làm bài tập rất hiệu quả. Giảng viên nhiệt tình và dễ thương. Hi
                        </p>

                        <div class="d-flex gap-3 align-items-center">
                            <img class="review-avatar" src="<c:url value='/static/imgs/reviews/review_1.webp' />"
                                 alt="">
                            <div class="review_wrapper">
                                <h5 class="review-username">Mr. Trung Dung</h5>
                                <div class="review-userclass">Học viên lớp UI Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col comment-item">
                        <img src="<c:url value='/static/imgs/rating/star.webp' />" alt="">
                        <h4 class="text-main">Tuyệt vời!</h4>
                        <p>
                            Mình thấy Udemy có rất nhiều khóa học bổ ích. Học viên được nghe trực tiếp sự giảng dạy của
                            giáo viên, thực hành làm bài tập rất hiệu quả. Giảng viên nhiệt tình và dễ thương. Hi
                        </p>

                        <div class="d-flex gap-3 align-items-center">
                            <img class="review-avatar" src="<c:url value='/static/imgs/reviews/review_1.webp' />"
                                 alt="">
                            <div class="review_wrapper">
                                <h5 class="review-username">Mr. Trung Dung</h5>
                                <div class="review-userclass">Học viên lớp UI Design</div>
                            </div>
                        </div>
                    </div>
                    <div class="col comment-item">
                        <img src="<c:url value='/static/imgs/rating/star.webp' />" alt="">
                        <h4 class="text-main">Tuyệt vời!</h4>
                        <p>
                            Mình thấy Udemy có rất nhiều khóa học bổ ích. Học viên được nghe trực tiếp sự giảng dạy của
                            giáo viên, thực hành làm bài tập rất hiệu quả. Giảng viên nhiệt tình và dễ thương. Hi
                        </p>

                        <div class="d-flex gap-3 align-items-center">
                            <img class="review-avatar" src="<c:url value='/static/imgs/reviews/review_1.webp' />"
                                 alt="">
                            <div class="review_wrapper">
                                <h5 class="review-username">Mr. Trung Dung</h5>
                                <div class="review-userclass">Học viên lớp UI Design</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="home_container_title fs-1 fw-bold text-uppercase">
            CHINH PHỤC MỤC TIÊU CỦA BẠN
        </div>
        <div class="home_container_content">
            <div class="row">
                <div class="col-6">
                    <img src="<c:url value='/static/imgs/banners/banner_target_1.webp' />" alt="">
                    <img class="mt-3" src="<c:url value='/static/imgs/banners/banner_target_2.webp' />" alt="">
                </div>
                <div class="col-6">
                    <img class="h-100 w-100" src="<c:url value='/static/imgs/banners/banner_target_3.webp' />" alt="">
                </div>
            </div>

            <button class="text-white bg-main px-4 py-2 no-border-outline view-all-btn target-view-all-btn">Xem tất
                cả</button>

        </div>

    </div>
</div>

<script type="module" src="<c:url value='/static/js/pages/home.js' />"></script>