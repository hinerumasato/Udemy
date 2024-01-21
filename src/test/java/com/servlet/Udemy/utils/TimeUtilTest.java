/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.servlet.Udemy.utils;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author thang
 */
public class TimeUtilTest {
    @Test
    public void testFormatDate() {
        String exp = "19/01/2024";
        String timestamps = "2024-01-19 18:47:13.0";
        String actual = TimeUtil.formatDate(timestamps, "dd/MM/yyyy");
        assertEquals(exp, actual);
    }
    
}
