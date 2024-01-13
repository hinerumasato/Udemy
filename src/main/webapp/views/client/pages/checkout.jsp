<%-- 
    Document   : checkout
    Created on : Jan 13, 2024, 6:03:56 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<head>
    <link rel="stylesheet" href="<c:url value='/static/css/checkout.css?v=${randomNumber}' />">
</head>

<div class="container">
    <form method="POST" action="">
        <div class="row">
            <div class="col-12 col-md-7 mt-5">
                <h2 class="checkout-title">Cổng thanh toán trên Udemy</h2>
                <h4>Thông tin đơn hàng</h4>

                <div class="form-floating mb-3">
                    <input name="email" type="text" class="form-control" id="checkoutEmail" placeholder="name@example.com">
                    <label for="checkoutEmail">Email</label>
                </div>

                <div class="form-floating mb-3">
                    <input name="fullName" type="text" class="form-control" id="checkoutFullName" placeholder="name@example.com">
                    <label for="checkoutFullName">Họ và tên</label>
                </div>

                <div class="form-floating mb-3">
                    <input name="phone" type="text" class="form-control" id="checkoutPhone" placeholder="name@example.com">
                    <label for="checkoutPhone">Số điện thoại</label>
                </div>

                <div class="form-floating mb-3">
                    <textarea name="description" type="text" class="form-control" id="checkoutDescription" placeholder="name@example.com" style="height: 100px;"></textarea>
                    <label for="checkoutDescription">Ghi chú</label>
                </div>

            </div>
            <div class="checkout-info col-12 col-md-5">
                <div class="checkout-title">
                    <h4 class="checkout-amount">Đơn hàng (${cartDetails.size()} sản phẩm)</h4>
                </div>

                <div class="checkout-courses">
                    <c:forEach items="${cartDetails}" var="cartDetail">
                        <div class="row align-items-center">
                            <div class="col-2">
                                <div class="amount-wrapper">
                                    <img class="w-100 checkout-cousre-thumbnail" src="${thumbnailMap.get(courseMap.get(cartDetail)).getImg()}" alt="">
                                    <div class="checkout-course-amount">${cartDetail.getAmount()}</div>
                                </div>

                            </div>
                            <div class="col-7">
                                <div>${courseMap.get(cartDetail).getName()}</div>
                                <small class="text-secondary">${levelMap.get(courseMap.get(cartDetail)).getValue()}</small>
                            </div>
                            <div class="col-3">
                                <span class="text-secondary checkout-course-price format-price">${courseMap.get(cartDetail).getSalePrice()}</span>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="checkout-total-tempotary">
                    <div class="d-flex justify-content-between">
                        <span>Tạm tính</span>
                        <span class="format-price">${totalPrice}</span>
                    </div>

                    <div class="d-flex justify-content-between">
                        <span>Giảm giá</span>
                        <span class="format-price">${totalPrice * checkout.getDiscount()}</span>
                    </div>
                </div>

                <div class="checkout-total">
                    <div class="d-flex justify-content-between">
                        <span>Tổng cộng</span>
                        <span  class="total-price format-price">${checkout.getTotalAmount() - totalPrice * checkout.getDiscount()}</span>
                        <input type="hidden" name="${checkout.getTotalAmount() - totalPrice * checkout.getDiscount()}">
                    </div>
                </div>

                <div class="checkout-footer">
                    <div class="d-flex justify-content-between align-items-center">
                        <a checkout-id="${checkout.getId()}" id="returnToCart" href="/cart">Quay về giỏ hàng</a>
                        <button type="submit">Đặt hàng</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="<c:url value='/static/js/pages/checkout.js?v=${randomNumber}' />"></script>
