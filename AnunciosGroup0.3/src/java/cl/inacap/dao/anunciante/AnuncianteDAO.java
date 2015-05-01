/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zamorator
 */
public class AnuncianteDAO {

    public Anunciante IniciarSesionAnunciante(String nombre, String password) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        Anunciante anunciante = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT * FROM `anunciante` WHERE nombre_u_anunciante = '" + nombre + "' and password_anunciante = '" + password+ "'");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                anunciante = new Anunciante();
                anunciante.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
                anunciante.setId_comuna(rs.getInt("ID_COMUNA"));
                anunciante.setNombre_anunciante(rs.getString("NOMBRE_ANUNCIANTE"));
                anunciante.setDireccion_anunciante(rs.getString("DIRECCION_ANUNCIANTE"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return anunciante;
    }

}
