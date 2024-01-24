<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<html lang="vi">
<head>
    <style>
        #adminNews table td, #adminNews table th {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>
<main id="adminNews">
    <div class="container mt-5">
        <c:if test="${not empty sessionScope.updateNewsMessage}">
            <div class="alert alert-${sessionScope.alertType} alert-dismissible fade show" role="alert">
                <strong>${sessionScope.updateNewsMessage}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <div class="d-flex justify-content-end">
            <a href="/admin/news/add-news" class="d-inline-block btn btn-primary text-decoration-none">Thêm tin tức mới</a>
        </div>

        <div class="table-responsive mt-5">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tiêu đề</th>
                        <th>Tác giả</th>
                        <th>Ngày đăng</th>
                        <th>Sửa</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${news}" var="newsItem">
                        <tr>
                            <td>${newsItem.getTitle()}</td>
                            <td>${newsItem.getAuthor()}</td>
                            <td>${newsItem.getCreatedDate()}</td>
                            <td>
                                <a href="/admin/news/update?id=${newsItem.getId()}" class="text-warning text-decoration-none">
                                    <i class="fa-solid fa-pen"></i>
                                </a>
                            </td>
                            <td>
                                <button class="delete-news-btn text-danger border-0 bg-transparent" news-id="${newsItem.getId()}">
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
    <button type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#deleteNewsModal" id="openDeleteNewsModalBtn">
        Launch static backdrop modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="deleteNewsModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="deleteNewsModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteNewsModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn chắc chắn có muốn xoá thể loại này?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                    <button type="button" class="btn btn-danger" id="deleteNewsModalConfirmBtn">Xoá</button>
                </div>
            </div>
        </div>
    </div>

    <form action="" method="POST" id="deleteNewsForm">
        <input type="hidden" name="news-id">
        <input type="hidden" name="_method" value="DELETE">
    </form>
</main>
<script src="<c:url value='/static/js/pages/admin-news.js?v=${randomNumber}' />"></script>
</html>