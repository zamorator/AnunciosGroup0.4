/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Anuncio;
import cl.inacap.model.ValorAnuncio;
import java.sql.CallableStatement;
import java.sql.Connection;
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
        ResultSet rs = null;
        ArrayList<Anuncio> anuncios = null;
        try {
            anuncios = new ArrayList<Anuncio>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARANUNCIOSPORANUNCIANTE(?)}");
            proc.setString(1, anunciante.getNombre_u_anunciante());
            rs = proc.executeQuery();
            System.out.println("SPBUSCARANUNCIOSPORANUNCIANTE");
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

    public Anuncio buscarAnuncioPorId(int id_anuncio) throws Exception {
        Anuncio anuncio = new Anuncio();
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        ArrayList<Anuncio> anuncios = null;
        try {
            anuncios = new ArrayList<Anuncio>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAANUNCIOPORID(?)}");
            proc.setInt(1, id_anuncio);
            rs = proc.executeQuery();
            System.out.println("SPBUSCAANUNCIOPORID");
            while (rs.next()) {
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

        return anuncio;
    }

    public void actualizarAnuncio(Anuncio anuncio) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ArrayList<Anuncio> anuncios = null;
        try {
            anuncios = new ArrayList<Anuncio>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPACTUALIZAANUNCIO(?,?,?,?,?,?,?,?)}");
            int i = 0;
            proc.setInt(++i, anuncio.getCodigo_anuncio());
            //proc.setString(++i, anuncio.getNombre_u_anunciante());
            proc.setString(++i, anuncio.getNombre_anuncio());
            //proc.setString(++i, anuncio.getImagen_anuncio());
            proc.setString(++i, anuncio.getDescripcion_anuncio());
            //proc.setDate(++i, (Date) anuncio.getFecha_modificacion_anuncio());
            //proc.setString(++i, anuncio.getEstado_anuncio());
            proc.setInt(++i, anuncio.getId_categoria());
            proc.setInt(++i, anuncio.getId_segmento_sexo());
            proc.setInt(++i, anuncio.getId_segmento_edad());
            proc.setInt(++i, anuncio.getCantidad_cupones());
            proc.setInt(++i, anuncio.getPorcentaje_descuento());

            proc.executeQuery();
            System.out.println("SPACTUALIZAANUNCIO");
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
    }

    public void actualizaImagenAnuncio(String archivo, int cod_anuncio) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;

        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPACTUALIZAIMAGENANUNCIO(?, ?)}");
            proc.setString(1, archivo);
            proc.setInt(2, cod_anuncio);
            proc.executeQuery();
            System.out.println("SPACTUALIZAIMAGENANUNCIO");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        } finally {
            cf = null;
            con = null;
        }
    }

    public void agregarValorAnuncio(int codigo_anuncio, int valorAnuncio) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;

        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPAGREGAVALORANUNCIO(?, ?)}");
            proc.setInt(1, codigo_anuncio);
            proc.setInt(2, valorAnuncio);
            proc.executeQuery();
            System.out.println("SPAGREGAVALORANUNCIO");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        } finally {
            cf = null;
            con = null;
        }

    }

    public void actualizarValorAnuncio(ValorAnuncio valorAnuncio) throws Exception{
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;

        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPACTUALIZAVALORANUNCIO(?, ?)}");
            proc.setInt(1, valorAnuncio.getCodigo_anuncio());
            proc.setInt(2, valorAnuncio.getValor_real());
            proc.executeQuery();
            System.out.println("SPACTUALIZAVALORANUNCIO");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception();
        } finally {
            cf = null;
            con = null;
        }
    }
    
    public ValorAnuncio buscarValorAnuncioPorAnuncio(int cod_anuncio) throws Exception{
        ValorAnuncio valorAnuncio = null;
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        try {
            valorAnuncio = new ValorAnuncio();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAVALORANUNCIO(?)}");
            proc.setInt(1, cod_anuncio);
            rs = proc.executeQuery();
            System.out.println("SPBUSCAVALORANUNCIO");
            while (rs.next()) {
                valorAnuncio.setValor_real(rs.getInt("valor_real"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        
        return valorAnuncio;
    }

    public int buscarIdAnuncio(Anuncio anuncio) throws Exception{
        int codigo_anuncio = 0;
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAIDANUNCIO(?)}");
            proc.setString(1, anuncio.getNombre_anuncio());
            rs = proc.executeQuery();
            System.out.println("SPBUSCAIDANUNCIO");
            while (rs.next()) {
               codigo_anuncio = (rs.getInt("codigo_anuncio"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        
        return codigo_anuncio;
    }

}
