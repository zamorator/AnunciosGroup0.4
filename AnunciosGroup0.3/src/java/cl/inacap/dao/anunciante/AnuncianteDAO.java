/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import java.sql.CallableStatement;
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
        ResultSet rs = null;
        Anunciante anunciante = null;
        try {

            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SP_INICIARSESIONANUNCIANTE(?,?)}");
            proc.setString(1, nombre);
            proc.setString(2, password);
            rs = proc.executeQuery();
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
            cf = null;
        }
        return anunciante;
    }

    public boolean AgregaAnunciante(Anunciante anunciante) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPAGREGAANUNCIANTE(?,?,?,?,?)}");
            proc.setString(1, anunciante.getNombre_u_anunciante());
            proc.setInt(2, anunciante.getId_comuna());
            proc.setString(3,anunciante.getNombre_anunciante());
            proc.setString(4, anunciante.getDireccion_anunciante());
            proc.setString(5, anunciante.getPassword_anunciante());
            proc.executeQuery();
            System.out.println("SPAGREGAANUNCIANTE");
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return true;
    }

    public int ConsultaNombreAnunciante(String nombre_u_anunciante) throws Exception {
        //select count(*) from anunciante where nombre_u_anunciante = "";
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        int resultado = 0;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPCONSULTANOMBREANUNCIANTE(?)}");
            proc.setString(1, nombre_u_anunciante);
            rs = proc.executeQuery();
            System.out.println("SPCONSULTANOMBREANUNCIANTE");
            
            while (rs.next()) {
                resultado = rs.getInt(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return resultado;
    }

    public boolean ActualizaAnunciante(Anunciante anunciante) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPACTUALIZAANUNCIANTE(?,?,?,?,?)}");
            proc.setInt(1, anunciante.getId_comuna());
            proc.setString(2, anunciante.getNombre_anunciante());
            proc.setString(3, anunciante.getDireccion_anunciante());
            proc.setString(4, anunciante.getPassword_anunciante());
            proc.setString(5, anunciante.getNombre_u_anunciante());
            proc.executeQuery();
            System.out.println("SPACTUALIZAANUNCIANTE");
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return true;
    }
}
