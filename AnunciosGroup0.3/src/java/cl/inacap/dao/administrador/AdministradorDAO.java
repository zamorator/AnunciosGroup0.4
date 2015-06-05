/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.administrador;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Administrador;
import cl.inacap.model.Anuncio;
import cl.inacap.model.Difusor;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Javoru
 */
public class AdministradorDAO {


public Administrador IniciaSesionAdministrador(String nombre, String password) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        Administrador administrador = null;
        try {
            con = cf.obtenerConexion();
            // con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
           
            // SE LLAMAN(?,?) RS = RESULSET QUE DEVUELVE DATOS 
            // RS ALMACENA LO QUE DEVULEVE EL ALMACENAMIENTO
            CallableStatement proc = con.prepareCall("{CALL SP_INICIAR_SESION_ADMINISTRADOR(?,?)}");
            proc.setString(1,nombre);
            proc.setString(2,password);
            rs = proc.executeQuery();
            
            //NOMBRE DEL CAMPO QUE DEVULEVE EL SP
            while (rs.next()) {
                administrador = new Administrador();
                administrador.setCodigo_administrador(rs.getInt("CODIGO_ADMINISTRADOR"));
                administrador.setNombre_u_administrador(rs.getString("NOMBRE_U_ADMINISTRADOR"));
                administrador.setNombre_administrador(rs.getString("NOMBRE_ADMINISTRADOR"));
                administrador.setPassword_administrador(rs.getString("PASSWORD_ADMINISTRADOR"));
                administrador.setApellido_paterno_administrador(rs.getString("APELLIDO_PATERNO_ADMINISTRADOR"));
                administrador.setApellido_materno_administrador(rs.getString("APELLIDO_MATERNO_ADMINISTRADOR"));
                administrador.setEmail_administrador(rs.getString("EMAIL_ADMINISTRADOR"));
                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return administrador;
    }

public void AgregarAdministrador(Administrador administrador) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        try {
            int x = 0;
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SP_AGREGAR_ADMINISTRADOR(?,?,?,?,?,?)}");
            proc.setString(++x, administrador.getNombre_u_administrador());
            proc.setString(++x, administrador.getNombre_administrador());
            proc.setString(++x, administrador.getApellido_paterno_administrador());
            proc.setString(++x, administrador.getApellido_materno_administrador());
            proc.setString(++x, administrador.getPassword_administrador());
            proc.setString(++x, administrador.getEmail_administrador());
            proc.executeQuery();
            System.out.println("SP_AGREGAR_ADMINISTRADOR");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con = null;
            cf = null;
        }
    }
}    
