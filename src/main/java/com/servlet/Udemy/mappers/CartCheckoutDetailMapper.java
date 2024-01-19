package com.servlet.Udemy.mappers;

import java.util.ArrayList;
import java.util.List;

import com.servlet.Udemy.models.CartDetailModel;
import com.servlet.Udemy.models.CheckoutDetailModel;

public class CartCheckoutDetailMapper {

    public static List<CheckoutDetailModel> mapToList(List<CartDetailModel> cartDetails) {
        List<CheckoutDetailModel> result = new ArrayList<>(cartDetails.size());
        for (CartDetailModel cart : cartDetails)
            result.add(mapCartDetailToCheckoutDetail(cart));
        return result;
    }

    public static CheckoutDetailModel mapCartDetailToCheckoutDetail(CartDetailModel cartDetailModel) {
        CheckoutDetailModel checkoutDetailModel = new CheckoutDetailModel();
        checkoutDetailModel.setAmount(cartDetailModel.getAmount());
        checkoutDetailModel.setCourseId(cartDetailModel.getCourseId());
        return checkoutDetailModel;        
    }
}
