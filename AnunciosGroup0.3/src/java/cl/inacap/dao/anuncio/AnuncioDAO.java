package cl.inacap.dao.anuncio;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Anuncio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class AnuncioDAO {

    public Anuncio BuscarAnunciosPorAnunciante(int id_anuncio) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        Anuncio anuncio = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAANUNCIOPORID(?)}");
            proc.setInt(1, id_anuncio);
            rs = proc.executeQuery();
            System.out.println("SPBUSCAANUNCIOPORID");
            while (rs.next()) {
                anuncio = new Anuncio();
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
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return anuncio;
    }
}
