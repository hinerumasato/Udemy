<%-- 
    Document   : sidebarNews
    Created on : Nov 27, 2023, 9:42:10 PM
    Author     : Moc Lan
--%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<c:url value='/static/css/sidebar.css?v=${randomNumber}' />">
    </head>
    <aside>
        <ul class="collapse silebar-list  sidebar-menu-list show">
            <li>Trang chủ</li>
            <li>
                <div class="d-flex justify-content-between align-items-center">
                    <span>Danh mục tin tức</span>
                    <button class="btn" type="button" data-bs-toogle="collapse" data-bs-target="#collaspeCourses"
                        aria-expanded="false" aria-controls="collapseExample">
                        <i class="fa fa-chevron-right" aria-hidden="true"></i>
                    </button>
                </div>
            </li>
            <li>Khóa học tiêu biểu</li>
            <li>Tin tức</li>
            <li>Liên hệ</li>
            <li>Giới thiệu</li>
        </ul>
    </aside>
</html>
