package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.servlet.Udemy.models.ReviewModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.ReviewService;
import com.servlet.Udemy.services.UserService;

@WebServlet("/reviews")
public class ReviewController extends HttpServlet {

    private ReviewService reviewService = new ReviewService();
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Page page = new ClientPage(req, resp, "review.jsp", "master.jsp");
        List<ReviewModel> reviews = reviewService.findAll();
        Map<ReviewModel, UserModel> userMap = new HashMap<>();
        if(reviews != null) {
            for (ReviewModel review : reviews) {
                userMap.put(review, userService.findById(review.getUserId()));
            }
        }
        page.setObject("title", "Review về Udemy");
        page.setObject("reviews", reviews);
        page.setObject("userMap", userMap);
        page.render();
    }
}
