<%-- Document : sidebarNews Created on : Nov 27, 2023, 9:42:10 PM Author : Moc Lan --%>
    <%@page import="java.util.HashMap" %>
    <%@page import="java.util.ArrayList" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@include file="/common/includes.jsp" %>
        <!DOCTYPE html>
        <html>

        <head>
            <link rel="stylesheet" href="<c:url value='/static/css/sidebar.css?v=${randomNumber}' />">
            <link rel="stylesheet" href="<c:url value='/static/css/news.css?v=${randomNumber}' />">
        </head>
        <aside>
            <h5 class="fs-6 text-uppercase fw-bold pt-2">Danh mục tin tức</h5> 
            <ul class="collapse sidebar-list sidebar-menu-list show" style="display: flex; flex-direction: column;" id="collapseMenu">
                <li>Trang chủ</li>
                <li class="dropdown" style=" display: flex;flex-direction: column;">
                    <div>
                        <span>Danh sách khoá học</span>
                        <button class="btn" type="button" aria-expanded="false">
                            <i class="fa fa-chevron-right right" aria-hidden="true"></i>
                            <i class="fa fa-chevron-down down" aria-hidden="true"></i>
                    </div>
                    <ul class="menu">
                        <li><a class="nav-item" href="/courses/language">Kỹ năng ngoại ngữ</a></li>
                        <li><a class="nav-item" href="/courses/self-development">Phát triển bản thân</a></li>
                        <li><a class="nav-item" href="/courses/sales">Sales, bán hàng</a></li>
                        <li><a class="nav-item" href="/courses/life">Phong cách sống</a></li>
                        <li><a class="nav-item" href="/courses/graphics">Thiết kế đồ họa</a></li>
                        <li><a class="nav-item" href="/courses/computer">Tin học văn phòng</a></li>
                        <li><a class="nav-item" href="/courses/it">Công nghệ thông tin</a></li>
                        <li><a class="nav-item" href="/courses/camera">Nhiếp ảnh, quay phim</a></li>
                        <li><a class="nav-item" href="/courses/marketing">Marketing</a></li>
                        <li><a class="nav-item" href="/courses/startup">Kinh doan khởi nghiệp</a></li>
                        <li><a class="nav-item" href="/courses/health">Sức khỏe, giới tính</a></li>
                        <li><a class="nav-item" href="/courses/family">Gia đình</a></li>
                    </ul>
                </li>
                <li>Khoá học tiêu biểu</li>
                <li>Tin tức</li>
                <li>Liên hệ</li>
                <li>Giới thiệu</li>
            </ul>
            <h5 class="fs-6 text-uppercase fw-bold">Tin tức nổi bật</h5>
                    <div class="special-news">
                        <c:forEach var="item" items="${specialNews}" > 
                            <div class="piece-special-news row pt-3">
                                <div class="d-flex">
                                    <div class="thumbnail">
                                        <img class="img-news" src="<c:url value='${item.getImgURL()}' />" alt="">
                                    </div>
                                    <div class="title">
                                        <a href="/news/details/${item.getSlug()}">${item.getTitle()}</a>
                                    </div>
                                </div>
                            </div> 
                            <div class="row pt-1">
                                <div class="d-flex">
                                    <div class="thumbnail"></div>
                                    <div class="title"><p class="sidebar-date">${item.getCreatedDate()}</p></div> 
                                </div>
                            </div>
                        </c:forEach>
                    </div>
        </aside>
<script>
const btn = document.querySelector("button.btn");
const show = document.querySelector(".menu");
const down = document.querySelector("down");
const right = document.querySelector("right");


btn.addEventListener("click", function(e) {
    e.preventDefault;
    show.classList.toggle('open')
    down.classList.toggle('show');
    right.classList.toggle('clear');
});
</script>
         </html>