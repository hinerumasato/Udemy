<%-- Document : cart Created on : Jan 12, 2024, 4:15:24 PM Author : thang --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/cart.css?v=${randomNumber}' />">
</head>

<div id="cart" class="container mt-5">
    <c:choose>
        <c:when test="${not empty notLoginMessage}">
            <div class="alert alert-danger" role="alert">
                ${notLoginMessage}
            </div>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${not empty carts}">
                    <div class="table-responsive">
                        <table class="table table-bordered center-cell">
                            <thead>
                                <tr>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Đơn giá</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Thành tiền</th>
                                    <th scope="col">Xoá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${carts}" var="cart">
                                    <tr class="">
                                        <td><img src="${courseMap.get(cart).getThumbnails().get(0).getImg()}" alt="${courseMap.get(cart).getName()}"></td>
                                        <td>${courseMap.get(cart).getName()}</td>
                                        <td class="text-danger fw-bold format-price">${courseMap.get(cart).getSalePrice()}</td>
                                        <td>${cart.getAmount()}</td>
                                        <td class="text-danger fw-bold format-price format-price">${cart.getAmount() * courseMap.get(cart).getSalePrice()}</td>
                                        <td><button><i class="fa-solid fa-trash"></i></button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tr>
                                <td class="right-cell" colspan="6"><span class="me-3">Tổng: <span class="fs-4 format-price text-danger fw-bold">${totalPrice}</span></span></td>
                            </tr>
                        </table>

                        <div class="checkout-wrapper d-flex justify-content-end w-100 gap-2">
                            <a href="/courses" class="text-decoration-none bg-black px-4 py-2 border-0 text-uppercase">Tiếp tục mua hàng </a>
                            <button class="bg-main px-4 py-2 border-0 text-uppercase">Tiến hành thanh toán</button>
                        </div>
                    </div>
                </c:when>  
                <c:otherwise>
                    <div class="alert alert-primary" role="alert">
                        Chưa có gì trong giỏ hàng
                    </div>
                </c:otherwise>
            </c:choose>

        </c:otherwise>
    </c:choose>
</div>

<script src="<c:url value='/static/js/pages.cart.js?v=${randomNumber}' />"></script>