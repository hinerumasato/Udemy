<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/admin/main.css?v=${randomNumber}' />">
</head>

<main id="main">

    <div class="container mt-5">
        <div class="row row-cols-1 row-cols-md-2">
            <div class="col">
                <div class="card card-01">
                    <div class="icon">
                        <i class="fas fa-book"></i>
                    </div>
                    <div class="title">Xem danh sách khoá học</div>
                    <div class="desc">Danh sách tất cả khoá học trên hệ thống</div>
                    <a href="/admin/courses" class="link">Xem ngay</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-02">
                    <div class="icon">
                        <i class="fas fa-tags"></i>
                    </div>
                    <div class="title">Xem danh sách thể loại</div>
                    <div class="desc">Danh sách tất cả thể loại khoá học trên hệ thống</div>
                    <a href="/admin/categories" class="link">Xem ngay</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-03">
                    <div class="icon">
                        <i class="fas fa-chalkboard-teacher"></i>
                    </div>
                    <div class="title">Xem danh sách giáo viên</div>
                    <div class="desc">Danh sách tất cả giáo viên trên hệ thống</div>
                    <a href="/admin/teachers" class="link">Xem ngay</a>
                </div>
            </div>
            <div class="col">
                <div class="card card-04">
                    <div class="icon">
                        <i class="fas fa-newspaper"></i>
                    </div>
                    <div class="title">Xem danh sách tin tức</div>
                    <div class="desc">Danh sách tất cả tin tức trên hệ thống</div>
                    <a href="/admin/news" class="link">Xem ngay</a>
                </div>
            </div>
        </div>

        <div class="checkout-chart">
            <canvas id="checkoutChart" ></canvas>
        </div>

    </div>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js" integrity="sha512-TW5s0IT/IppJtu76UbysrBH9Hy/5X41OTAbQuffZFU6lQ1rdcLHzpU5BzVvr/YFykoiMYZVWlr/PX1mDcfM9Qg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="<c:url value='/static/js/pages/main.js?v=${randomNumber}' />"></script>
</main>
