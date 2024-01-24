<%-- Document : news_item Created on : Dec 3, 2023, 11:24:05 PM Author : Moc Lan --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/includes.jsp" %>
<aside id="sidebar">
    <h5 class="fs-6 text-uppercase fw-bold">Tất cả sản phẩm</h5>
    <div class="d-flex justify-content-between align-items-center mt-3 fs-6">
        <h5 class="fs-6 fw-bold text-uppercase">Menu</h5>
        <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMenu" aria-expanded="true"
            aria-controls="collapseMenu">
            <i class="fa fa-chevron-right rotate90" aria-hidden="true"></i>
        </button>
    </div>

    <ul class="collapse sidebar-list sidebar-menu-list show" id="collapseMenu">
        <li><a href="/home">Trang chủ</a></li>
        <li>
            <div class="d-flex justify-content-between align-items-center">
                <a href="/courses">Danh sách khoá học</a>
                <button class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCourses"
                    aria-expanded="false" aria-controls="collapseExample">
                    <i class="fa fa-chevron-right" aria-hidden="true"></i>
                </button>
            </div>
            <ul class="collapse" id="collapseCourses">
                <c:forEach items="${categories}" var="category" varStatus="status">
                    <li><a href="/courses/${category.getCode()}" class="text-decoration-none" style="color: #92909A;">${category.getName()}</a></li>
                </c:forEach>
            </ul>
        </li>
        <li><a href="/news">Tin tức</a></li>
        <li><a href="/reviews">Đánh giá</a></li>
        <li><a href="/about">Giới thiệu</a></li>
        <li><a href="/courses/love">Khoá học yêu thích</a></li>
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

    <script src="<c:url value='/static/js/utils/pagination.js?v=${randomNumber}' />"></script>
    <script src="<c:url value='/static/js/partials/sidebar.js?v=${randomNumber}' />"></script>
</aside>