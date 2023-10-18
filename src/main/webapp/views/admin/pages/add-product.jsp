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

<div class="container py-5">
    
    ${sessionScope.addProductMessage}
    
    <form action="" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
        <h2 class="fw-bold">Thêm khoá học mới</h2>
        <div class="row row-cols-1 row-cols-md-2">
            <div class="col">
                <p class="text-secondary-emphasis">Đơn đặt hàng được đặt trên cửa hàng của bạn</p>
            </div>
            <div class="col">
                <div class="button-group d-flex justify-content-end gap-2">
                    <button class="btn btn-outline-secondary" type="button">Huỷ</button>
                    <button class="btn btn-primary" type="submit">Đăng khoá học</button>
                </div>
            </div>
        </div>
        
        <c:if test="${not empty sessionScope.addProductMessage}">
            <div class="alert alert-success alert-dismissible fade show mt-3">
                <strong>${sessionScope.addProductMessage}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        
        <div class="row g-4 mt-3">
            <div class="col-12 col-md-8">
                <div class="form-group">
                    <h4>Tiêu đề khoá học</h4>
                    <input type="text" name="name" class="form-control" placeholder="Ghi tiêu đề ở đây">
                </div>

                <div class="form-group">
                    <h4>Mô tả nội dung khoá học</h4>
                    <textarea name="description" id="" class="w-100 form-control"
                        placeholder="Ghi mô tả ở đây"></textarea>
                </div>

                <div class="form-group thumbnail-group">
                    <h4>Tải lên ảnh thumbnail</h4>
                    <div class="display-upload-img my-3">
                        <div class="row row-cols-6 g-4 uploaded-thumbnails"></div>
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
                                <input class="form-control" type="number" name="old_price" placeholder="VNĐ">
                            </div>
                        </div>
                        <div class="col">
                            <div class="sale-price">
                                <h4>Giá khuyến mãi</h4>
                                <input class="form-control" type="number" name="sale_price" placeholder="VNĐ">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-4">
                <div class="variants shadow p-4 rounded-4 bg-white">
                    <h4>Lựa chọn</h4>
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="fw-bold">Khoá học</h6>
                        <a href="#" class="text-decoration-none">Thêm khoá học</a>
                    </div>
                    <select name="category_id" id="" class="form-select">
                        <c:forEach items="${categories}" var="category">
                            <option value="${category.getId()}">${category.getName()}</option>
                        </c:forEach>
                    </select>

                    <div class="d-flex justify-content-between align-items-center mt-5">
                        <h6 class="fw-bold">Cấp độ</h6>
                        <a href="#" class="text-decoration-none">Thêm cấp độ</a>
                    </div>
                    <select name="level_id" id="" class="form-select">
                        <c:forEach items="${levels}" var="level">
                            <option value="${level.getId()}">${level.getValue()}</option>
                        </c:forEach>
                    </select>

                    <div class="d-flex justify-content-between align-items-center mt-5">
                        <h6 class="fw-bold">Giáo viên</h6>
                        <a href="#" class="text-decoration-none">Thêm giáo viên</a>
                    </div>
                    <select name="teacher" id="" class="form-select">
                        <option value="">Nguyễn Văn A</option>
                        <option value="">Trần Thị B</option>
                    </select>

                    <div class="d-md-flex d-block justify-content-between mt-3">
                        <div class="is-new-course d-flex align-items-center gap-1">
                            <label for="">Khoá học mới</label>
                            <input type="checkbox" name="is_new_course" id="">
                        </div>
                        <div class="is-popular-course d-flex align-items-center gap-1">
                            <label for="">Khoá học nổi bật</label>
                            <input type="checkbox" name="is_popular_course" id="">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="shadow p-4 bg-white mt-3">
            <div class="d-md-flex d-block justify-content-between align-items-center">
                <h4 class="fw-bold">Bạn đã hoàn thành?</h4>
                <div class="d-flex gap-2">
                    <button class="btn btn-outline-secondary">Huỷ</button>
                    <button type="submit" class="btn btn-primary">Đăng khoá học</button>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="<c:url value='/static/js/pages/add-product.js?v=${randomNumber}' />"></script>