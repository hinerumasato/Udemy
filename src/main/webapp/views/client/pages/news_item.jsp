<%-- 
    Document   : news_item
    Created on : Dec 3, 2023, 11:24:05 PM
    Author     : Moc Lan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h3>${item.getTitle()}</h3>
            <p>${item.getAuthor()}</p>
            <p>${item.getContent()}</p>
        </div>
    </body>
</html>
