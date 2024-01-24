/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package com.servlet.Udemy.utils;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 *
 * @author Masato
 */
public class StringUtilTest {
    
    public StringUtilTest() {
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
    public void testReplaceHTMLKeys() {
        String html = "<p>APP URL = ${APP_URL} ${APP_URL}/verify/email?remember_token=${rememberToken}</p>";
        Map<String, String> map = new HashMap<String, String>();
        map.put("APP_URL", "http://localhost:8080");
        map.put("rememberToken", "123456");
        String expResult = "<p>APP URL = http://localhost:8080 http://localhost:8080/verify/email?remember_token=123456</p>";
        String result = StringUtil.replaceHTMLKeys(html, map);
        assertEquals(expResult, result);
    }

    @Test
    public void testReplaceHTMLKeys2() {
        String html = "<a href='/verify/email?remember_token=${rememberToken}'>${APP_URL}/verify/email?remember_token=${rememberToken}</a>";
        Map<String, String> map = Map.of("rememberToken", "123", "APP_URL", "app");
        String expResult = "<a href='/verify/email?remember_token=123'>app/verify/email?remember_token=123</a>";
        String result = StringUtil.replaceHTMLKeys(html, map);
        assertEquals(expResult, result);
    }

    @Test
    public void testRemoveAccents() {
        String expResult = "Xin chao cac ban";
        String result = StringUtil.removeAccents("Xin chào các bạn");
        assertEquals(expResult, result);
    }

    @Test
    public void testGenerateSlug() {
        String expResult = "xin-chao-cac-ban";
        String result = StringUtil.generateSlug("Xin chào các Bạn");
        assertEquals(expResult, result);
    }
    
}
