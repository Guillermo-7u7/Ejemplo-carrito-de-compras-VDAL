
package com.tienda.modelo;

import com.tienda.config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class PersonaDAO implements Validar{
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    int r=0;
    
    @Override
    public int validar(Persona per) {
        String sql="Select * from persona where Nombres=1 and Email=2";
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1,per.getNom());
            ps.setString(2,per.getEmail());
            rs=ps.executeQuery();
            while(rs.next()){
                r=r+1;
                per.setNom(rs.getString("Nombres"));
                per.setEmail(rs.getString("Email"));
            }
            if(r==1){
                return 1;
            }else{
                return 0;
            }
        } catch(Exception e){
            return 0;
        }
    }
    
}
