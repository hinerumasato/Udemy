package com.servlet.Udemy.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.servlet.Udemy.constants.Constants;
import com.servlet.Udemy.context.AppContext;

public class FileUtil {
    public static Properties getAppProperties() {
        AppContext context = AppContext.getInstance();
        try {
            Properties properties = new Properties();
            File file = new File(context.getAppRealPath() + "/" + Constants.ENV_FILE);
            FileReader reader = new FileReader(file);
            properties.load(reader);
            return properties;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String env(String key) {
        return getAppProperties().getProperty(key);
    }

    public static String readFileToString(File file) {
        try (FileInputStream fis = new FileInputStream(file)) {
            byte[] data = new byte[(int) file.length()];
            fis.read(data);
            return new String(data, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
