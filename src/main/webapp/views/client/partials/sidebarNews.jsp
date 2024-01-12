<%-- Document : sidebarNews Created on : Nov 27, 2023, 9:42:10 PM Author : Moc Lan --%>
    <%@page import="java.util.HashMap" %>
    <%@page import="java.util.ArrayList" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@include file="/common/includes.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="<c:url value='/static/css/sidebar.css?v=${randomNumber}' />">
            <link rel="stylesheet" href="<c:url value='/static/css/news.css?v=${randomNumber}' />">
        </head>
        <aside>
            <h5 class="fs-6 text-uppercase fw-bold">Danh mục tin tức</h5> 
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
            <h5 class="fs-6 text-uppercase fw-bold">Tin tức nổi bật</h5>
                    <div class="special-news">
                        <c:forEach var="item" items="${special_news}" > 
                            <div class="piece-special-news d-flex row">
                                <div class="col-4">
                                    <img class="img-news" src="<c:url value='${item.getImgURL()}' />" alt="">
                                </div>
                                <div class="col-8">
                                    <a href="news-item?item-id=${item.getId()}">${item.getTitle()}</a>
                                </div>
                            </div> 
                            <div class="row">
                                <div class="col-4"></div>
                                <div class="col-8"><p class="sidebar-date">${item.getCreatedDate()}</p></div> 
                            </div>
                        </c:forEach>
                    </div>
        </aside>

         </html>