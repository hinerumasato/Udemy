<%-- 
    Document   : login
    Created on : Jan 20, 2024, 12:09:26 AM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<div class="container mt-5">
    <h1 class="text-center text-uppercase">Đăng nhập admin</h1>
    <c:if test="${not empty sessionScope.adminLoginMessage}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>${sessionScope.adminLoginMessage}</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>


    <form method="POST" action="/auth/login-admin">
        <div class="form-floating mb-3">
            <input type="email" class="form-control" id="adminEmail" name="adminEmail" placeholder="name@example.com" required>
            <label for="adminEmail">Email address</label>
        </div>

        <div class="form-floating">
            <input type="password" class="form-control" id="adminPassword" name="adminPassword" placeholder="Password" required>
            <label for="adminPassword">Password</label>
        </div>

        <!-- Submit button -->
        <div class="d-flex justify-content-between align-items-center">
            <a href="/home">Quay lại trang người dùng</a>
            <button type="submit" class="btn btn-primary btn-block mb-4 mt-4">Đăng nhập</button>
        </div>
    </form>
</div>