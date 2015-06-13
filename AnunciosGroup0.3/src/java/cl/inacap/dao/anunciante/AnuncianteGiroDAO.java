/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.AnuncianteGiro;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class AnuncianteGiroDAO {
    
    public void agregarAnuncianteGiro(int cod_giro, String nombre_u_anunciante) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPAGREGAANUNCIANTEGIRO(?,?)}");
            proc.setInt(1, cod_giro);
            proc.setString(2, nombre_u_anunciante);
            proc.executeQuery();
            System.out.println("SPAGREGAANUNCIANTEGIRO");
            
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
    }
    
    public AnuncianteGiro buscaAnuncianteGiro(String nombre_u_anunciante) throws Exception {
        AnuncianteGiro ag = new AnuncianteGiro();
        ConnectionFactory cf = new ConnectionFactory();
        ResultSet rs = null;
        Connection con = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAANUNCIANTEGIRO(?)}");
            proc.setString(1, nombre_u_anunciante);
            rs = proc.executeQuery();
            while (rs.next()) {
                ag.setCodigo_giro(rs.getInt("codigo_giro"));
                ag.setNombre_u_anunciante(rs.getString("nombre_u_anunciante"));
            }
            System.out.println("SPBUSCAANUNCIANTEGIRO");
            
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        
        return ag;
    }
    
}
