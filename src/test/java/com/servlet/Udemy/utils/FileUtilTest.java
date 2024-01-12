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
public class FileUtilTest {

    /**
     * Test of getFileNameExtension method, of class FileUtil.
     */
    @Test
    public void testGetFileExtension() {
        String exp = "png";
        String fileName = "example.png";
        String actual = FileUtil.getFileExtension(fileName);
        assertEquals(exp, actual);
    }

    @Test
    public void testGetFileName() {
        String exp = "exam.ple";
        String fileName = "exam.ple.png";
        String actual = FileUtil.getFileName(fileName);
        assertEquals(exp, actual);
}

    @Test
    public void testGetUUIDFileName() {
        String fileName = "example.png";
        String result = FileUtil.getUUIDFileName(fileName);
        assertTrue(result.length() > 0);
    }
    
}
 