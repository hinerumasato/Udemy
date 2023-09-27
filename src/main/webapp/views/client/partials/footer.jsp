<%-- Document : newjsp Created on : Sep 19, 2023, 2:13:31 PM Author : Masato --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>

            <head>
                <link rel="stylesheet" href="<c:url value= '/static/css/footer.css?v=${randomNumber}'/>" />
            </head>

            <footer>
                <div class="container footer-container">
                    <div class="footer-left">
                        <div class="logo-footer-img">
                            <img src="<c:url value ='static/imgs/logo/logo-footer.png' />">
                        </div>
                        <div class="icon-footer">
                            <i class="icon fa-solid fa-phone"></i>
                            <i class="icon fa-brands fa-instagram"></i>
                            <i class="icon fa-brands fa-facebook-f"></i>
                            <i class="icon fa-brands fa-youtube"></i>
                        </div>
                        <div>
                            <p>ĐĂNG KÍ ĐỂ NHẬN TIN</p>
                            <form id="email-form" action="">
                                <div class="group-form">
                                    <input type="text" class="input-text" name="email" placeholder="Nhập email của bạn">
                                    <button class="send-button">Gửi</button>
                                </div>
                                <div class="contact">
                                    <i class="icon-contact fa-solid fa-location-dot"></i>
                                    <p>266 Đội Cấn, Liễu Giai, Hà Nội,</p>
                                </div>
                                <div class="contact">
                                    <i class="icon-contact fa-solid fa-phone"></i>
                                    <p>1900 6750</p>
                                </div>
                                <div class="contact">
                                    <i class="icon-contact fa-solid fa-envelope"></i>
                                    <p>aventteam@gmail.com</p>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="footer-right">
                        <div class="top-about-footer-udemy-list">
                            <div class="about-footer-udemy-list">
                                <p class="title-about"><strong>VỀ UDEMY</strong></p>
                                <p>Trang chủ</p>
                                <p>Danh sách khóa học</p>
                                <p>Khóa học tiêu biểu</p>
                                <p>Tin tức</p>
                                <p>Liên hệ</p>
                                <p>Giới thiệu</p>
                            </div>
                            <div class="about-footer-udemy-list">
                                <p class="title-about"><strong>TRỢ GIÚP</strong></p>
                                <p>Trang chủ</p>
                                <p>Danh sách khóa học</p>
                                <p>Khóa học tiêu biểu</p>
                                <p>Tin tức</p>
                                <p>Liên hệ</p>
                                <p>Giới thiệu</p>
                            </div>
                            <div class="about-footer-udemy-list">
                                <p class="title-about"><strong>HỢP TÁC LIÊN KẾT</strong></p>
                                <p>Trang chủ</p>
                                <p>Danh sách khóa học</p>
                                <p>Khóa học tiêu biểu</p>
                                <p>Tin tức</p>
                                <p>Liên hệ</p>
                                <p>Giới thiệu</p>
                            </div>
                        </div>
                        <div class="bottom-about-footer-udemy-list">
                            <p><strong>HÌNH THỨC THANH TOÁN</strong></p>
                            <img class = "payment" src="<c:url value='/static/imgs/courses/payment.png' />">
                        </div>
                    </div>
                </div>
            </footer>