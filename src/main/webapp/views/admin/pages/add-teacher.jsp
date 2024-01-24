<%-- 
    Document   : add-teacher
    Created on : Oct 21, 2023, 9:24:26 AM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<div class="bg-body-tertiary">
    <div class="container">
        <h2 class="fw-bold mt-5">Thêm giáo viên</h2>
        <div class="shadow p-3">

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>${message}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                  </div>
            </c:if>

            <form action="" method="POST" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-3 col-12">
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
                            <input id="iconFile" type="file" class="d-none" name="avatar" accept="image/png, image/gif, image/jpeg image/webp image/ico">
                        </div>
                    </div>

                    <div class="col-md-9 col-12">
                        <div class="form-group">
                            <h4>Tên giáo viên</h4>
                            <input id="teacherName" name="name" class="form-control" type="text" placeholder="Nhập tên thể loại">
                        </div>
                        
                        <div class="form-group">
                            <h4>Môn học giảng dạy</h4>
                            <select id="id" name="category_id" class="form-select">
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.getId()}">
                                        ${category.getName()}
                                    </option>
                                </c:forEach>
                            </select>

                        </div>

                        <div class="d-md-flex d-block justify-content-end gap-3 mt-5">
                            <a href="/admin/teachers" class="text-decoration-none btn btn-sm btn-outline-danger">Huỷ</a>
                            <button type="submit" class="btn btn-sm btn-primary">Thêm</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<c:url value='/static/js/pages/add-teacher.js?v=${randomNumber}' />"></script>
