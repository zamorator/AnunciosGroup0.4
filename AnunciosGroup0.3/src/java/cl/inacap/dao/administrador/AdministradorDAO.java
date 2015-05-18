/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.administrador;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Administrador;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Javoru
 */
public class AdministradorDAO {
    public boolean AgregarAdministrador(Administrador administrador){
    ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null; 
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            java.util.Date date = new java.util.Date();
            query.append("INSERT INTO `anunciosgroup`.`administrador` (`CODIGO_ADMINISTRADOR`, `NOMBRE_U_ADMINISTRADOR`, `NOMBRE_ADMINISTRADOR`, `APELLIDO_PATERNO_ADMINISTRADOR`, `APELLIDO_MATERNO_ADMINISTRADOR`, `EMAIL_ADMINISTRADOR`) "
                    + "VALUES (NULL, '"+ administrador.getNombre_u_administrador() +"', '"+ administrador.getNombre_administrador() +"', '"+ administrador.getApellido_paterno_administrador() +"', '"+ administrador.getApellido_materno_administrador() +"', '"+ administrador.getEmail_administrador() +"');");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            date = null;
            pst.execute();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return true;
    }
}
