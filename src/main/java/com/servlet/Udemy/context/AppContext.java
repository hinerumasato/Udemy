package com.servlet.Udemy.context;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppContext {

    private static AppContext instance = null;
    private String appRealPath;

    private AppContext() {}

    public static AppContext getInstance() {
        if(instance == null)
            instance = new AppContext();
        return instance;
    }

}
