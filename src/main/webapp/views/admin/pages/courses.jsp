<%-- 
    Document   : courses
    Created on : Dec 30, 2023, 4:37:37 PM
    Author     : thang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/includes.jsp" %>
<html lang="vi">
    <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="<c:url value='/static/css/admin/courses.css' />">
    </head>
    <body>
        <c:if test="${not empty sessionScope.updateProductMessage}">
            <div class="alert alert-success alert-dismissible fade show mt-3">
                <strong>${sessionScope.updateProductMessage}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Quản lý <b>khoá học</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="/admin/courses/add-course" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Thêm khoá học mới</span></a>
                                <button type="button" data-bs-toggle="modal" data-bs-target="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Xoá</span></button>
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
                                    <td class="d-flex">
                                        <a href="/admin/courses/update?id=${course.getId()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <button course-id="${course.getId()}" type="button" data-bs-toggle="modal" data-bs-target="#deleteEmployeeModal" class="p-0 bg-transparent border-0"><i class="material-icons text-danger" data-toggle="tooltip" title="Delete">&#xE872;</i></button>
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
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" class="form-control" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="softDeleteForm" method="POST" action="/admin/courses/soft-delete">
                        <input type="hidden" name="_method" value="PUT">
                        <div class="modal-header">						
                            <h4 class="modal-title">Xoá khoá học</h4>
                            <button type="button" class="btn btn-sm btn-close" data-dismiss="modal" data-bs-target="#deleteEmployeeModal" aria-hidden="true"></button>
                        </div>
                        <div class="modal-body">					
                            <p>Bạn có chắc chắn muốn xoá khoá học này</p>
                            <p class="text-warning"><small>Hành động này không thể quay lại</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="<c:url value='/static/js/pages/admin-courses.js' />"></script>
        <script src="<c:url value='/static/js/utils/number.js' />"></script>
    </body>
</html>
