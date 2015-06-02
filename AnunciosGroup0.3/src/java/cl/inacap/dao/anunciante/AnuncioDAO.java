/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Anuncio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
    
    public ArrayList<Anuncio> BuscarAnunciosPorAnunciante(Anunciante anunciante) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Anuncio> anuncios = null;
        try {
            anuncios = new ArrayList<Anuncio>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPSBUSCARANUNCIOSPORANUNCIANTE(?)}");
            proc.setString(1, anunciante.getNombre_u_anunciante());
            rs = proc.executeQuery();
            System.out.println("SPSBUSCARANUNCIOSPORANUNCIANTE");
            while (rs.next()) {
                Anuncio anuncio = new Anuncio();
                anuncio.setCodigo_anuncio(rs.getInt("codigo_anuncio"));
                anuncio.setNombre_u_anunciante(rs.getString("nombre_u_anunciante"));
                anuncio.setNombre_anuncio(rs.getString("nombre_anuncio"));
                anuncio.setImagen_anuncio(rs.getString("imagen_anuncio"));
                anuncio.setDescripcion_anuncio(rs.getString("descripcion_anuncio"));
                anuncio.setFecha_creacion_anuncio(rs.getDate("fecha_creacion_anuncio"));
                anuncio.setFecha_modificacion_anuncio(rs.getDate("fecha_modificacion_anuncio"));
                anuncio.setEstado_anuncio(rs.getString("estado_anuncio"));
                anuncio.setId_categoria(rs.getInt("id_categoria"));
                anuncio.setId_segmento_sexo(rs.getInt("id_segmento_sexo"));
                anuncio.setId_segmento_edad(rs.getInt("id_segmento_edad"));
                anuncio.setCantidad_cupones(rs.getInt("cantidad_cupones"));
                anuncio.setPorcentaje_descuento(rs.getInt("porcentaje_descuento"));
                anuncios.add(anuncio);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return anuncios;
    }
    
}
