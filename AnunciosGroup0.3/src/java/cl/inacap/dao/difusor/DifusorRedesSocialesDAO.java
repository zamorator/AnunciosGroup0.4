/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.model.DifusorRedesSocialesR;
import cl.inacap.connect.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author zamorator
 */
public class DifusorRedesSocialesDAO {

    public boolean AgregaRedSocialDifusor(DifusorRedesSocialesR drsr) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("INSERT INTO difusor_redsocial_r (`id_red_social`, `nombre_u_difusor`) values("
                    + " '" + drsr.getId_red_social() + "',"
                    + " '" + drsr.getNombre_u_difusor() + "')"
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

    public int ConsultaRedSocialExistente(String nombreDifusor) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        StringBuilder query = null;
        ResultSet rs = null;
        int respuesta = 0;
        try {
            con = cf.obtenerConexion();
            query = new StringBuilder();
            query.append("SELECT COUNT(*) FROM difusor_redsocial_r WHERE nombre_u_difusor = '" + nombreDifusor + "'");
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

}
