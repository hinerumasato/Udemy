package com.servlet.Udemy.utils;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import com.servlet.Udemy.constants.Constants;
import com.servlet.Udemy.context.AppContext;

public class FileUtil {
    public Properties getAppProperties() {
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
}
