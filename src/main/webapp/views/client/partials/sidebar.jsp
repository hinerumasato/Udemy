<%-- 
    Document   : sidebar
    Created on : Oct 13, 2023, 9:52:57 PM
    Author     : Masato
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/sidebar.css?v=${randomNumber}' />">
</head>

<aside>
    <h5 class="fs-6 text-uppercase fw-bold">Tất cả sản phẩm</h5>
    <div class="d-flex justify-content-between align-items-center mt-3 fs-6">
        <h5 class="fs-6 fw-bold text-uppercase">Menu</h5>
        <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMenu" aria-expanded="true"
            aria-controls="collapseMenu">
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

    <div class="d-flex justify-content-between align-items-center mt-3 fs-6">
        <h5 class="fs-6 fw-bold text-uppercase">Trình độ</h5>
        <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseLevel" aria-expanded="true"
            aria-controls="collapseLevel">
            <i class="fa fa-chevron-right rotate90" aria-hidden="true"></i>
        </button>
    </div>

    <ul class="collapse level_list show" id="collapseLevel">
        <c:forEach items="${levels}" var="level">
            <li class="d-flex align-items-center gap-2">
                <input field="level" type="checkbox" name="level[]" value="${level.getId()}" id="">
                <span>${level.getValue()}</span>
            </li>
        </c:forEach>
    </ul>

    <div class="d-flex justify-content-between align-items-center mt-3 fs-6">
        <h5 class="fs-6 fw-bold text-uppercase">Mức giá</h5>
        <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePrice" aria-expanded="true"
            aria-controls="collapsePrice">
            <i class="fa fa-chevron-right rotate90" aria-hidden="true"></i>
        </button>
    </div>

    <ul class="collapse price_list show" id="collapsePrice">
        
        <c:forEach begin="0" end="${priceMap.size() - 1}" varStatus="status">
            <li class="d-flex align-items-center gap-2">
                <input field="price" type="checkbox" name="price" value="${priceValueMap.get(status.index)}" id="">
                <span>${priceMap.get(status.index)}</span>
            </li>
        </c:forEach>
    </ul>

    <div class="d-flex justify-content-between align-items-center mt-3 fs-6">
        <h5 class="fs-6 fw-bold text-uppercase">Thời lượng khoá</h5>
        <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTime" aria-expanded="true"
            aria-controls="collapseTime">
            <i class="fa fa-chevron-right rotate90" aria-hidden="true"></i>
        </button>
    </div>

    <ul class="collapse show time_list" id="collapseTime">
        <%
            HashMap<Integer, String> timeMap = new HashMap<Integer, String>();
            timeMap.put(0, "2 giờ");
            timeMap.put(1, "3 giờ");
            timeMap.put(2, "4 giờ");
            timeMap.put(3, "5 giờ");
        %>
        <c:set var="timeList" value="<%= new ArrayList(timeMap.values()) %>" />
        <c:forEach items="${timeList}" var="time">
            <li class="d-flex align-items-center gap-2">
                <input field="time" type="checkbox" value="${time}" name="" id="">
                <span>${time}</span>
            </li>
        </c:forEach>
    </ul>

    <script type="module" src="<c:url value='/static/js/partials/sidebar.js?v=${randomNumber}' />"></script>
</aside>