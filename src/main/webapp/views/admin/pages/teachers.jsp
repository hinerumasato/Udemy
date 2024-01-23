<%-- 
    Document   : teachers
    Created on : Jan 23, 2024, 5:57:30 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <style>
        #updateTeacher table td, #updateTeacher table th {
            text-align: center;
            vertical-align: middle;
        }
    </style>
</head>

<main id="updateTeacher">
    <div class="container mt-5">
        <c:if test="${not empty sessionScope.updateTeacherMessage}">
            <div class="alert alert-${sessionScope.alertType} alert-dismissible fade show" role="alert">
                <strong>${sessionScope.updateTeacherMessage}</strong>
                <c:if test="${sessionScope.alertType eq 'danger'}">
                    Có vẻ như giáo viên này vẫn đang trong chương trình giảng dạy, bạn cần xoá khoá học trước
                </c:if>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="table-responsive mt-5">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Tên giáo viên</th>
                        <th>Bộ môn</th>
                        <th>Sửa</th>
                        <th>Xoá</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${teachers}" var="teacher">
                        <tr>
                            <td>${teacher.getName()}</td>
                            <td>${categoryMap.get(teacher).getName()}</td>
                            <td>
                                <a href="/admin/teachers/update?id=${teacher.getId()}" class="text-warning text-decoration-none">
                                    <i class="fa-solid fa-pen"></i>
                                </a>
                            </td>
                            <td>
                                <button class="delete-teacher-btn text-danger border-0 bg-transparent" teacher-id="${teacher.getId()}">
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
    <button type="button" class="btn btn-primary d-none" data-bs-toggle="modal" data-bs-target="#deleteTeacherModal" id="openDeleteTeacherModalBtn">
        Launch static backdrop modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="deleteTeacherModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
         aria-labelledby="deleteTeacherModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteTeacherModalLabel">Thông báo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn chắc chắn có muốn xoá giáo viên này?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                    <button type="button" class="btn btn-danger" id="deleteTeacherModalConfirmBtn">Xoá</button>
                </div>
            </div>
        </div>
    </div>

    <form action="" method="POST" id="deleteTeacherForm">
        <input type="hidden" name="teacher-id">
        <input type="hidden" name="_method" value="DELETE">
    </form>
</main>

<script src="<c:url value='/static/js/pages/admin-teachers.js' />"></script>