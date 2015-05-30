/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.segmentos;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.SegmentoSexo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class SegmentoSexoDAO {

    public ArrayList<SegmentoSexo> BuscarSegmentoSexo() throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<SegmentoSexo> sementoSexos = null;
        try {
            sementoSexos = new ArrayList<SegmentoSexo>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARSEGMENTOSEXOS}");
            rs = proc.executeQuery();
            System.out.println("SPBUSCARSEGMENTOSEXOS");
            
            while (rs.next()) {
                SegmentoSexo segmentoSexo = new SegmentoSexo();
                segmentoSexo.setId_segmento_sexo(rs.getInt("id_segmento_sexo"));
                segmentoSexo.setSegmento_sexo(rs.getString("segmento_sexo"));
                sementoSexos.add(segmentoSexo);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return sementoSexos;
    }
}
