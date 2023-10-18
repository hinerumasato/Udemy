<%-- 
    Document   : email
    Created on : Oct 18, 2023, 12:33:09 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<header class="bg-white p-3">
    <div class="container">
        <div class="d-flex justify-content-between">
            <div class="app-logo">
                <img width="50" height="50" src="<c:url value='/static/imgs/logo/udemy.1024x1024.png' />" alt="">
            </div>
            <div class="actions">
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown"
                        aria-expanded="false">
                        ${loginUser.getLastName()}
                    </button>
                    <ul class="dropdown-menu">
                        <form action="/auth/logout" method="POST" id="logoutEmailVerifyForm">
                            <li class="dropdown-item" style="cursor: pointer;" onclick="() => {document.getElementById('logoutBtn').click()}">
                                <a id="logoutBtn">Đăng xuất</a>
                            </li>
                        </form>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</header>

<div class="container mt-5 bg-body-tertiary p-5">
    <div style="width: 600px; margin: 0 auto;"
        class="shadow p-5 pb-2 d-flex flex-column align-items-center justify-content-center">
        <img width="106" height="106"
            src="<c:url value='/static/imgs/logo/email-verification-icon.png' />"
            alt="">
        <h1>Xác thực Email</h1>
        <p>
            Chúng tôi đã gửi email đến <span class="text-main">${loginUser.getUsername()}</span> để xác minh tính hợp lệ của địa chỉ email của bạn. Sau
            khi nhận được email, hãy làm theo liên kết được cung cấp để hoàn tất quá trình đăng ký của bạn.
        </p>

        <p class="border-top w-100 py-2">
            Bạn không nhận được email? <a href="" class="fw-bold">Click vào đây để gửi lại email xác thực</a>
        </p>
    </div>
</div>
<script>
    (function () {
        const logoutBtn = document.getElementById('logoutBtn');
        const logoutForm = document.getElementById('logoutEmailVerifyForm');

        logoutBtn.onclick = () => {
            logoutForm.submit();
        }
    })();
</script>