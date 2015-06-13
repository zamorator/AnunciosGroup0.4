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
import java.util.List;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class GiroDetalleDAO {
    public List<GiroDetalle> listGiroDetalleByGiroCabecera(int id_giroCabecera) throws Exception{
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        List<GiroDetalle> giroDetalles = new ArrayList<GiroDetalle>();
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
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return giroDetalles;
    }
}
