package com.servlet.Udemy.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
    public static double getCurrentSecond() {
        return System.currentTimeMillis() / 1000;
    }

    public static String formatDate(String timeStamps, String pattern) {
        SimpleDateFormat timeStampsFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        try {
            Date date = timeStampsFormat.parse(timeStamps);
            SimpleDateFormat formater = new SimpleDateFormat(pattern);
            String result = formater.format(date);
            return result;
        } catch(ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
