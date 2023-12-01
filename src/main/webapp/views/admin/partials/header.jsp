<%-- 
    Document   : header
    Created on : Oct 15, 2023, 1:17:16 PM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary border-bottom">
        <div class="container-fluid container-md">
            <a class="navbar-brand" href="/admin">
                <img width="50" height="50" src="<c:url value="/static/imgs/logo/udemy.1024x1024.png" />" alt="alt"/>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/admin">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Chức năng
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/admin/product/add-product">Thêm sản phẩm</a></li>
                            <li><a class="dropdown-item" href="#">Xem sản phẩm đã xoá</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Nhập tên sản phẩm ..." aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>
</header>