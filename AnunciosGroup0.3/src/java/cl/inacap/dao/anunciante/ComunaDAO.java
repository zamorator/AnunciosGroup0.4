/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Comuna;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zamorator
 */
public class ComunaDAO {
    public Comuna BuscarComuna(int id_region) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        Comuna comuna = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            //query.append("SELECT id_comuna, id_provincia, nombre_comuna FROM `anunciante` WHERE nombre_u_anunciante = '" + id_region + "' and password_anunciante = '" + password+ "'");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                comuna = new Comuna();
//
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return comuna;
    }
}
