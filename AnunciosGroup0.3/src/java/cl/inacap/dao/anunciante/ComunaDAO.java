/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Comuna;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator
 */
public class ComunaDAO {

    public ArrayList<Comuna> BuscarComunas(int id_provincia) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Comuna> comunas = null;
        try {
            comunas = new ArrayList<Comuna>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARCCOMUNAS(?)}");
            proc.setInt(1, id_provincia);
            rs = proc.executeQuery();
            System.out.println("SPBUSCARCOMUNAS");
            
            while (rs.next()) {
                Comuna comuna = new Comuna();
                comuna.setNombre_comuna(rs.getString("nombre_comuna"));
                comuna.setId_comuna(rs.getInt("id_comuna"));
//
                comunas.add(comuna);
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
        return comunas;
    }

    public Comuna BuscaComuna(int idComuna) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        String query = null;
        ResultSet rs = null;
        Comuna comuna = null;
        //SPBUSCACOMUNA
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCACOMUNA(?)}");
            proc.setInt(1, idComuna);
            rs = proc.executeQuery();
            System.out.println("SPBUSCACOMUNA");
            while (rs.next()) {
                comuna = new Comuna();
                comuna.setNombre_comuna(rs.getString("nombre_comuna"));
                comuna.setId_comuna(rs.getInt("id_comuna"));
                comuna.setId_provincia(rs.getInt("id_provincia"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            cf.cerrarConexion();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            query = null;
            cf = null;
        }
        return comuna;
    }
}
