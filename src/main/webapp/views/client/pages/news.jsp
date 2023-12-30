<%-- Document : news Created on : Nov 27, 2023, 9:24:03 PM Author : Moc Lan --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/includes.jsp" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="<c:url value=" /static/css/news.css?v=${randomNumber}" />">
</head>

<body>
    <div class="container">
        <div class="content">
            <div class="row">
                <div class="col col-12 d-none d-md-block col-md-3">
                    <div class="left-news">
                        <%@include file="/views/client/partials/sidebarNews.jsp" %>
                    </div>
                </div> 
                <div class="col col-12 col-md-9 py-5">
                    <div class="right-news">
                        <c:forEach var="item" items="${list_news}">
                            <div class="news-item d-flex shadow pt-4 pb-4">
                                <button>
                                    <img class="img-news" src="<c:url value='${item.getImgURL()}'/>" alt="">
                                </button>
                                <div class="content-news">
                                    <a href="news-item?item-id=${item.getId()}" class="content-text">${item.getTitle()}</a>
                                    <div class=" d-flex pb-2 pt-3">
                                        <div class="d-flex nav-item">
                                            <i class="fa-regular fa-user" ></i>
                                            <p>${item.getAuthor()}</p>
                                        </div>
                                        <div class="d-flex nav-item">
                                            <i class="fa-regular fa-calendar-days"></i>
                                            <p> ${item.getCreatedDate()} </p>
                                        </div>
                                    </div>
                                    <p class="news-item-info-title">${item.getContent()}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div> 
        </div>
    </div>
    </div>
</body>

</html>