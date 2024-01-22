<%-- Document : reset-password-process Created on : Jan 22, 2024, 10:43:14 PM Author : thang --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/includes.jsp" %>
<div class="container mt-5">
    <h2 class="text-uppercase">Đặt lại mật khẩu mới</h2>
    <p>Để đảm bảo tính bảo mật bạn vui lòng nhập lại ô xác nhận mật khẩu</p>
    <c:if test="${not empty sessionScope.changePasswordMessage}">
        <div class="alert alert-${sessionScope.alertType} alert-dismissible fade show" role="alert">
            <strong>${sessionScope.changePasswordMessage}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <form method="POST" style="width: 400px;" id="setNewPasswordForm">
        <div class="mb-3">
            <label for="newPassword" class="form-label">Mật khẩu mới *</label>
            <input type="password" class="form-control" id="newPassword" name="new-password">
        </div>
        <div class="mb-3">
            <label for="newPasswordConfirmation" class="form-label">Xác nhận mật khẩu mới *</label>
            <input type="password" class="form-control" id="newPasswordConfirmation"
                name="new-password-confirm">
            <span class="text-danger password-alert d-none">
                <i class="fa-solid fa-xmark"></i>
                Nhập lại mật khẩu chưa khớp
            </span>
        </div>
        <input type="hidden" name="user-id" value="${user.getId()}">
        <button type="submit" class="bg-main px-4 py-2 rounded-2 border-0 fw-bold">Đổi mật khẩu mới</button>
    </form>
</div>

<script src="<c:url value='/static/js/pages/change-password.js?v=${randomNumber}' />"></script>