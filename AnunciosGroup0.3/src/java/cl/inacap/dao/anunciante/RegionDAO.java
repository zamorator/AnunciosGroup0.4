/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Region;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator
 */
public class RegionDAO {

    public ArrayList<Region> BuscarRegiones() throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        ArrayList<Region> regiones = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARREGIONES}");
            rs = proc.executeQuery();
            regiones = new ArrayList<Region>();
            while (rs.next()) {
                Region region = new Region();
                region.setRegion_id(rs.getInt("region_id"));
                region.setNombre_region(rs.getString("nombre_region"));
                regiones.add(region);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return regiones;
    }

    public Region BuscarRegion(int id_region) throws Exception{
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        Region region = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARREGION(?)}");
            proc.setInt(1, id_region);
            rs = proc.executeQuery();
            while (rs.next()) {
                region = new Region();
                region.setRegion_id(rs.getInt("region_id"));
                region.setNombre_region(rs.getString("nombre_region"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return region;
    }
}
