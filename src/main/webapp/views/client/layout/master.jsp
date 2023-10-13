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

    <!-- boostrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css" />
    <link rel="shortcut icon" href="<c:url value='/static/favicon.ico' />" type="image/x-icon">

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300;1,400;1,500;1,600;1,700;1,800&display=swap"
        rel="stylesheet">


    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/static/css/app.css?v=${randomNumber}' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/base.css?v=${randomNumber}' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/variables.css?v=${randomNumber}' />" />
    <title>${title}</title>
</head>

<body>
    <%@include file="/views/client/partials/header.jsp" %>
    <%@include file="/views/client/partials/slider.jsp" %>

    <jsp:include page="${contentPage}" />

    <%@include file="/views/client/partials/footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
    </script>
    <script src="<c:url value='/static/js/utils/number.js?v=${randomNumber}' />"></script>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v18.0&appId=1687800611703638" nonce="0K9I7wQh"></script>

    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: 1687800611703638,
                cookie: true, // Enable cookies to allow the server to access the session.
                xfbml: true, // Parse social plugins on this webpage.
                version: 'v18.0', // Use this Graph API version for this call.
            });


            FB.getLoginStatus(function (response) { // Called after the JS SDK has been initialized.
                return response.status;
            });
        };
        
    </script>


</html>