/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.giro;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Giro;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class GiroDAO {

    public List<Giro> listGiroByGiroDetalle(int id_giroDetalle) throws Exception{
        List<Giro> giros = new ArrayList<Giro>();
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPSGIRO(?)}");
            proc.setInt(1, id_giroDetalle);
            rs = proc.executeQuery();
            System.out.println("SPSGIRO");

            while (rs.next()) {
                Giro giro = new Giro();
                giro.setCodigo_giro(rs.getInt("CODIGO_GIRO"));
                giro.setId_giro_detalle(rs.getInt("ID_GIRO_DETALLE"));
                giro.setDetalle(rs.getString("DETALLE"));
                giro.setAfecto_iva(rs.getString("AFECTO_IVA"));
                giro.setCategoria_tributaria(rs.getInt("CATEGORIA_TRIBUTARIA"));
                giro.setDisponible_internet(rs.getString("DISPONIBLE_INTERNET"));
                
                giros.add(giro);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return giros;
    }
}
