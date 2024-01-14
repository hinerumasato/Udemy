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
                <c:when test="${not empty cartDetails}">
                    <form method="POST" action="">
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
                                    <c:forEach items="${cartDetails}" var="cartDetail">
                                        <tr class="">
                                            <td><img src="${courseMap.get(cartDetail).getThumbnails().get(0).getImg()}" alt="${courseMap.get(cartDetail).getName()}"></td>
                                            <td>${courseMap.get(cartDetail).getName()}</td>
                                            <td class="text-danger fw-bold format-price">${courseMap.get(cartDetail).getSalePrice()}</td>
                                            <td>${cartDetail.getAmount()}</td>
                                            <td class="text-danger fw-bold format-price format-price">${cartDetail.getAmount() * courseMap.get(cartDetail).getSalePrice()}</td>
                                            <td><button><i class="fa-solid fa-trash"></i></button></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tr>
                                    <td class="right-cell" colspan="6"><span class="me-3">Tổng: <span class="fs-4 format-price text-danger fw-bold">${totalPrice}</span></span></td>
                                    <input type="hidden" name="totalPrice" value="${totalPrice}">
                                </tr>
                            </table>
    
                            <div class="checkout-wrapper d-flex justify-content-end w-100 gap-2">
                                <a href="/courses" class="text-decoration-none bg-black px-4 py-2 border-0 text-uppercase">Tiếp tục mua hàng </a>
                                <button type="submit" class="bg-main px-4 py-2 border-0 text-uppercase">Tiến hành thanh toán</button>
                            </div>
                        </div>
                    </form>
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