package com.servlet.Udemy.controllers.API;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.servlet.Udemy.constants.ErrorMessage;
import com.servlet.Udemy.constants.SuccessMessage;
import com.servlet.Udemy.models.ResponseModel;
import com.servlet.Udemy.models.ReviewModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.services.ReviewService;
import com.servlet.Udemy.utils.StringUtil;

@WebServlet("/api/v1/review")
@MultipartConfig(
    maxRequestSize = 1024,
    maxFileSize = 1024
)
public class ReviewAPI extends HttpServlet {
    
    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        HttpSession session = req.getSession();
        
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");

        Part rateAmountPart = req.getPart("rateAmount");
        Part contentPart = req.getPart("content");

        int rateAmount = Integer.parseInt(StringUtil.getDataFromInputStream(rateAmountPart.getInputStream()));
        String content = StringUtil.getDataFromInputStream(contentPart.getInputStream());

        ReviewModel reviewModel = new ReviewModel();
        reviewModel.setRateAmount(rateAmount);
        reviewModel.setContent(content);
        reviewModel.setUserId(loginUser.getId());

        boolean success = reviewService.insert(reviewModel);
        PrintWriter out = resp.getWriter();
        ResponseModel responseModel = new ResponseModel();
        if(success) {
            out.println(responseModel.response(200, SuccessMessage.ADD_REVIEW_SUCCESS, null));
        }
        else {
            out.println(responseModel.response(404, ErrorMessage.ADD_REVIEW_ERROR, null));
        }

    }
}
