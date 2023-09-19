<%-- 
    Document   : master
    Created on : Sep 19, 2023, 12:13:40 AM
    Author     : Masato
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<c:url value='/static/css/app.css' />"/>
        <title>Test</title>
    </head>
    <body>
        <%@include file="/views/client/partials/header.jsp" %>
        
        <div class="container">
            <jsp:include page="${contentPage}" />
        </div>
        
        <%@include file="/views/client/partials/footer.jsp" %>
    </body>
</html>
