/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Difusor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zamorator
 */
public class DifusorDAO {

    public boolean AgregaDifusor(Difusor difusor) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("INSERT INTO DIFUSOR (`NOMBRE_U_DIFUSOR`, `NOMBRES`, `APELLIDO_PATERNO_DIFUSOR`, `APELLIDO_MATERNO_DIFUSOR`, `PASSWORD_DIFUSOR`, `EMAIL_DIFUSOR`, `ID_SEGMENTO_EDAD`, `ID_SEGMENTO_SEXO`) values("
                    + " '" + difusor.getNombre_u_difusor() + "',"
                    + " '" + difusor.getNombres() + "',"
                    + " '" + difusor.getApellido_paterno_difusor() + "',"
                    + " '" + difusor.getApellido_materno_difusor() + "',"
                    + " '" + difusor.getPassword_difusor() + "',"
                    + " '" + difusor.getEmail_difusor() + "',"
                    + difusor.getId_segmento_edad() + ","
                    + difusor.getId_segmento_sexo() + ")"
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

    public int ConsultaNombreDifusor(String nombreDifusor) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        int respuesta = 0;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT COUNT(*) FROM DIFUSOR WHERE nombre_u_difusor = '" + nombreDifusor + "'");
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                respuesta = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return respuesta;
    }

    public Difusor IniciaSesionDifusor(String nombre, String password) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        Difusor difusor = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT * FROM `difusor` WHERE nombre_u_difusor = " + nombre + " and password_difusor = " + password);
            System.out.println(query);
            pst = con.prepareStatement(query.toString());
            rs = pst.executeQuery();
            while (rs.next()) {
                difusor = new Difusor();
                difusor.setNombre_u_difusor(rs.getString(""));
                difusor.setNombres(rs.getString(""));
                difusor.setApellido_paterno_difusor(rs.getString(""));
                difusor.setApellido_materno_difusor(rs.getString(""));
                difusor.setPassword_difusor(rs.getString(""));
                difusor.setEmail_difusor(rs.getString(""));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            query = null;
            cf = null;
        }
        return difusor;
    }
}
