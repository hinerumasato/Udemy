<%-- 
    Document   : add-product
    Created on : Oct 15, 2023, 1:22:00 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/add-product.css?v=${randomNumber}' />">
</head>

<div class="container py-5 pe-3">

    <form id="updateCourseForm" action="" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
        <input type="hidden" name="_method" value="PUT">
        <input type="hidden" name="id" value="${course.getId()}">
        <h2 class="fw-bold">Cập nhật khoá học</h2>
        <p class="text-secondary-emphasis">Khoá học bạn cập nhật sẽ được đưa lên trang giao diện người dùng</p>

        <div class="row g-4 mt-3">
            <div class="col-12 col-md-8">
                <div class="form-group">
                    <h4>Tiêu đề khoá học</h4>
                    <input type="text" name="name" class="form-control" placeholder="Ghi tiêu đề ở đây" value="${course.getName()}">
                </div>

                <div class="form-group">
                    <h4>Mô tả nội dung khoá học</h4>
                    <textarea name="description" id="" class="w-100 form-control"
                              placeholder="Ghi mô tả ở đây">${course.getDescription()}</textarea>
                </div>

                <div class="form-group thumbnail-group">
                    <h4>Tải lên ảnh thumbnail</h4>
                    <div class="display-upload-img my-3">
                        <div class="row row-cols-6 g-4 uploaded-thumbnails">
                            <c:forEach items="${thumbnails}" var="thumbnail">
                                <div class="col">
                                    <div class="p-2 bg-white">
                                        <div class="dismiss-btn d-flex justify-content-end">
                                            <i class="fa-solid fa-xmark text-body-tertiary"></i>
                                        </div>
                                        <div class="d-flex justify-content-center align-items-center">
                                            <img src="${thumbnail.getImg()}" alt="" width="35" height="35">
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="d-flex justify-content-center border border-secondary-subtle open-file-explorer-btn">
                        <div class="text-center">
                            <span class="text-primary fw-bold d-block">Browse from device</span>
                            <i class="fa-regular fa-images"></i>
                        </div>
                    </div>
                    <input id="thumbnailFile" type="file" class="d-none" name="thumbnail" multiple
                           accept="image/png, image/gif, image/jpeg image/webp">
                </div>

                <div class="form-group">
                    <div class="row row-cols-2 g-3">
                        <div class="col">
                            <div class="old-price">
                                <h4>Giá gốc</h4>
                                <input class="form-control" type="number" name="old_price" placeholder="VNĐ" value="${course.getPrice()}">
                            </div>
                        </div>
                        <div class="col">
                            <div class="sale-price">
                                <h4>Giá khuyến mãi</h4>
                                <input class="form-control" type="number" name="sale_price" placeholder="VNĐ" value="${course.getSalePrice()}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="shadow p-4 bg-white my-3">
                    <div class="d-md-flex d-block justify-content-between align-items-center">
                        <h4 class="fw-bold">Bạn đã hoàn thành?</h4>
                        <div class="d-flex gap-2">
                            <a href="/admin/courses" class="text-decoration-none btn btn-outline-secondary">Huỷ</a>
                            <button type="submit" class="btn btn-primary">Cập nhật khoá học</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-4">
                <div class="variants shadow p-4 rounded-4 bg-white">
                    <h4>Lựa chọn</h4>
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="fw-bold">Khoá học</h6>
                        <a href="/admin/categories/add-category" class="text-decoration-none">Cập nhật khoá học</a>
                    </div>
                    <select name="category_id" id="categorySelect" class="form-select">
                        <c:forEach items="${categories}" var="category">
                            <c:choose>
                                <c:when test="${category.getId() eq categoryMap.get(course).getId()}">
                                    <option value="${category.getId()}" selected>${category.getName()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>

                    <div class="d-flex justify-content-between align-items-center mt-5">
                        <h6 class="fw-bold">Cấp độ</h6>
                        <a href="#" class="text-decoration-none">Thêm cấp độ</a>
                    </div>
                    <select name="level_id" id="" class="form-select">
                        <c:forEach items="${levels}" var="level">
                            <c:choose>
                                <c:when test="${level.getId() eq levelMap.get(course).getId()}">
                                    <option value="${level.getId()}" selected>${level.getValue()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${level.getId()}">${level.getValue()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>

                    <div class="d-flex justify-content-between align-items-center mt-5">
                        <h6 class="fw-bold">Giáo viên</h6>
                        <a href="#" class="text-decoration-none">Thêm giáo viên</a>
                    </div>

                    <select name="teacher_id" id="teacherSelect" class="form-select">
                        <c:forEach items="${teachers}" var="teacher">
                            <c:choose>
                                <c:when test="${teacher.getId() eq teacherMap.get(course).getId()}">
                                    <option value="${teacher.getId()}" category-id="${teacher.getCategoryId()}" selected>${teacher.getName()}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${teacher.getId()}" category-id="${teacher.getCategoryId()}">${teacher.getName()}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>

                    <div class="d-md-flex d-block justify-content-between mt-3">
                        <div class="is-new-course d-flex align-items-center gap-1">
                            <label for="">Khoá học mới</label>
                            <input type="checkbox" name="is_new_course" id="" checked="${course.isNewCourse()}">
                        </div>
                        <div class="is-popular-course d-flex align-items-center gap-1">
                            <label for="">Khoá học nổi bật</label>
                            <input type="checkbox" name="is_popular_course" id="" checked="${course.isPopularCourse()}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<script src="<c:url value='/static/js/pages/update-course.js?v=${randomNumber}' />"></script>