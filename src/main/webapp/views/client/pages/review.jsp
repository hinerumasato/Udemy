<%-- 
    Document   : review
    Created on : Jan 24, 2024, 5:09:35 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<head>
    <link rel="stylesheet" href="<c:url value='/static/css/review.css?v=${randomNumber}' />">    
</head>

<main id="reviewPage">
    <div class="container mt-5">
        <section id="testimonials">
            <!--heading--->
            <div class="testimonial-heading">
                <h4 class="text-uppercase">Review về Udemy</h4>
            </div>
            <!--testimonials-box-container------>
            <div class="testimonial-box-container">
                <!--BOX--------------->
                <c:forEach items="${reviews}" var="review">
                    <div class="testimonial-box">
                        <!--top------------------------->
                        <div class="box-top">
                            <!--profile----->
                            <div class="profile">
                                <!--img---->
                                <div class="profile-img">
                                    <img src="https://cdn3.iconfinder.com/data/icons/web-design-and-development-2-6/512/87-1024.png" />
                                </div>
                                <!--name-and-username-->
                                <div class="name-user">
                                    <strong>${userMap.get(review).getLastName()}</strong>
                                    <span>${userMap.get(review).getUsername()}</span>
                                </div>
                            </div>
                            <!--reviews------>
                            <div class="reviews">
                                <c:forEach begin="1" end="${review.getRateAmount()}">
                                    <i class="fas fa-star"></i>
                                </c:forEach>
        
                                <c:forEach begin="${review.getRateAmount() + 1}" end="5">
                                    <i class="far fa-star"></i><!--Empty star-->
                                </c:forEach>                        
                            </div>
                        </div>
                        <!--Comments---------------------------------------->
                        <div class="client-comment">
                            <p>${review.getContent()}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <div class="button-wrapper d-flex justify-content-center">
            <button id="addNewReviewBtn" class="bg-main text-uppercase border-0 fw-bold px-4 py-2">
                <i class="fa-solid fa-user-plus"></i>
                Thêm review của bạn
            </button>
        </div>

        <button class="d-none" data-bs-toggle="modal" data-bs-target="#reviewModal" id="openReviewModalBtn"></button>
    </div>
    
    <!-- Modal -->
    <div class="modal fade" id="reviewModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reviewModalLabel">Đánh giá chất lượng trang web</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h3 class="text-center">Chất lượng: </h3>
                    <div class="modal-stars d-flex justify-content-center mb-3">
                        <i class="far fa-star" index="0"></i>
                        <i class="far fa-star" index="1"></i>
                        <i class="far fa-star" index="2"></i>
                        <i class="far fa-star" index="3"></i>
                        <i class="far fa-star" index="4"></i>
                        <input type="hidden" name="rateAmount" value="" id="rateAmount">
                    </div>
                    <textarea name="" class="w-100 form-control" id="reviewContent" placeholder="Viết đánh giá vào đây" style="height: 100px;"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="closeReviewModalBtn">Đóng</button>
                    <button type="button" class="btn btn-primary" id="sendReviewBtn">Gửi</button>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="<c:url value='/static/js/pages/review.js?v=${randomNumber}' />"></script>
