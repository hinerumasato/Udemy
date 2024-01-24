<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@include file="/common/includes.jsp" %>

        <head>
            <link rel="stylesheet" href="<c:url value='/static/css/add-news.css?v=${randomNumber}' />">
        </head>
        <div class="container">

            <h2 class="fw-bold">Thêm tin tức mới</h2>

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>${message}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form action="" method="POSt" enctype="multipart/form-data" accept-charset="UTF-8">
                <div class="row g-4 mt-3">
                    <div class="col-12 col-md-8">
                        <div class="form-group">
                            <h4>Tiêu đề tin tức</h4>
                            <input type="text" name="title" class="form-control" placeholder="Ghi tiêu đề ở đây">
                        </div>

                        <div class="form-group">
                            <h4>Mô tả nội dung</h4>
                            <textarea name="content" id="" class="w-100 form-control"
                                placeholder="Ghi mô tả ở đây"></textarea>
                        </div>

                        <div class="form-group thumbnail-group">
                            <h4>Ảnh avatar</h4>
                            <div class="d-flex justify-content-center border border-secondary-subtle">
                                <div class="uploaded d-none">
                                    <div class="dismiss-btn d-flex justify-content-end">
                                        <i class="fa-solid fa-xmark text-body-tertiary"></i>
                                    </div>
                                    <img class="w-100" height="160" src="" alt="Upload Avatar">
                                </div>
                                <div class="no-upload d-block open-file-explorer-btn">
                                    <div class="text-center">
                                        <span class="text-primary fw-bold d-block">Browse from device</span>
                                        <i class="fa-regular fa-images"></i>
                                    </div>
                                </div>
                            </div>
                            <input id="iconFile" type="file" class="d-none" name="image" accept="image/png, image/gif, image/jpeg image/webp image/ico">
                        </div>

                        <div class="shadow p-4 bg-white my-3">
                            <div class="d-md-flex d-block justify-content-between align-items-center">
                                <h4 class="fw-bold">Bạn đã hoàn thành?</h4>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-outline-secondary">Huỷ</button>
                                    <button type="submit" class="btn btn-primary">Đăng tin tức</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="variants shadow p-4 rounded-4 bg-white">
                            <div class="form-group">
                                <h6>Tác giả</h6>
                                <input type="text" class="form-control w-100" name="author" placeholder="Nhập tên tác giả">
                            </div>
                            <div class="d-md-flex d-block justify-content-between mt-3">
                                <div class="is-new-course d-flex align-items-center gap-1">
                                    <label for="">Tin tức đặc biệt</label>
                                    <input type="checkbox" name="is_special_news" id="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script src="<c:url value='/static/js/pages/add-news.js' />"></script>