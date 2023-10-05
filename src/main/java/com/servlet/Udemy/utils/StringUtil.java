package com.servlet.Udemy.utils;

import org.mindrot.jbcrypt.BCrypt;

public class StringUtil {
    public static String bcrypt(String str) {
        return BCrypt.hashpw(str, BCrypt.gensalt());
    }
}
