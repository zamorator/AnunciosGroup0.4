/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Provincia;
import java.sql.CallableStatement;
import java.sql.Connection;
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
        ResultSet rs = null;
        ArrayList<Provincia> provincias = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARPROVINCIAS(?)}");
            proc.setInt(1, id_region);
            rs = proc.executeQuery();
            provincias = new ArrayList<Provincia>();
            while (rs.next()) {
                Provincia provincia = new Provincia();
                provincia.setId_provincia(rs.getInt("id_provincia"));
                provincia.setNombre_provincia(rs.getString("nombre_provincia"));
                provincias.add(provincia);
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
        return provincias;
    }

    public Provincia BuscaProvincia(int id_provincia) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        Provincia provincia = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAPROVINCIA(?)}");
            proc.setInt(1, id_provincia);
            rs = proc.executeQuery();
            while (rs.next()) {
                provincia = new Provincia();
                provincia.setRegion_id(rs.getInt("region_id"));
                provincia.setId_provincia(rs.getInt("id_provincia"));
                provincia.setNombre_provincia(rs.getString("nombre_provincia"));
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
        return provincia;
    }
}
