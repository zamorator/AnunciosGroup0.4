/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anuncio;
import cl.inacap.model.Difusor;
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
        
        public ArrayList<Anuncio> buscaranuncio(int desde, int hasta, String nombre_difusor) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
            System.out.println("llegue");  
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO(?,?,?)}");
            
            proc.setInt(1, desde);
            proc.setInt(2, hasta);
            proc.setString(3, nombre_difusor);
             System.out.println(proc);
            
            rs = proc.executeQuery();
            
            while(rs.next()){
            Anuncio anuncio = new Anuncio();
            anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
            anuncio.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            anuncio.setNombre_anuncio(rs.getString("NOMBRE_ANUNCIO"));
            anuncio.setImagen_anuncio(rs.getString("IMAGEN_ANUNCIO"));
            anuncio.setDescripcion_anuncio(rs.getString("DESCRIPCION_ANUNCIO"));
            anuncio.setFavorito(rs.getInt("ESTADO_FAVORITO"));
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
        
        public ArrayList<Anuncio> buscaranunciosugerido(Difusor difusor) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO_SUGERIDOS(?,?)}");
             
             
            proc.setInt(1,difusor.getId_segmento_sexo());
            proc.setInt(2,difusor.getId_segmento_edad());
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
        
        public ArrayList<Anuncio> buscaranunciofavortio(Difusor difusor) throws  Exception{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO_FAVORITO(?)}");
                   
            proc.setString(1,difusor.getNombre_u_difusor());
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
            Anuncio anuncio = new Anuncio();
            anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
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
        
        
        public Anuncio buscaranuncioespecifico(Anuncio inanuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            System.out.println(con);  
            Anuncio anuncio = new Anuncio();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO_ESPECIFICO(?)}");
             System.out.println(proc);
            proc.setInt(1,inanuncio.getCodigo_anuncio());
            rs = proc.executeQuery();
            
            while(rs.next()){
            
            anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
            anuncio.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            anuncio.setNombre_anuncio(rs.getString("NOMBRE_ANUNCIO"));
            anuncio.setImagen_anuncio(rs.getString("IMAGEN_ANUNCIO"));
            anuncio.setDescripcion_anuncio(rs.getString("DESCRIPCION_ANUNCIO"));
            
            
            }
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         return anuncio;

         }
        
       public Boolean agregarfavorito(String codigo_anuncio, String nombre_difusor) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            Boolean rs = false;
            System.out.println(codigo_anuncio);  
            System.out.println(nombre_difusor);  
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_AGREGA_FAVORITO(?,?)}");           
            proc.setInt(1,Integer.parseInt((codigo_anuncio.trim())));
            proc.setString(2,nombre_difusor.trim());
            System.out.println(proc);
            rs = proc.execute();
            
            if(rs = false){
                System.out.println("false");
                return false;
            }else{
                System.out.println("true");
               return true;    
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

