/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Difusor;
import java.sql.CallableStatement;
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
            query.append("INSERT INTO DIFUSOR (`NOMBRE_U_DIFUSOR`, `NOMBRES`, `APELLIDO_PATERNO_DIFUSOR`, `APELLIDO_MATERNO_DIFUSOR`, `PASSWORD_DIFUSOR`, `EMAIL_DIFUSOR`, `ID_SEGMENTO_EDAD`, `ID_SEGMENTO_SEXO`,`ID_AVATAR`) values("
                    + " '" + difusor.getNombre_u_difusor() + "',"
                    + " '" + difusor.getNombres() + "',"
                    + " '" + difusor.getApellido_paterno_difusor() + "',"
                    + " '" + difusor.getApellido_materno_difusor() + "',"
                    + " '" + difusor.getPassword_difusor() + "',"
                    + " '" + difusor.getEmail_difusor() + "',"
                    + difusor.getId_segmento_edad() + ","
                    + difusor.getId_segmento_sexo() + ","
                    + difusor.getId_avatar() + ")"
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
            query.append("SELECT COUNT(*) FROM difusor WHERE nombre_u_difusor = '" + nombreDifusor + "'");
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
        ResultSet rs = null;
        Difusor difusor = null;
        try {
            con = cf.obtenerConexion();
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
           Difusor difusoractualizado = new Difusor();
      
            CallableStatement proc = con.prepareCall("{CALL SP_INICIAR_SESION_DIFUSOR(?,?)}");
            proc.setString(1,nombre);
            proc.setString(2,password);
            rs = proc.executeQuery();
            while (rs.next()) {
                difusor = new Difusor();
                difusor.setNombre_u_difusor(rs.getString("NOMBRE_U_DIFUSOR"));
                difusor.setNombres(rs.getString("NOMBRES"));
                difusor.setApellido_paterno_difusor(rs.getString("APELLIDO_PATERNO_DIFUSOR"));
                difusor.setApellido_materno_difusor(rs.getString("APELLIDO_MATERNO_DIFUSOR"));
                difusor.setEmail_difusor(rs.getString("EMAIL_DIFUSOR"));
                difusor.setNombre_avatar(rs.getString("AVATAR"));
                difusor.setId_segmento_sexo(rs.getInt("ID_SEGMENTO_SEXO"));
                difusor.setId_segmento_edad(rs.getInt("ID_SEGMENTO_EDAD"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return difusor;
    }
    
    public Difusor ActualizarPerfilDifusor(Difusor difusor) throws Exception{
    
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            boolean resp =false; 
         try {  
           con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
           Difusor difusoractualizado = new Difusor();
      
           CallableStatement proc = con.prepareCall("{CALL SP_ACTUALIZAR_PERFIL_DIFUSOR(?,?,?,?,?)}");
           
           proc.setString(1, difusor.getNombre_u_difusor());
           proc.setString(2,difusor.getNombres());
           proc.setString(3,difusor.getApellido_paterno_difusor());
           proc.setString(4,difusor.getApellido_materno_difusor());
           proc.setString(5,difusor.getEmail_difusor());
           System.out.println(proc); 
           
           resp = proc.execute();
            System.out.println(resp); 
            if (resp){
                difusor = null;
                return difusor;
            }else{
                difusoractualizado = IniciaSesionDifusor(difusor.getNombre_u_difusor(),difusor.getPassword_difusor());
                return difusor;
            }
            
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         
    }
 
}
