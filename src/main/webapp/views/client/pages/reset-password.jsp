<%-- 
    Document   : reset-password
    Created on : Jan 22, 2024, 9:07:18 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/auth.css?v=${randomNumber}'/>">
</head>

<div class="container mt-3">

    <div style="width: 600px; max-width: 100%;" class="mx-auto">
        <c:if test="${not empty sessionScope.resetPasswordMessage}">
            <div class="alert alert-${sessionScope.alertType} alert-dismissible fade show" role="alert">
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                <strong>${sessionScope.resetPasswordMessage}</strong> 
            </div>
        </c:if>
    </div>

    <div style="width: 600px; max-width: 100%;" class="mx-auto d-flex justify-content-center">
        <form method="POST">
            <h2 class="text-uppercase text-center fs-4">Lấy lại mật khẩu</h2>
            <p>Chúng tôi sẽ gửi cho bạn một email để kích hoạt việc đặt lại mật khẩu.</p>
            <input type="email" placeholder="Email" name="email" class="p-2" style="width: 400px;">
            <div class="button-groups mt-3">
                <button type="submit" class="border-0 bg-main px-4 py-2 rounded-2">Gửi</button>
                <a href="/login" style="color: var(--header-info-color);" class="text-decoration-none">Quay lại trang đăng nhập</a>
            </div>
        </form>
    </div>

    <div class="mx-auto" style="width: 600px; max-width: 100%">
        <div class="mt-5 auth-services">
            <div class="mb-3 text-center">Hoặc đăng nhập với</div>
            <div class="d-flex gap-2 justify-content-center">
                <a href="${googleAuthLink}" class="google-auth">
                    <i class="fa-brands fa-google"></i>
                    Google
                </a>
                <button type="button" class="facebook-auth">
                    <i class="fa-brands fa-facebook"></i>
                    Facebook
                </button>
            </div>
        </div>
    </div>

</div>