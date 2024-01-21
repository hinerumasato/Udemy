<%-- 
    Document   : change-password
    Created on : Jan 22, 2024, 12:22:48 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/account.css?v=${randomNumber}' />">
    <link rel="stylesheet" href="<c:url value='/static/css/change-password.css?v=${randomNumber}' />">
</head>

<div id="changePassword">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-lg-3">
                <%@include file="/views/client/partials/account-navigation.jsp" %>
            </div>
            <div class="col-12 col-lg-9">
                <h2 class="text-uppercase">Đổi mật khẩu</h2>
                <p>Để đảm bảo tính bảo mật bạn vui lòng nhập lại ô xác nhận mật khẩu</p>
                <form method="POST" style="width: 400px;">
                    <div class="mb-3">
                        <label for="oldPassword" class="form-label">Mật khẩu cũ *</label>
                        <input type="password" class="form-control" id="oldPassword" name="old-password">
                    </div>
                    <div class="mb-3">
                        <label for="newPassword" class="form-label">Mật khẩu mới *</label>
                        <input type="password" class="form-control" id="newPassword" name="new-password">
                    </div>
                    <div class="mb-3">
                        <label for="newPasswordConfirmation" class="form-label">Xác nhận mật khẩu mới *</label>
                        <input type="password" class="form-control" id="newPasswordConfirmation" name="new-password-confirm">
                    </div>
                    <button type="submit" class="bg-main px-4 py-2 rounded-2 border-0 fw-bold">Đổi mật khẩu</button>
                  </form>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/static/js/pages/account.js?v=${randomNumber}' />"></script>