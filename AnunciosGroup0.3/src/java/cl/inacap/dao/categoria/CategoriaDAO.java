/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.categoria;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Categoria;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class CategoriaDAO {
    public ArrayList<Categoria> BuscarCategorias() throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ArrayList<Categoria> categorias = null;
        try {
            categorias = new ArrayList<Categoria>();
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SPBUSCARCATEGORIAS}");
            rs = proc.executeQuery();
            System.out.println("SPBUSCARCATEGORIAS");
            
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setId_categoria(rs.getInt("id_categoria"));
                categoria.setNombre_categoria(rs.getString("nombre_categoria"));
                
                categorias.add(categoria);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            con = null;
            cf = null;
        }
        return categorias;
    }
}
