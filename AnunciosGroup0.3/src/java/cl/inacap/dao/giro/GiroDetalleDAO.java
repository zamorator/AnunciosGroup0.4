/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.giro;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.GiroDetalle;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class GiroDetalleDAO {
    public ArrayList<GiroDetalle> listGiroDetalleByGiroCabecera(int id_giroCabecera) throws Exception{
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        ArrayList<GiroDetalle> giroDetalles = new ArrayList<GiroDetalle>();
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPGIRODETALLE(?)}");
            proc.setInt(1, id_giroCabecera);
            rs = proc.executeQuery();
            System.out.println("SPGIRODETALLE");
            while (rs.next()) {
                GiroDetalle giroDetalle = new GiroDetalle();
                
                giroDetalle.setId_giro_detalle(rs.getInt("ID_GIRO_DETALLE"));
                giroDetalle.setNombre_giro_detalle(rs.getString("NOMBRE_GIRO_DETALLE"));
                giroDetalle.setId_giro_cabecera(rs.getInt("ID_GIRO_CABECERA"));
                
                giroDetalles.add(giroDetalle);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            cf.cerrarConexion();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        return giroDetalles;
    }
    
    public GiroDetalle buscaGiroDetalle(int cod_giro_detalle) throws Exception{
        GiroDetalle gd = new GiroDetalle();
        ConnectionFactory cf = new ConnectionFactory();
        ResultSet rs = null;
        Connection con = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAGIRODETALLE(?)}");
            proc.setInt(1, cod_giro_detalle);
            rs = proc.executeQuery();
            while (rs.next()) {
               gd.setId_giro_detalle(rs.getInt("id_giro_detalle"));
               gd.setNombre_giro_detalle(rs.getString("nombre_giro_detalle"));
               gd.setId_giro_cabecera(rs.getInt("id_giro_cabecera"));
            }
            System.out.println("SPBUSCAGIRODETALLE");
            
        } catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        
        return gd;
    }
}
