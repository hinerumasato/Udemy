<%-- 
    Document   : sidebar
    Created on : Oct 13, 2023, 9:52:57 PM
    Author     : Masato
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/sidebar.css?v=${randomNumber}' />">
</head>

<aside>
    <h5 class="fs-4 text-uppercase fw-bold">Tất cả sản phẩm</h5>
    <div class="d-flex justify-content-between align-items-center fs-4">
        <h5 class="fw-bold text-uppercase">Menu</h5>
        <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMenu"
            aria-expanded="true" aria-controls="collapseExample">
            <i class="fa fa-chevron-right rotate90" aria-hidden="true"></i>
        </button>
    </div>

    <ul class="collapse sidebar-list sidebar-menu-list show" id="collapseMenu">
        <li>Trang chủ</li>
        <li>
            <div class="d-flex justify-content-between align-items-center">
                <span>Danh sách khoá học</span>
                <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCourses"
                    aria-expanded="false" aria-controls="collapseExample">
                    <i class="fa fa-chevron-right" aria-hidden="true"></i>
                </button>    
            </div>
            <ul class="collapse" id="collapseCourses">
                <c:forEach items="${categories}" var="category" varStatus="status">
                    <li>${category.getName()}</li>
                </c:forEach>
            </ul>
        </li>
        <li>Khoá học tiêu biểu</li>
        <li>Tin tức</li>
        <li>Liên hệ</li>
        <li>Giới thiệu</li>
    </ul>

    <script src="<c:url value='/static/js/partials/sidebar.js?v=${randomNumber}' />"></script>
</aside>