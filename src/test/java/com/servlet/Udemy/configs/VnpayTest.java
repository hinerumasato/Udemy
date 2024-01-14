/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.servlet.Udemy.configs;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author thang
 */
public class VnpayTest {
    
    @Test
    public void testBuildUrl() {
        Vnpay vnpay = new Vnpay();
        
        String url = vnpay.amount(20000)
                        .orderType("Thanh toan khoa hoc")
                        .vnpTxnRef("23554")
                        .vnpIpAddr("192.168.2.4")
                        .buildUrl();
        System.out.println(url);
        assertTrue(url.length() > 0);
    }
    
}
