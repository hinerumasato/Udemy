/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.servlet.Udemy.utils;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author Masato
 */
public class NumberUtilTest {
    
    public NumberUtilTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    @Test
    public void testCanParseFalse() {
        System.out.println("canParseFalse");
        String str = "sdfds";
        boolean expResult = false;
        boolean result = NumberUtil.canParse(str);
        assertEquals(expResult, result);
    }

    @Test
    public void testCanParseTrue() {
        System.out.println("canParseTrue");
        String str = "1234";
        boolean expResult = true;
        boolean result = NumberUtil.canParse(str);
        assertEquals(expResult, result);
    }
    
}
