package com.vinson.plms;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider implements Provider{
    static Connection con = null;
    public static Connection getConnection(){
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, username, password);
        }
        catch (Exception e){
            System.out.println(e);
        }
        return con;
    }
}
