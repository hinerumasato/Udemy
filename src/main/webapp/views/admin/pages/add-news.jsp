<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@include file="/common/includes.jsp" %>

        <head>
            <link rel="stylesheet" href="<c:url value='/static/css/add-news.css?v=${randomNumber}' />">
        </head>
        <div class="container">

            <h2 class="fw-bold">Thêm tin tức mới</h2>

            <c:if test="${not empty message}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>${message}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <form action="" method="POSt" enctype="multipart/form-data" accept-charset="UTF-8">
                
            </form>
        </div>