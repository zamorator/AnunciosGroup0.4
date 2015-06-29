/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.anunciante;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Mensaje;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class MensajeDAO {

    public ArrayList<Mensaje> buscarMensajesAnunciante(Anunciante anunciante) throws Exception {
        ArrayList<Mensaje> mensajesAnunciante = new ArrayList<Mensaje>();
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCAMENSAJESPORANUNCIANTE(?)}");
            proc.setString(1, anunciante.getNombre_u_anunciante());
            rs = proc.executeQuery();
            System.out.println("SPBUSCAMENSAJESPORANUNCIANTE");

            while (rs.next()) {
                Mensaje mensaje = new Mensaje();
                mensaje.setId_mensaje(rs.getInt("id_mensaje"));
                mensaje.setPara(rs.getString("PARA"));
                mensaje.setDe(rs.getString("DE"));
                mensaje.setAsunto(rs.getString("ASUNTO"));
                mensaje.setMensaje(rs.getString("MENSAJE"));
                mensaje.setEstado(rs.getString("ESTADO"));
                
                mensajesAnunciante.add(mensaje);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }

        return mensajesAnunciante;
    }

    public void agregarMensaje(Mensaje mensaje) throws Exception{
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        try {
            int x = 0;
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPCREARMENSAJE(?,?,?,?,?,?)}");
            proc.setString(++x, mensaje.getDe() );
            proc.setString(++x, mensaje.getPara() );
            proc.setString(++x, mensaje.getAsunto() );
            proc.setString(++x, mensaje.getMensaje() );
            proc.setString(++x, mensaje.getNombre_u_anunciante() );
            proc.setString(++x, "E"); //E -> empresa
            proc.executeQuery();
            System.out.println("SPCREARMENSAJE");

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con = null;
            cf = null;
        }
    }
}
