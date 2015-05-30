/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anuncio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author zamorator
 */
public class AnuncioDAO {

    public void AgregaAnuncio(Anuncio anuncio) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        try {
            int x = 0;
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPAGREGAANUNCIO(?,?,?,?,?,?,?,?,?)}");
            proc.setString(++x, anuncio.getNombre_u_anunciante());
            proc.setString(++x, anuncio.getNombre_anuncio());
            proc.setString(++x, anuncio.getImagen_anuncio());
            proc.setString(++x, anuncio.getDescripcion_anuncio());
            proc.setInt(++x, anuncio.getId_categoria());
            proc.setInt(++x, anuncio.getId_segmento_sexo());
            proc.setInt(++x, anuncio.getId_segmento_edad());
            proc.setInt(++x, anuncio.getCantidad_cupones());
            proc.setInt(++x, anuncio.getPorcentaje_descuento());
            proc.executeQuery();
            System.out.println("SPAGREGAANUNCIO");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con = null;
            cf = null;
        }
    }
}
