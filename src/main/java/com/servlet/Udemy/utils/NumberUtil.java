/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.utils;

import java.util.Random;

/**
 *
 * @author Masato
 */
public class NumberUtil {
    public static int random() {
        Random rand = new Random();
        int result = rand.nextInt();
        return result;
    }
}
