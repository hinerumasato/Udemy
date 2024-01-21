<%-- 
    Document   : master
    Created on : Oct 15, 2023, 1:16:52 PM
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>


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

    <link rel="stylesheet" href="<c:url value='/static/css/app.css?v=${randomNumber}' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/base.css?v=${randomNumber}' />" />
    <link rel="stylesheet" href="<c:url value='/static/css/variables.css?v=${randomNumber}' />" />

    <!-- TinyMCE -->
    <script src="https://cdn.tiny.cloud/1/pd9ebc8uusu182469qo1vzpwdf8zyocpvs7jp1qotwdh1c08/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
    
    <!-- JQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <title>${title}</title>
</head>

<body>
    <%@include file="/views/admin/partials/header.jsp" %>
    <jsp:include page="${contentPage}" />
    </div>
    <%@include file="/views/admin/partials/footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
    </script>
    <script src="<c:url value='/static/js/utils/number.js?v=${randomNumber}' />"></script>
    <script src="<c:url value='/static/js/utils/file.js?v=${randomNumber}' />"></script>
    <script src="<c:url value='/static/js/templates/template.js?v=${randomNumber}' />"></script>

    <script>
        tinymce.init({
            selector: 'textarea',
            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
        });
    </script>
</body>

</html>