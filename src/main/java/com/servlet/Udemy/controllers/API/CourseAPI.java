package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.constants.Constants;
import com.servlet.Udemy.models.CourseModel;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.services.CourseService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet(urlPatterns = { "/api/v1/courses/*", "/api/v1/courses" })
public class CourseAPI extends HttpServlet {

    private CourseService courseService = new CourseService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        ResponseModel responseModel = new ResponseModel();
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        if (pathInfo == null || pathInfo.equals("/")) {
            String levelIdStr = req.getParameter("level");
            String priceStr = req.getParameter("price");
            // String timeStr = req.getParameter("time");
            String pageStr = req.getParameter("page");

            Map<String, String> findMap = new HashMap<String, String>();

            if (levelIdStr != null && !levelIdStr.equals("")) {
                levelIdStr = levelIdStr.replaceAll("\\?", "level_id");
                findMap.put("level_id", levelIdStr);
            }
            if (priceStr != null && !priceStr.equals("")) {
                priceStr = priceStr.replaceAll("\\?", "sale_price");
                findMap.put("sale_price", priceStr);
            }
            // if(!timeStr.equals("")) {
            // timeStr = timeStr.replaceAll("\\?", "time");
            // findMap.put("time", timeStr);
            // }

            if (findMap.size() == 0) {
                if (pageStr == null)
                    resp.getWriter()
                            .write(responseModel.response(200, "Find courses successfully", courseService.findAllActive()));
                else {
                    boolean canParse = NumberUtil.canParse(pageStr);
                    if (canParse) {
                        int page = Integer.parseInt(pageStr);
                        CourseService courseServicePagination = (CourseService)courseService.paginate(page, Constants.PAGE_LIMIT);
                        List<CourseModel> courses = courseServicePagination.findAllActive();
                        if(courses == null)
                            resp.getWriter().write(responseModel.response(404, "No courses found !!!", null));
                        else {
                            if(courses.size() == 0)
                                resp.getWriter().write(responseModel.response(404, "No courses found !!!", null));
                            else resp.getWriter().write(responseModel.response(200, "Find courses successfully", courses));
                        }

                    } else {
                        resp.getWriter().write(responseModel.response(500, "Page parameter is not valid", null));
                    }
                }
            } else {
                List<CourseModel> courses = null;
                if(pageStr != null) {
                    boolean canParse = NumberUtil.canParse(pageStr);
                    if(canParse) {
                        int page = Integer.parseInt(pageStr);
                        CourseService courseServicePagination = (CourseService)courseService.paginate(page, Constants.PAGE_LIMIT);
                        courses = courseServicePagination.findByMap(findMap);
                    } else resp.getWriter().write(responseModel.response(500, "Page parameter is not valid", null));
                } else courses = courseService.findByMap(findMap);
                if (courses == null)
                    resp.getWriter().write(responseModel.response(404, "No courses found !!!", null));
                else
                    resp.getWriter().write(responseModel.response(200, "Find courses successfully", courses));
            }
        } else {
            String code = pathInfo.substring(1);
            List<CourseModel> courses = courseService.findByCategoryCode(code);
            if (courses != null)
                resp.getWriter().write(responseModel.response(200, "Find user by " + code + " successfully", courses));
            else
                resp.getWriter().write(responseModel.response(404, "No courses found !!!", null));
        }
    }
}
