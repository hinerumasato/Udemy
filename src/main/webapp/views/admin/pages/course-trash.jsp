<%-- 
    Document   : course-trash.jsp
    Created on : Jan 6, 2024, 3:03:54 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>

<head>
    <link rel="stylesheet" href="<c:url value='/static/css/admin/courses.css' />">
</head>

<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Khoá học đã xoá</h2>
                    </div>
                    <div class="col-sm-6">
                        <button type="button" data-bs-toggle="modal" data-bs-target="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Khôi phục</span></button>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                            <span class="custom-checkbox">
                                <input type="checkbox" id="selectAll">
                                <label for="selectAll"></label>
                            </span>
                        </th>
                        <th>Tên</th>
                        <th>Loại</th>
                        <th>Cấp độ</th>
                        <th style="text-align: right;">Giá gốc</th>
                        <th style="text-align: right;">Giá KM</th>
                        <th>Chỉnh sửa</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td>
                                <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td><a href="/admin/courses/update?id=${course.getId()}">${course.getName()}</a></td>
                            <td>${categoryMap.get(course).getName()}</td>
                            <td>${levelMap.get(course).getValue()}</td>
                            <td style="text-align: right;" class="format-price">${course.getPrice()}</td>
                            <td style="text-align: right;" class="format-price">${course.getSalePrice()}</td>
                            <td class="d-flex align-items-center">
                                <button course-id="${course.getId()}" type="button" data-bs-toggle="modal" data-bs-target="#restoreCourseModal" class="p-0 bg-transparent border-0"><i class="material-icons text-info" data-toggle="tooltip" title="Delete"><i style="font-size: 14px;" class="fa-solid fa-window-restore"></i></i></button>
                                <button course-id="${course.getId()}" type="button" data-bs-toggle="modal" data-bs-target="#deleteEmployeeModal" class="p-0 bg-transparent border-0"><i class="material-icons text-danger" data-toggle="tooltip" title="Delete"><i style="font-size: 14px;" class="fa-solid fa-trash"></i></i></button>
                            </td>
                        </tr>
                    </c:forEach> 
                </tbody>
            </table>
            <!-- <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item active"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div> -->
        </div>
    </div>        
</div>
