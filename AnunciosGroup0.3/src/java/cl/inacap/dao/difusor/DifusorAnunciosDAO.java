/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anuncio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author macbookair
 */
public class DifusorAnunciosDAO {
        
        public ArrayList<Anuncio> buscaranuncio() throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
            System.out.println(con);  
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO()}");
             System.out.println(proc);
            
            rs = proc.executeQuery();
            
            while(rs.next()){
            Anuncio anuncio = new Anuncio();
            anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
            anuncio.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            anuncio.setNombre_anuncio(rs.getString("NOMBRE_ANUNCIO"));
            anuncio.setImagen_anuncio(rs.getString("IMAGEN_ANUNCIO"));
            anuncio.setDescripcion_anuncio(rs.getString("DESCRIPCION_ANUNCIO"));
            anuncios.add(anuncio);
            }
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         return anuncios;

         }  
}

