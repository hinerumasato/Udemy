package com.servlet.Udemy.mappers;

import com.servlet.Udemy.DTO.CheckoutDTO;
import com.servlet.Udemy.constants.PaymentStatus;
import com.servlet.Udemy.models.CheckoutModel;
import com.servlet.Udemy.utils.TimeUtil;

public class CheckoutMapper {
    public static CheckoutDTO mapToDTO(CheckoutModel checkoutModel) {

        String paymentStatus = checkoutModel.getPaymentStatus().equals(PaymentStatus.NOT_PAID) ? "Chưa thanh toán" : "Đã thanh toán";
        String paymentCode = checkoutModel.getPaymentStatus().equals(PaymentStatus.NOT_PAID) ? "not-paid" : "paid";

        return new CheckoutDTO(
            checkoutModel.getId(), 
            TimeUtil.formatDate(checkoutModel.getCreatedAt().toString(), "dd/MM/yyyy"),
            checkoutModel.getTotalAmount(),
            paymentStatus,
            paymentCode
        );
    }
}
