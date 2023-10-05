<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<head>
    <link rel="stylesheet" href="<c:url value='/static/css/login.css?v=${randomNumber}'/>">
</head>

<div class="auth-container mt-5">
    <h2 class="text-uppercase">Đăng nhập</h2>
    <p>Nếu bạn có một tài khoản, xin vui lòng đăng nhập</p>

    <form action="/auth/login" method="POST">
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
    </form>
</div>

