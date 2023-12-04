package com.servlet.Udemy.utils;

import java.text.Normalizer;
import java.util.Map;
import java.util.Properties;

import org.mindrot.jbcrypt.BCrypt;

import com.servlet.Udemy.constants.Constants;

public class StringUtil {
    public static String bcrypt(String str) {
        return BCrypt.hashpw(str, BCrypt.gensalt());
    }

    public static String getGoogleAuthLink() {
        Properties properties = FileUtil.getAppProperties();
        String googleAuthLink = Constants.GOOGLE_AUTH_LINK;
        String clientId = properties.getProperty("GOOGLE_CLIENT_ID");
        String redirectUri = Constants.GOOGLE_REDIRECT_URL;
        String scope = "openid%20email%20profile";
        String responseType = "code";

        String finalLink = googleAuthLink + "?client_id=" + clientId + "&redirect_uri=" + redirectUri + "&scope="
                + scope + "&response_type=" + responseType;
        return finalLink;
    }

    public static boolean isBcryptEquals(String str, String hashed) {
        return BCrypt.checkpw(str, hashed);
    }

    public static String htmlEscape(String input) {

        input = input.replaceAll("<", "&lt;");
        input = input.replaceAll(">", "&gt;");

        input = input.replaceAll("javascript:", "");

        input = input.replaceAll("'", "&apos;");
        input = input.replaceAll("\"", "&quot;");
        return input;
    }

    public static boolean isStaticUrl(String url) {
        return url.contains("/static");
    }

    public static String replaceHTMLKeys(String htmlContent, Map<String, String> map) {
        for (Map.Entry<String, String> entry : map.entrySet()) {
            String key = "${" + entry.getKey() + "}";
            String value = entry.getValue();
            htmlContent = htmlContent.replace(key, value);
        }
        return htmlContent;
    }

    public static String removeAccents(String str) {
        str = Normalizer.normalize(str, Normalizer.Form.NFD);
        str = str.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        return str;
    }

    public static String generateSlug(String str) {
        str = str.toLowerCase();
        str = str.trim();
        str = removeAccents(str);
        str = str.replaceAll(" ", "-");
        return str;
    }

}
