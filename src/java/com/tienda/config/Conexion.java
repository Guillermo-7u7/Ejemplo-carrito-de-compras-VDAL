package com.tienda.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    Connection con;
    String url="jdbc:mysql://localhost:3306/vdal";
    String user="root";
    String pass="s0ygam3r123";       
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,user,pass);
        } catch (ClassNotFoundException | SQLException e) {
        }
        return con;
    }
}
    
    
