package com.servlet.Udemy.utils;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.text.Normalizer;
import java.util.Map;
import java.util.Properties;

import com.servlet.Udemy.constants.Constants;

public class StringUtil {
    public static String encrypt(String str) {
        String secret = FileUtil.env("AUTH_SECRET_KEY");
        String needEncrypt = str + secret;
        String result = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] needEncryptBytes = needEncrypt.getBytes();
            byte[] encryptedBytes = digest.digest(needEncryptBytes);

            // Chuyển đổi mảng byte thành chuỗi Hex
            StringBuilder hexString = new StringBuilder(2 * encryptedBytes.length);
            for (byte b : encryptedBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            result = hexString.toString();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result;
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

    public static boolean isEncryptEquals(String str, String hashed) {
        String compare = encrypt(str);
        return compare.equals(hashed);
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

    public static String getDataFromInputStream(InputStream is) {
        String result = "";
        try {
            BufferedInputStream reader = new BufferedInputStream(is);
            byte[] buffer = new byte[1024];
            int offset;
            while((offset = reader.read(buffer)) != -1)
                result += new String(buffer, 0, offset);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

}
