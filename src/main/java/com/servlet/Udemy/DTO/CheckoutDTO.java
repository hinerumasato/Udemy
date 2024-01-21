package com.servlet.Udemy.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CheckoutDTO {
    private int id;
    private String date;
    private double totalAmount;
    private String paymentStatus;
    private String paymentCode;
}
