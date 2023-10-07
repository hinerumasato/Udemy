<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<head>
    <link rel="stylesheet" href="<c:url value='/static/css/auth.css?v=${randomNumber}'/>">
</head>

<div class="auth-container mt-5">
    <h2 class="text-uppercase">Đăng nhập</h2>
    <p>Nếu bạn có một tài khoản, xin vui lòng đăng nhập</p>

    <form action="/auth/login" method="POST" id="loginForm">

        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>${error}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show text-center" role="alert">
                <strong>${message}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="form-group mt-3">
            <label for="loginEmail" class="fw-bold">Email *</label>
            <input type="email" name="email" id="loginEmail" placeholder="example@gmail.com" required>
        </div>

        <div class="form-group my-3">
            <label for="loginPassword" class="fw-bold">Mật khẩu *</label>
            <input type="password" name="password" id="loginPassword" placeholder="password" required>
        </div>

        <button type="submit" class="d-block w-100 btn-main-auth">Đăng nhập</button>

        <p>Bạn chưa có tài khoản? <a href="/register" class="text-danger">Đăng ký tại đây</a></p>
        <p>Bạn quên mật khẩu? <a href="" class="text-danger text-decoration-none">Lấy lại tại đây</a></p>

        <div class="mt-5 auth-services">
            <div class="mb-3">Hoặc đăng nhập với</div>
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
    </form>
</div>

<script src="<c:url value='/static/js/auth/form.js' />"></script>