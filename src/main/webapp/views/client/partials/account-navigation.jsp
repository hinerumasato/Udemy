
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<div class="account-navigation">
    <h2 class="text-uppercase">Trang tài khoản</h2>
    <strong>Xin chào, <span class="text-main">${loginUser.getFirstName()} ${loginUser.getLastName()}</span></strong>

    <ul class="list-unstyled account-nav-list mt-3">
        <li class="py-2">
            <a href="/account" class="text-decoration-none d-block w-100 h-100">Thông tin tài khoản</a>
        </li>

        <li class="py-2">
            <a href="/account/orders" class="text-decoration-none d-block w-100 h-100">Đơn hàng của bạn</a>
        </li>

        <li class="py-2">
            <a href="/account/change-password" class="text-decoration-none d-block w-100 h-100">Đổi mật khẩu</a>
        </li>
    </ul>
</div>