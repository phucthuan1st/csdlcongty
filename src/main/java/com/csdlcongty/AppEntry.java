package com.csdlcongty;
/**
 * @project CompanyDatabaseOperation
 * @author 20H3T-02
 */

import java.io.IOException;

public class AppEntry {
    
    public static final int wWidth = 1024;
    public static final int wHeight = 768;

    public static void main(String[] args) throws IOException {
        new LoginController(wWidth, wHeight);
    }
}
