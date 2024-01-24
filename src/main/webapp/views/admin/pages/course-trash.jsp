<%-- Document : course-trash.jsp Created on : Jan 6, 2024, 3:03:54 PM Author : thang --%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
                        <button type="button" id="restoreAllBtn" data-bs-toggle="modal" data-bs-target="#restoreCourseModal"
                            class="btn btn-success d-flex align-items-center" data-toggle="modal">
                            <i style="font-size: 14px;" class="fa-solid fa-window-restore"></i> 
                            <span>Khôi phục đã chọn</span>
                        </button>
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
                                    <input type="checkbox" id="checkbox1" name="options[]" value="${course.getId()}">
                                    <label for="checkbox1"></label>
                                </span>
                            </td>
                            <td><a href="/admin/courses/update?id=${course.getId()}">${course.getName()}</a>
                            </td>
                            <td>${categoryMap.get(course).getName()}</td>
                            <td>${levelMap.get(course).getValue()}</td>
                            <td style="text-align: right;" class="format-price">${course.getPrice()}</td>
                            <td style="text-align: right;" class="format-price">${course.getSalePrice()}
                            </td>
                            <td class="d-flex align-items-center">
                                <button course-id="${course.getId()}" type="button" data-bs-toggle="modal"
                                    data-bs-target="#restoreCourseModal"
                                    class="p-0 bg-transparent border-0 restore-btn"><i class="material-icons text-info"
                                        data-toggle="tooltip" title="Khôi phục"><i style="font-size: 14px;"
                                            class="fa-solid fa-window-restore"></i></i></button>
                                <button course-id="${course.getId()}" type="button" data-bs-toggle="modal"
                                    data-bs-target="#deleteCourseModal"
                                    class="p-0 bg-transparent border-0 hard-delete-btn"><i
                                        class="material-icons text-danger" data-toggle="tooltip"
                                        title="Xoá vĩnh viễn"><i style="font-size: 14px;"
                                            class="fa-solid fa-trash"></i></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div id="deleteCourseModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="hardDeleteForm" method="POST" action="/admin/courses/delete">
                            <input type="hidden" name="_method" value="DELETE">
                            <div class="modal-header">						
                                <h4 class="modal-title">Xoá vĩnh viễn khoá học</h4>
                                <button type="button" class="btn btn-sm btn-close" data-dismiss="modal" data-bs-target="#deleteEmployeeModal" aria-hidden="true"></button>
                            </div>
                            <div class="modal-body">					
                                <p>Bạn có chắc chắn muốn xoá vĩnh viễn khoá học này</p>
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

            <div id="restoreCourseModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="restoreCourseForm" method="POST" action="/admin/courses/trash">
                            <input type="hidden" name="_method" value="PUT">
                            <div class="modal-header">						
                                <h4 class="modal-title">Khôi phục khoá học</h4>
                                <button type="button" class="btn btn-sm btn-close" data-dismiss="modal" data-bs-target="#deleteEmployeeModal" aria-hidden="true"></button>
                            </div>
                            <div class="modal-body">					
                                <p>Bạn có chắc chắn muốn khôi phục khoá học này</p>
                                <p class="text-warning"><small>Sau khi khôi phục, khoá học này sẽ được hiển thị ra ngoài</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" value="Restore">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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

<script src="<c:url value='/static/js/pages/admin-courses.js' />"></script>