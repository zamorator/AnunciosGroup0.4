/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anuncio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

/**
 *
 * @author zamorator
 */
public class AnuncioDAO {

    public boolean AgregaAnuncio(Anuncio anuncio) {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null; 
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            java.util.Date date = new java.util.Date();
            query.append("insert into anuncio (nombre_anuncio, descripcion_anuncio) values("
                    + " '" + anuncio.getNombre_anuncio() + "',"
                    + "'" + anuncio.getDescripcion_anuncio() + "')");
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
