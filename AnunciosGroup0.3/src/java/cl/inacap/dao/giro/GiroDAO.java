/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.giro;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Giro;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class GiroDAO {

    public ArrayList<Giro> listGiroByGiroDetalle(int id_giroDetalle) throws Exception{
        ArrayList<Giro> giros = new ArrayList<Giro>();
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPSGIRO(?)}");
            proc.setInt(1, id_giroDetalle);
            rs = proc.executeQuery();
            System.out.println("SPSGIRO");

            while (rs.next()) {
                Giro giro = new Giro();
                giro.setCodigo_giro(rs.getInt("CODIGO_GIRO"));
                giro.setId_giro_detalle(rs.getInt("ID_GIRO_DETALLE"));
                giro.setDetalle(rs.getString("DETALLE"));
                giro.setAfecto_iva(rs.getString("AFECTO_IVA"));
                giro.setCategoria_tributaria(rs.getInt("CATEGORIA_TRIBUTARIA"));
                giro.setDisponible_internet(rs.getString("DISPONIBLE_INTERNET"));
                
                giros.add(giro);
            }
        } catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        return giros;
    }
    
    public Giro buscaGiro(int codigo_giro) throws Exception{
        Giro giro = new Giro();
        ConnectionFactory cf = new ConnectionFactory();
        ResultSet rs = null;
        Connection con = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAGIRO(?)}");
            proc.setInt(1, codigo_giro);
            rs = proc.executeQuery();
            while (rs.next()) {
                giro.setAfecto_iva(rs.getString("afecto_iva"));
                giro.setCategoria_tributaria(rs.getInt("categoria_tributaria"));
                giro.setCodigo_giro(rs.getInt("codigo_giro"));
                giro.setDetalle(rs.getString("detalle"));
                giro.setDisponible_internet(rs.getString("disponible_internet"));
                giro.setId_giro_detalle(rs.getInt("id_giro_detalle"));
            }
            System.out.println("SPBUSCAGIRO");
            
        } catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        
        return giro;
    }
    
    public ArrayList<Giro> listaGirosRubroHeI() throws Exception{
        ArrayList<Giro> giros = new ArrayList<Giro>();
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SP_GIROS_POR_RUBRO_H_I()}");
            rs = proc.executeQuery();
            System.out.println("SP_GIROS_POR_RUBRO_H_I");

            while (rs.next()) {
                Giro giro = new Giro();
                giro.setCodigo_giro(rs.getInt("CODIGO_GIRO"));
                giro.setId_giro_detalle(rs.getInt("ID_GIRO_DETALLE"));
                giro.setDetalle(rs.getString("DETALLE"));
                giro.setAfecto_iva(rs.getString("AFECTO_IVA"));
                giro.setCategoria_tributaria(rs.getInt("CATEGORIA_TRIBUTARIA"));
                giro.setDisponible_internet(rs.getString("DISPONIBLE_INTERNET"));
                
                giros.add(giro);
            }
        } catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        return giros;
    }
}
