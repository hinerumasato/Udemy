package com.servlet.Udemy.context;

import java.io.File;

import lombok.Getter;

@Getter
public class AppContext {

    private static AppContext instance = null;
    private String appRealPath;
    
    public void setAppRealPath(String path) {
        String _s = File.separator;
        String[] pathArr = path.split("\\" + _s);
        String truePath = "";
        for(int i = 0; i < pathArr.length - 2; i++)
            truePath += pathArr[i] + _s;
        this.appRealPath = truePath + "src" + _s + "main" + _s + "webapp";
    }

    private AppContext() {}

    public static AppContext getInstance() {
        if(instance == null)
            instance = new AppContext();
        return instance;
    }

}
