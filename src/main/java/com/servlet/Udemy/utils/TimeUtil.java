package com.servlet.Udemy.utils;

public class TimeUtil {
    public static double getCurrentSecond() {
        return System.currentTimeMillis() / 1000;
    }

    public static void main(String[] args) {
        System.out.println(getCurrentSecond());
    }
}
