package com.servlet.Udemy.utils;

import java.util.Properties;

import org.mindrot.jbcrypt.BCrypt;
import com.servlet.Udemy.constants.Constants;

public class StringUtil {
    public static String bcrypt(String str) {
        return BCrypt.hashpw(str, BCrypt.gensalt());
    }

    public static String getGoogleAuthLink() {
        Properties properties = FileUtil.getAppProperties();
        String googleAuthLink = properties.getProperty("GOOGLE_AUTH_LINK");
        String clientId = properties.getProperty("GOOGLE_CLIENT_ID");
        String redirectUri = Constants.GOOGLE_REDIRECT_URL;
        String scope = "openid%20email%20profile";
        String responseType = "code";

        String finalLink = googleAuthLink + "?client_id=" + clientId + "&redirect_uri=" + redirectUri + "&scope=" + scope + "&response_type=" + responseType;
        return finalLink;
    }
}
