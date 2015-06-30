/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.segmentos;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.SegmentoEdad;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class SegmentoEdadDAO {

    public ArrayList<SegmentoEdad> BuscarSegmentoEdades() throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        ArrayList<SegmentoEdad> sementoEdad = null;
        try {
            sementoEdad = new ArrayList<SegmentoEdad>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARSEGMENTOSEDADES}");
            rs = proc.executeQuery();
            System.out.println("SPBUSCARSEGMENTOSEDADES");

            while (rs.next()) {
                SegmentoEdad segmentoedad = new SegmentoEdad();
                segmentoedad.setId_segmento_edad(rs.getInt("id_segmento_edad"));
                segmentoedad.setSegmento_edad(rs.getString("segmento_edad"));

                sementoEdad.add(segmentoedad);
            }
        } catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        return sementoEdad;
    }
}
