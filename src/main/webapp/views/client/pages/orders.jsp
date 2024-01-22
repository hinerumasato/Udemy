<%-- 
    Document   : orders
    Created on : Jan 20, 2024, 7:11:30 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/orders.css?v=${randomNumber}' />">
    <link rel="stylesheet" href="<c:url value='/static/css/account.css?v=${randomNumber}' />">
</head>

<div id="orders">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-lg-3">
                <%@include file="/views/client/partials/account-navigation.jsp" %>
            </div>
            <div class="col-12 col-lg-9">
                <c:choose>
                    <c:when test="${not empty checkouts}">
                        <h2 class="text-uppercase">Đơn hàng của bạn</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered" id="accountOrderTable">
                                <thead>
                                    <tr>
                                        <th>Đơn hàng</th>
                                        <th>Ngày</th>
                                        <th>Giá trị đơn hàng</th>
                                        <th>TT thanh toán</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${checkouts}" var="checkout">
                                        <tr>
                                            <td class="text-primary">${checkout.getId()}</td>
                                            <td>${checkout.getDate()}</td>
                                            <td class="format-price">${checkout.getTotalAmount()}</td>
                                            <c:choose>
                                                <c:when test="${checkout.getPaymentCode().equals('not-paid')}">
                                                    <td class="text-warning fw-bold">${checkout.getPaymentStatus()}</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td class="text-success fw-bold">${checkout.getPaymentStatus()}</td>
                                                </c:otherwise>
                                            </c:choose>

                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <strong>Bạn chưa mua đơn hàng nào cả</strong> <br>
                            Xem và chọn mua các khoá học <a href="/courses">tại đây</a>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</div>

<script src="<c:url value='/static/js/pages/account.js?v=${randomNumber}' />"></script>