<%-- 
    Document   : account
    Created on : Jan 20, 2024, 6:11:53 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/account.css?v=${randomNumber}' />">
</head>

<div id="account">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-lg-3">
                <%@include file="/views/client/partials/account-navigation.jsp" %>
            </div>
            <div class="col-12 col-lg-9">
                <h2 class="text-uppercase">Thông tin tài khoản</h2>
                <div class="account-info-group">
                    <strong>Họ tên:</strong>
                    <span>${loginUser.getFirstName()} ${loginUser.getLastName()}</span>
                </div>
                <div class="account-info-group">
                    <strong>Email: </strong>
                    <span>${loginUser.getUsername()}</span>
                </div>
                <div class="account-info-group">
                    <strong>Điện thoại: </strong>
                    <span>${loginUser.getPhone()}</span>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/static/js/pages/account.js?v=${randomNumber}' />"></script>