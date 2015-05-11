/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Region;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        ArrayList<Region> regiones = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT region_id, nombre_region FROM region");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
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
            query = null;
            cf = null;
        }
        return regiones;
    }
}
