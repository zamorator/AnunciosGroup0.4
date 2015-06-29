/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.giro;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.GiroCabecera;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class GiroCabeceraDAO {

    public ArrayList<GiroCabecera> listCabeceraGiro() throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        ArrayList<GiroCabecera> giroCabeceras = new ArrayList<GiroCabecera>();
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SP_GIROCABECERA}");
            rs = proc.executeQuery();
            System.out.println("SP_GIROCABECERA");
            giroCabeceras = new ArrayList<GiroCabecera>();
            while (rs.next()) {
                GiroCabecera giroCabecera = new GiroCabecera();

                giroCabecera.setGiro_cabecera(rs.getInt("ID_GIRO_CABECERA"));
                giroCabecera.setNombre_giro_cabecera(rs.getString("NOMBRE_GIRO_CABECERA"));

                giroCabeceras.add(giroCabecera);
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

        return giroCabeceras;
    }

    public GiroCabecera buscaGiroCabecera(int id_giro_cabecera) throws Exception{
        GiroCabecera gc = new GiroCabecera();
        ConnectionFactory cf = new ConnectionFactory();
        ResultSet rs = null;
        Connection con = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAGIROCABECERA(?)}");
            proc.setInt(1, id_giro_cabecera);
            rs = proc.executeQuery();
            while (rs.next()) {
                
                gc.setGiro_cabecera(rs.getInt("id_giro_cabecera"));
                gc.setNombre_giro_cabecera(rs.getString("nombre_giro_cabecera"));
            }
            System.out.println("SPBUSCAGIROCABECERA");

        } catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        return gc;
    }
}
