/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Comuna;
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
        String query = null;
        ResultSet rs = null;
        ArrayList<Comuna> comunas = null;
        try {
            con = cf.obtenerConexion();
            query = "select id_comuna, nombre_comuna from comuna where id_provincia = " + id_provincia;
            System.out.println(query);
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            comunas = new ArrayList<Comuna>();
            while (rs.next()) {
                Comuna comuna = new Comuna();
                comuna.setNombre_comuna(rs.getString("nombre_comuna"));
                comuna.setId_comuna(rs.getInt("id_comuna"));
//
                comunas.add(comuna);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
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
        try {
            con = cf.obtenerConexion();
            query = "select id_comuna, nombre_comuna, id_provincia from comuna where id_comuna = " + idComuna;
            System.out.println(query);
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                comuna = new Comuna();
                comuna.setNombre_comuna(rs.getString("nombre_comuna"));
                comuna.setId_comuna(rs.getInt("id_comuna"));
                comuna.setId_provincia(rs.getInt("id_provincia"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return comuna;
    }
}
