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
                                    <%@include file="/views/client/partials/sidebar-news.jsp" %>
                                </div>
                            </div>
                            <div class="col right-news col-12 col-md-8 py-5">
                                <div class="right col-12">
                                    <h1 class="fw-bold" id="newsDetailTitle">${newsItem.getTitle()}</h1>
                                    <div class=" d-flex pb-1 pt-1 ">
                                        <div class="d-flex nav-item">
                                            <i class="fa-regular fa-user" style="color: #11ee48;"></i>
                                            <p class="fw-bold ms-1">${newsItem.getAuthor()}</p>
                                        </div>
                                        <div class="d-flex nav-item">
                                            <i class="fa-regular fa-calendar-days" style="color: #11ee48;"></i>
                                            
                                            <p class="fw-bold ms-1">${newsItem.getCreatedDate()}</p>
                                        </div>
                                    </div>
                                    <p>${newsItem.getContent()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
            <script src="<c:url value='/static/js/pages/news-details.js?v=${randomNumber}' />"></script>
            </html>