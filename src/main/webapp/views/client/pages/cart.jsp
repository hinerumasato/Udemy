<%-- Document : cart Created on : Jan 12, 2024, 4:15:24 PM Author : thang --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/includes.jsp" %>

<div class="container mt-5">
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
                        <table class="table table-primary">
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
                                        <td class="format-price">${courseMap.get(cart).getSalePrice()}</td>
                                        <td class="format-price">${cart.getAmount()}</td>
                                        <td class="format-price">${cart.getAmount() * courseMap.get(cart).getSalePrice()}</td>
                                        <td class="format-price"><i class="fa-solid fa-trash"></i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
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