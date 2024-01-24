package com.servlet.Udemy.controllers.client;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.Udemy.DTO.CheckoutDTO;
import com.servlet.Udemy.constants.Constants;
import com.servlet.Udemy.mappers.CheckoutMapper;
import com.servlet.Udemy.models.CartModel;
import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.models.UserModel;
import com.servlet.Udemy.page.ClientPage;
import com.servlet.Udemy.page.Page;
import com.servlet.Udemy.services.CartService;
import com.servlet.Udemy.services.CheckoutService;
import com.servlet.Udemy.utils.NumberUtil;

@WebServlet("/account/orders")
public class OrderController extends HttpServlet {

    private CheckoutService checkoutService = new CheckoutService();
    private CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserModel loginUser = (UserModel) session.getAttribute("loginUser");
        CartModel cart = cartService.findByUserId(loginUser.getId());
        List<CheckoutDTO> checkoutDTOs = new ArrayList<CheckoutDTO>();
        int pageNumber;
        int limit = 5;
        int totalPages = 0;
        if(req.getParameter("page") == null)
            pageNumber = 1;
        else {
            pageNumber = Integer.parseInt(req.getParameter("page"));
        }
        if(cart != null) {
            List<CheckoutModel> allCheckouts = checkoutService.findByCartId(cart.getId());
            totalPages = allCheckouts == null ? 0 : NumberUtil.getTotalPageFromCollection(allCheckouts, limit);
            CheckoutService checkoutServicePagination = (CheckoutService) checkoutService.paginate(pageNumber, limit);
            List<CheckoutModel> checkouts = checkoutServicePagination.findByCartId(cart.getId());
            checkoutDTOs = checkouts.stream().map(checkout -> CheckoutMapper.mapToDTO(checkout)).collect(Collectors.toList());
            checkoutDTOs.sort(new Comparator<CheckoutDTO>() {
    
                @Override
                public int compare(CheckoutDTO o1, CheckoutDTO o2) {
                    SimpleDateFormat formater = new SimpleDateFormat(Constants.DEFAULT_DATE_FORMAT_PATTERN);
                    try {
                        Date date1 = formater.parse(o1.getDate());
                        Date date2 = formater.parse(o2.getDate());
                        return date2.compareTo(date1);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return 0;
                }
                
            });
        }

        Page page = new ClientPage(req, resp, "orders.jsp", "master.jsp");
        page.setObject("title", "Trang đơn hàng");
        page.setObject("checkouts", checkoutDTOs);
        page.setObject("totalPages", totalPages);
        page.setObject("currentPage", pageNumber);
        page.render();
    }
}
