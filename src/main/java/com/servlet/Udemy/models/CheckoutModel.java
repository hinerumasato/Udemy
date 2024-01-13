package com.servlet.Udemy.models;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CheckoutModel {
    private int id;
    private double totalAmount;
    private double discount;
    private String paymentStatus;
    private Timestamp createdAt;
    private int cartId;
}
