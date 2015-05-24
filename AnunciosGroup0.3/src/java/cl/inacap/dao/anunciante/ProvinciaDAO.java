/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Provincia;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class ProvinciaDAO {

    public ArrayList<Provincia> BuscarProvincias(int id_region) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        String query = null;
        ResultSet rs = null;
        ArrayList<Provincia> provincias = null;
        try {
            con = cf.obtenerConexion();
            query = new String();
            query = "SELECT id_provincia, nombre_provincia FROM provincia WHERE region_id = " + id_region;
            System.out.println(query);
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            provincias = new ArrayList<Provincia>();
            while (rs.next()) {
                Provincia provincia = new Provincia();
                provincia.setId_provincia(rs.getInt("id_provincia"));
                provincia.setNombre_provincia(rs.getString("nombre_provincia"));
                provincias.add(provincia);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return provincias;
    }

    public Provincia BuscaProvincia(int id_provincia) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        String query = null;
        ResultSet rs = null;
        Provincia provincia = null;
        try {
            con = cf.obtenerConexion();
            query = new String();
            query = "SELECT id_provincia, nombre_provincia, region_id FROM provincia WHERE id_provincia = " + id_provincia;
            System.out.println(query);
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                provincia = new Provincia();
                provincia.setId_provincia(rs.getInt("id_provincia"));
                provincia.setNombre_provincia(rs.getString("nombre_provincia"));
                provincia.setRegion_id(rs.getInt("region_id"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return provincia;
    }
}
