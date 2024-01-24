package com.servlet.Udemy.utils;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.text.Normalizer;
import java.util.Map;
import java.util.Properties;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import com.servlet.Udemy.constants.Constants;

public class StringUtil {

    public static String hmacSHA512(String data, String key) {
        String algorithm = "HmacSHA512";
        try {
            Mac mac = Mac.getInstance(algorithm);
            SecretKeySpec secretKeySpec = new SecretKeySpec(key.getBytes(), algorithm);
            mac.init(secretKeySpec);

            byte[] hmacBytes = mac.doFinal(data.getBytes());

            // Convert byte array to hexadecimal string
            StringBuilder result = new StringBuilder();
            for (byte b : hmacBytes) {
                result.append(String.format("%02x", b));
            }

            return result.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

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
        } catch (Exception e) {
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
            while ((offset = reader.read(buffer)) != -1)
                result += new String(buffer, 0, offset);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String generateRandomNumberString(int minLength, int maxLength) {
        if (minLength < 1 || maxLength > 100 || minLength > maxLength) {
            throw new IllegalArgumentException("Invalid input parameters");
        }

        SecureRandom secureRandom = new SecureRandom();
        int length = minLength + secureRandom.nextInt(maxLength - minLength + 1);

        StringBuilder randomString = new StringBuilder();
        while (randomString.length() < length) {
            int randomNumber = secureRandom.nextInt(10); // Generate a random digit (0-9)
            if (randomString.indexOf(Integer.toString(randomNumber)) == -1) {
                randomString.append(randomNumber);
            }
        }

        return randomString.toString();
    }

}
