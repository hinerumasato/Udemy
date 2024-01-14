<%-- Document : news_item Created on : Dec 3, 2023, 11:24:05 PM Author : Moc Lan --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@include file="/common/includes.jsp" %>
            <!DOCTYPE html>
            <html>

            <head>

                <head>
                    <link rel="stylesheet" href="<c:url value=" /static/css/news.css?v=${randomNumber}" />">
                </head>
            </head>

            <body>
                <div class="container">
                    <div class="content">
                        <div class="row">
                            <div class="col left-news col-12 d-none col-md-4 d-md-block">
                                <div class="left">
                                    <%@include file="/views/client/partials/sidebarNews.jsp" %>
                                </div>
                            </div>
                            <div class="col right-news col-12 col-md-8 py-5">
                                <div class="right col-12">
                                    <h3>${newsItem.getTitle()}</h3>
                                    <p>${newsItem.getAuthor()}</p>
                                    <p>${newsItem.getContent()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>

            </html>