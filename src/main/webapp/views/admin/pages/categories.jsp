<%-- 
    Document   : categories
    Created on : Jan 23, 2024, 12:20:06 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <style>
        #adminCategory table td, #adminCategory table th {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>

<main id="adminCategory">
    <div class="container mt-5">
        <c:if test="${not empty sessionScope.updateCategoryMessage}">
            <div class="alert alert-${sessionScope.alertType} alert-dismissible fade show" role="alert">
                <strong>${sessionScope.updateCategoryMessage}</strong>
                <c:if test="${sessionScope.alertType eq 'danger'}">
                    Có vẻ như thể loại này vẫn đang trong chương trình giảng dạy, bạn cần xoá khoá học trước
                </c:if>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="d-flex justify-content-end">
            <a href="/admin/categories/add-category" class="d-inline-block btn btn-primary text-decoration-none">Thêm thể loại mới</a>
        </div>

        <div class="table-responsive mt-5">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tên thể loại</th>
                        <th>Sửa</th>
                        <th>Xoá</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${categories}" var="category">
                        <tr>
                            <td>${category.getName()}</td>
                            <td>
                                <a href="/admin/categories/update?id=${category.getId()}" class="text-warning text-decoration-none">
                                    <i class="fa-solid fa-pen"></i>
                                </a>
                            </td>
                            <td>
                                <button class="delete-category-btn text-danger border-0 bg-transparent" category-id="${category.getId()}">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#deleteCategoryModal" id="openDeleteCategoryModalBtn">
        Launch static backdrop modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="deleteCategoryModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="deleteCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteCategoryModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn chắc chắn có muốn xoá thể loại này?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                    <button type="button" class="btn btn-danger" id="deleteCategoryModalConfirmBtn">Xoá</button>
                </div>
            </div>
        </div>
    </div>

    <form action="" method="POST" id="deleteCategoryForm">
        <input type="hidden" name="category-id">
        <input type="hidden" name="_method" value="DELETE">
    </form>
</main>

<script src="<c:url value='/static/js/pages/admin-categories.js?v=${randomNumber}' />"></script>