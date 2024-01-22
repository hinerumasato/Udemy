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
            <div class="row row-cols-4 g-3">
                <c:forEach items="${categories}" var="category">
                    <div class="col">
                        <a href="/courses/${category.getCode()}" class="text-decoration-none text-black">
                            <div class="inner">
                                <img width="40" height="40" src="<c:url value=" ${category.getIcon()}" />" alt="">
                                <span>${category.getName()}</span>
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
        <div class="home_container_title d-lg-flex d-block justify-content-between align-items-center">
            <div class="fs-1 fw-bold text-uppercase">KHOÁ HỌC MỚI NHẤT</div>

            <ul class="nav nav-pills gap-3" id="news_course_pills" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="pills-new-home-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-new-all" type="button" role="tab" aria-controls="pills-new-all"
                        aria-selected="true">Tất cả</button></li>
                </li>

                <c:forEach items="${categories}" begin="0" end="2" var="category">
                    <li class="nav-item" code="${category.getCode()}">
                        <button class="nav-link" id="pills-new-${category.getCode()}-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-new-${category.getCode()}" type="button" role="tab"
                            aria-controls="pills-new-${category.getCode()}"
                            aria-selected="true">${category.getName()}</button></li>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="home_container_content tab-content">
            <div class="tab-pane fade show active" id="pills-new-all" role="tabpanel"
                aria-labelledby="pills-new-all-tab" tabindex="0">
                <div class="row row-cols-lg-3 row-cols-md-2 row-cols-2 newest-course-list g-3">
                    <c:forEach items="${courses}" var="course" begin="0" end="5" varStatus="status">
                        <div class="col h-100">
                            <div class="course-item">
                                <a href="/courses/details/${course.getSlug()}">
                                    <div class="course-item-thumbnail">
                                        <img class="w-100"
                                            src="<c:url value='${course.getThumbnails().get(0).getImg()}' />" alt="">
                                    </div>
                                    <div class="course-item-level ${levels.get(status.index).getCode()}">
                                        ${levels.get(status.index).getValue()}</div>
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
                                            <div class="format-price course-item-info-prices-old-price">
                                                ${course.getPrice()}
                                            </div>
                                        </div>
                                    </div>

                                    <div class="course-backside">
                                        <div class="course-teacher">
                                            <div class="course-teacher-info d-md-flex d-block gap-2 align-items-center">
                                                <img src="${teachers.get(status.index).getAvatar()}"
                                                    class="rounded-circle" style="width: 60px; height: 60px;"
                                                    alt="Avatar" />
                                                <div>
                                                    <h6 class="fw-bold teacher-name">
                                                        ${teachers.get(status.index).getName()}</h6>
                                                    <span>${courseCategories.get(status.index).getName()}</span>
                                                </div>
                                            </div>
                                        </div>

                                        <h4 class="fw-bold mt-3 text-main">${course.getName()}</h4>
                                        <div class="course-backside-description">${course.getDescription()}</div>
                                        <div
                                            class="backside-data d-block d-md-flex justify-content-between align-items-center">
                                            <div class="backside-level">
                                                <i class="fa-solid fa-chart-line"></i>
                                                <span>${levels.get(status.index).getValue()}</span>
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

                <div class="d-flex justify-content-center mt-5">
                    <a href="/courses" class="bg-main text-uppercase text-decoration-none px-4 py-2 rounded-2">Xem tất cả</a>
                </div>
            </div>
            <c:forEach items="${categories}" begin="0" end="2" var="category">
                <div code="${category.getCode()}" class="tab-pane fade" id="pills-new-${category.getCode()}"
                    role="tabpanel" aria-labelledby="pills-new-${category.getCode()}-tab" tabindex="0">
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

            <ul class="nav nav-pills gap-3" id="popular_course_pills" role="tablist">
                <li class="nav-item">
                    <button class="nav-link active" id="pills-popular-home-tab" data-bs-toggle="pill"
                        data-bs-target="#pills-popular-all" type="button" role="tab" aria-controls="pills-popular-all"
                        aria-selected="true">Tất cả</button></li>
                </li>

                <c:forEach items="${categories}" begin="0" end="2" var="category">
                    <li class="nav-item" code="${category.getCode()}">
                        <button class="nav-link" id="pills-popular-${category.getCode()}-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-popular-${category.getCode()}" type="button" role="tab"
                            aria-controls="pills-popular-${category.getCode()}"
                            aria-selected="true">${category.getName()}</button></li>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="home_container_content">
            <div class="row row-cols-1 row-cols-md-2">
                <div class="col">
                    <div class="inner">
                        <img class="w-100" src="<c:url value='/static/imgs/banners/banner_1.webp' />" alt="">
                    </div>
                </div>
                <div class="col">
                    <div class="inner">
                        <img class="w-100" src="<c:url value='/static/imgs/banners/banner_2.webp' />" alt="">
                    </div>
                </div>
            </div>

            <div class="tab-content">
                <div class="tab-pane fade show active" id="pills-popular-all" role="tabpanel"
                    aria-labelledby="pills-popular-all-tab" tabindex="0">
                    <div class="row row-cols-lg-4 row-cols-md-2 row-cols-2 pt-5 popular-course-list g-3">
                        <c:forEach items="${courses}" begin="0" end="7" var="course" varStatus="status">
                            <div class="col">
                                <div class="course-item">
                                    <a href="/courses/details/${course.getSlug()}">
                                        <div class="course-item-thumbnail">
                                            <img class="w-100"
                                                src="<c:url value='${course.getThumbnails().get(0).getImg()}' />"
                                                alt="">
                                        </div>
                                        <div class="course-item-level ${levels.get(status.index).getCode()}">
                                            ${levels.get(status.index).getValue()}</div>
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
                                                <div class="format-price course-item-info-prices-old-price">
                                                    ${course.getPrice()}
                                                </div>
                                            </div>
                                        </div>

                                        <div class="course-backside">
                                            <div class="course-teacher">
                                                <div
                                                    class="course-teacher-info d-md-flex d-block gap-2 align-items-center">
                                                    <img src="${teachers.get(status.index).getAvatar()}"
                                                        class="rounded-circle" style="width: 60px; height: 60px;"
                                                        alt="Avatar" />
                                                    <div>
                                                        <h6 class="fw-bold teacher-name">
                                                            ${teachers.get(status.index).getName()}</h6>
                                                        <span>${courseCategories.get(status.index).getName()}</span>
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
                </div>
                <c:forEach items="${categories}" begin="0" end="2" var="category">
                    <div code="${category.getCode()}" class="tab-pane fade" id="pills-popular-${category.getCode()}"
                        role="tabpanel" aria-labelledby="pills-popular-${category.getCode()}-tab" tabindex="0">
                        <div class="mt-5 spinner-border" role="status" style="display: block; margin: 0 auto;">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="home_container_title d-lg-flex d-block justify-content-between align-items-center">
            <div class="fs-1 fw-bold text-uppercase">GIẢNG VIÊN TIÊU BIỂU</div>
        </div>

        <div class="home_container_content">
            <div class="row row-cols-4">
                <c:forEach items="${allTeachers}" var="teacher" begin="0" end="3">
                    <div class="col teacher-item">
                        <div class="teacher_avatar">
                            <img src="${teacher.getAvatar()}" alt="" class="w-100">
                        </div>
                        <b class="teacher-name text-center d-block w-100">${teacher.getName()}</b>
                        <p class="teacher-sobject text-center w-100">${teacherCategoryMap.get(teacher).getName()}</p>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>
</div>

<div class="home_container_group about_container_group py-5">
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

                    <a class="text-white bg-main px-4 py-2 no-border-outline view-all-btn text-decoration-none" href="/about">Xem tất cả</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="home_container_group">
    <div class="container">
        <div class="container-line"></div>
        <div class="wrapper d-md-flex d-block gap-3">
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
            <div class="row row-cols-1 row-cols-md-2">
                <div class="col">
                    <div class="inner">
                        <img class="w-100" src="<c:url value='/static/imgs/banners/banner_target_1.webp' />" alt="">
                        <img class="w-100 mt-3" src="<c:url value='/static/imgs/banners/banner_target_2.webp' />"
                            alt="">
                    </div>
                </div>
                <div class="col">
                    <div class="inner">
                        <img class="h-100 w-100" src="<c:url value='/static/imgs/banners/banner_target_3.webp' />"
                            alt="">
                    </div>
                </div>
            </div>

            <button class="text-white bg-main px-4 py-2 no-border-outline view-all-btn target-view-all-btn">Xem tất
                cả</button>

        </div>

    </div>
</div>

<script type="module" src="<c:url value='/static/js/pages/home.js' />"></script>