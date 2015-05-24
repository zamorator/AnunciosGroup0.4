/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zamorator
 */
public class AnuncianteDAO {

    public Anunciante IniciarSesionAnunciante(String nombre, String password) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        Anunciante anunciante = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT * FROM `anunciante` WHERE nombre_u_anunciante = '" + nombre + "' and password_anunciante = '" + password + "'");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                anunciante = new Anunciante();
                anunciante.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
                anunciante.setId_comuna(rs.getInt("ID_COMUNA"));
                anunciante.setNombre_anunciante(rs.getString("NOMBRE_ANUNCIANTE"));
                anunciante.setDireccion_anunciante(rs.getString("DIRECCION_ANUNCIANTE"));
                anunciante.setPassword_anunciante(rs.getString("PASSWORD_ANUNCIANTE"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return anunciante;
    }

    public boolean AgregaAnunciante(Anunciante anunciante) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("INSERT INTO anunciante( nombre_u_anunciante, id_comuna, nombre_anunciante, direccion_anunciante, password_anunciante) values("
                    + " '" + anunciante.getNombre_u_anunciante() + "',"
                    + " " + anunciante.getId_comuna() + ","
                    + " '" + anunciante.getNombre_anunciante() + "',"
                    + " '" + anunciante.getDireccion_anunciante() + "',"
                    + " '" + anunciante.getPassword_anunciante() + "')"
            );
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            pst.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return true;
    }

    public int ConsultaNombreAnunciante(String nombre_u_anunciante) throws Exception {
        //select count(*) from anunciante where nombre_u_anunciante = "";
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        String query = null;
        ResultSet rs = null;
        int resultado = 0;
        try {
            con = cf.obtenerConexion();
            query = "select count(*) from anunciante where nombre_u_anunciante = '" + nombre_u_anunciante + "'";
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                resultado = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return resultado;
    }

    public boolean ActualizaAnunciante(Anunciante anunciante) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        String query = null;
        try {
            con = cf.obtenerConexion();
            query = "update anunciante set id_comuna = " + anunciante.getId_comuna() + ","
                    + " nombre_anunciante= '" + anunciante.getNombre_anunciante() + "',"
                    + " direccion_anunciante= '" + anunciante.getDireccion_anunciante() + "',"
                    + " password_anunciante = '" + anunciante.getPassword_anunciante() + "'"
                    + " where nombre_u_anunciante='" + anunciante.getNombre_u_anunciante() + "'";
            System.out.println(query);
            pst = con.prepareStatement(query);
            pst.execute();
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return true;
    }
}
