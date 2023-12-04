<%-- 
    Document   : news
    Created on : Nov 27, 2023, 9:24:03 PM
    Author     : Moc Lan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<c:url value="/static/css/news.css?v=${randomNumber}"/>">
    </head>
    <body>
        <div class="container">
            <div class="row d-flex">
                <div class="col-12 d-none d-md-block col-md-3">
                    <%@include file="/views/client/partials/sidebarNews.jsp" %>
                </div>
                </div>
                <div>
                    <div class="col-12 col-md-9 news-container py-5">
                        <c:forEach var="item" items="${list_news}" >
                            <div class="news-item d-flex shadow" >
                                <button class="img-news">
                                    <img src="<c:url value='${item.getImgURL()}'/>" alt="">
                                </button>
                                <div class="content-news">
                                    <a href="news-item?item-id=${item.getId()}">${item.getTitle()}</a>
                                    <p>${item.getAuthor()}  ${item.getCreatedDate()} </p>
                                    <p class="news-item-info-title">${item.getContent()}</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
