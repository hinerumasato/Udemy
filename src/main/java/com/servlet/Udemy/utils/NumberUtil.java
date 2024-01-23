/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet.Udemy.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
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

    public static boolean canParse(String str) {
        for (char character : str.toCharArray()) {
            if(character < '0' || character > '9')
                return false;
        }
        return true;
    }

    public static List<Integer> mapToInt(String str, String pattern) {
        List<Integer> result = new ArrayList<Integer>();
        String[] strSplit = str.split(pattern);
        for (String s : strSplit) {
            if(canParse(s)) result.add(Integer.parseInt(s));
        }
        return result;
    }

    public static int round(double doubleNum) {
        int intNum = (int) doubleNum;
        double minus = doubleNum - intNum;
        if(minus >= 0.5)
            intNum++;
        return intNum;
    }

    public static int roundIfNotInteger(double doubleNum) {
        int intNum = (int) doubleNum;
        double minus = doubleNum - intNum;
        if(minus > 0)
            intNum++;
        return intNum;
    }

    public static int getTotalPageFromCollection(Collection<? extends Object> collection, int limit) {
        double pageDouble = collection.size() / (double) limit;
        return roundIfNotInteger(pageDouble);
    }
}
