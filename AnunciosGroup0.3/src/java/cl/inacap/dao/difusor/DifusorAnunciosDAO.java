/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.difusor;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Anuncio;
import cl.inacap.model.Cupon;
import cl.inacap.model.Difusor;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
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
            System.out.println("favorito:"+rs.getInt("ESTADO_FAVORITO"));
            anuncio.setFavorito(rs.getInt("ESTADO_FAVORITO"));
            anuncio.setPorcentaje_descuento(rs.getInt("PORCENTAJE_DESCUENTO"));
            anuncio.setValor_real(rs.getInt("VALOR_REAL"));
            anuncio.setCantidad_cupones(rs.getInt("CANTIDAD_CUPONES"));
            anuncios.add(anuncio);
            }
        }catch (Exception ex) {
            ex.printStackTrace();
            cf.cerrarConexion();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
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
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO_SUGERIDOS(?,?,?)}");
             
            
            proc.setInt(1,difusor.getId_segmento_sexo());
            proc.setInt(2,difusor.getId_segmento_edad());
            proc.setString(3, difusor.getNombre_u_difusor());
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
            anuncio.setPorcentaje_descuento(rs.getInt("PORCENTAJE_DESCUENTO"));
            anuncio.setValor_real(rs.getInt("VALOR_REAL"));
            anuncio.setCantidad_cupones(rs.getInt("CANTIDAD_CUPONES"));
            anuncios.add(anuncio);
            }
        }catch (Exception ex) {
            ex.printStackTrace();
            cf.cerrarConexion();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
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
            anuncio.setFavorito(rs.getInt("ESTADO_FAVORITO"));
            anuncio.setPorcentaje_descuento(rs.getInt("PORCENTAJE_DESCUENTO"));
            anuncio.setValor_real(rs.getInt("VALOR_REAL"));
            anuncio.setCantidad_cupones(rs.getInt("CANTIDAD_CUPONES"));
            anuncios.add(anuncio);
            }
        }catch (Exception ex) {
            ex.printStackTrace();
            cf.cerrarConexion();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         return anuncios;
        
        }
        
        
        public Anuncio buscaranuncioespecifico(Anuncio inanuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null; 
            Anuncio anuncio = new Anuncio();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO_ESPECIFICO(?)}");
            proc.setInt(1,inanuncio.getCodigo_anuncio());
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
                anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
                anuncio.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
                anuncio.setNombre_anuncio(rs.getString("NOMBRE_ANUNCIO"));
                anuncio.setImagen_anuncio(rs.getString("IMAGEN_ANUNCIO"));
                anuncio.setDescripcion_anuncio(rs.getString("DESCRIPCION_ANUNCIO"));
                anuncio.setPorcentaje_descuento(rs.getInt("PORCENTAJE_DESCUENTO"));
                anuncio.setValor_real(rs.getInt("VALOR_REAL"));   
            }
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
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
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
        
        }
       
        public int contartotalpuntos(Difusor difusor) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            int total_puntos = 0;
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_CONTAR_TOTAL_PUNTOS(?)}");
            proc.setString(1,difusor.getNombre_u_difusor());
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){            
                total_puntos = rs.getInt("TOTAL_COINS");
            }
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         return total_puntos;

         }
        
        public boolean crearcupon(Cupon cupon) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_CREAR_CUPON(?,?,?,?)}");
            proc.setString(1,cupon.getNombre_u_difusor());
            proc.setInt(2, Integer.parseInt(cupon.getCodigo_anuncio()));
            proc.setString(3,cupon.getDescuento_obtenido());
            proc.setInt(4,Integer.parseInt(cupon.getValor_final_producto()));
            System.out.println(proc);
            rs = proc.execute();
            
            if(rs){
                return false;
            }else{
                return true;
            }
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         

         }
        
        public ArrayList<Cupon> buscarcupones(String nombredifusor) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Cupon> cupones = new ArrayList<Cupon>();
           
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_CUPONES(?)}");
            proc.setString(1, nombredifusor);
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
             Cupon cupon = new Cupon();
             cupon.setId_cupon(rs.getInt("ID_CUPON"));
             cupon.setNombre_u_difusor(rs.getString("NOMBRE_U_DIFUSOR"));
             cupon.setCodigo_anuncio(rs.getString("CODIGO_ANUNCIO"));
             cupon.setDescuento_obtenido(rs.getString("DESCUENTO_OBTENIDO"));
             cupon.setValor_final_producto(rs.getString("VALOR_FINAL"));
             cupon.setImg_anuncio(rs.getString("IMAGEN_ANUNCIO"));
             cupon.setDescripcion_cupon(rs.getString("DESCRIPCION"));
             cupones.add(cupon);
            }
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         return cupones;
        }
       
        public boolean descontarcoin(Cupon cupon) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_DESCONTAR_COIN(?)}");
            proc.setInt(1,cupon.getPtos_utilizados());
            System.out.println(proc);
            rs = proc.execute();
            
            if(rs){
                return false;
            }else{
                return true;
            }
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         

         }
        
        public Cupon buscarcupon(int id_cupon) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;      
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_CUPON(?)}");
            proc.setInt(1, id_cupon);
            System.out.println(proc);
            rs = proc.executeQuery();
            Cupon cupon = new Cupon();
            while(rs.next()){
             
             cupon.setId_cupon(rs.getInt("ID_CUPON"));
             cupon.setNombre_u_difusor(rs.getString("NOMBRE_U_DIFUSOR"));
             cupon.setCodigo_anuncio(rs.getString("CODIGO_ANUNCIO"));
             cupon.setDescuento_obtenido(rs.getString("DESCUENTO_OBTENIDO"));
             cupon.setValor_final_producto(rs.getString("VALOR_FINAL"));
             cupon.setImg_anuncio(rs.getString("IMAGEN_ANUNCIO"));
             cupon.setDescripcion_cupon(rs.getString("NOMBRE_ANUNCIO"));
             cupon.setDescripcion_cupon2(rs.getString("DESCRIPCION_ANUNCIO"));
             
            }
            return cupon;
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         
        }
        
        public boolean agregacoin(String nombre_difusor, String codigo_anuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_AGREGA_COIN(?,?)}");
            proc.setString(1,nombre_difusor);
            proc.setString(2,codigo_anuncio);
            System.out.println(proc);
            rs = proc.execute();
            
            if(rs){
                return false;
            }else{
                return true;
            }
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         

         }
        
        
        public boolean agregarpublicacion(String nombre_difusor, String codigo_anuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
            int total_puntos = 0;
            Anuncio anuncio = new Anuncio();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_AGREGA_PUBLICACION(?,?)}");
            proc.setString(1,codigo_anuncio);
            proc.setString(2,nombre_difusor);
            
            System.out.println(proc);
            rs = proc.execute();
            
            if(rs){
                return false;
            }else{
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
        
        public String verificarpublicar(String nombre_difusor, String codigo_anuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
            int total_puntos = 0;
            Anuncio anuncio = new Anuncio();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_VERIFICA_PUBLICAR(?,?,?)}");
            proc.setString(1,codigo_anuncio);
            proc.setString(2,nombre_difusor);
            proc.registerOutParameter(3, java.sql.Types.VARCHAR);
            System.out.println(proc);
            rs = proc.execute();
            System.out.println(proc.getString(3));
            
            return proc.getString(3);
            
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         

         }
        
        public Anunciante buscaanuncianteporanuncio(int codigo_anuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;      
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCA_ANUNCIANTE_POR_CODIGO_ANUNCIO(?)}");
            proc.setInt(1, codigo_anuncio);
            System.out.println(proc);
            rs = proc.executeQuery();
            Anunciante anunciante = new Anunciante();
            
            while(rs.next()){
             
                anunciante.setNombre_anunciante(rs.getString("NOMBRE_ANUNCIANTE"));
                anunciante.setEmail_anunciante(rs.getString("EMAIL_ANUNCIANTE"));
                anunciante.setNombre_comuna(rs.getString("COMUNA"));
                anunciante.setNombre_privincia(rs.getString("PROVINCIA"));
                anunciante.setDireccion_anunciante(rs.getString("DIRECCION_ANUNCIANTE"));
            }
            return anunciante;
        }catch (Exception ex) {
            cf.cerrarConexion();
            ex.printStackTrace();
            throw new Exception();
       }finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        } 
         
        }
        
        public void quitarsharecoins(String codigo_anuncio) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
            int total_puntos = 0;
            Anuncio anuncio = new Anuncio();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_QUITAR_SHARE_COIN(?)}");
            proc.setString(1,codigo_anuncio);
            
            
            System.out.println(proc);
            rs = proc.execute();
            

        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         

         }
        public void descontarcupon(Cupon cupon) throws Exception {
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            boolean rs = false;
            int total_puntos = 0;
            Anuncio anuncio = new Anuncio();
         try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_DESCONTAR_CUPON(?)}");
            proc.setString(1,cupon.getCodigo_anuncio());
            
            
            System.out.println(proc);
            rs = proc.execute();
            

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

