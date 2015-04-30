/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anuncio;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author macbookair
 */
public class DifusorAnunciosDAO {
    
    
    public ArrayList<Anuncio> buscaranuncio() throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        int respuesta = 0;
        ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
        System.out.println("Query anuncios inicio");
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT `CODIGO_ANUNCIO`, `NOMBRE_U_ANUNCIANTE`, `NOMBRE_ANUNCIO`, `IMAGEN_ANUNCIO`, `DESCRIPCION_ANUNCIO` FROM `anuncio` WHERE `ESTADO_ANUNCIO` = 'V'");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            
            while (rs.next()) {
                Anuncio anuncio = new Anuncio();
                anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
                anuncio.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
                anuncio.setNombre_anuncio(rs.getString("NOMBRE_ANUNCIO"));
                anuncio.setImagen_anuncio(rs.getString("IMAGEN_ANUNCIO"));
                anuncio.setDescripcion_anuncio(rs.getString("DESCRIPCION_ANUNCIO"));
                anuncios.add(anuncio);
                
            }
            System.out.println(anuncios.size());
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return anuncios;
    }
}

