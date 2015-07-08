/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.dao.administrador;

import cl.inacap.connect.ConnectionFactory;
import cl.inacap.model.Administrador;
import cl.inacap.model.Anunciante;
import cl.inacap.model.Anuncio;
import cl.inacap.model.Mensaje;
import cl.inacap.model.ShareCoin;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Javoru
 */
public class AdministradorDAO {


public Administrador IniciaSesionAdministrador(String nombre, String password) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        ResultSet rs = null;
        Administrador administrador = null;
        try {
            con = cf.obtenerConexion();
            // con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
           
            // SE LLAMAN(?,?) RS = RESULSET QUE DEVUELVE DATOS 
            // RS ALMACENA LO QUE DEVULEVE EL ALMACENAMIENTO
            CallableStatement proc = con.prepareCall("{CALL SP_INICIAR_SESION_ADMINISTRADOR(?,?)}");
            proc.setString(1,nombre);
            proc.setString(2,password);
            rs = proc.executeQuery();
            System.out.println("SP_INICIAR_SESION_ADMINISTRADOR");
            System.out.println("SP_INICIAR_SESION_ADMINISTRADOR "+nombre + " " + password);
            
            //NOMBRE DEL CAMPO QUE DEVULEVE EL SP
            while (rs.next()) {
                administrador = new Administrador();
                administrador.setCodigo_administrador(rs.getInt("CODIGO_ADMINISTRADOR"));
                administrador.setNombre_u_administrador(rs.getString("NOMBRE_U_ADMINISTRADOR"));
                administrador.setNombre_administrador(rs.getString("NOMBRE_ADMINISTRADOR"));
                administrador.setPassword_administrador(rs.getString("PASSWORD_ADMINISTRADOR"));
                administrador.setApellido_paterno_administrador(rs.getString("APELLIDO_PATERNO_ADMINISTRADOR"));
                administrador.setApellido_materno_administrador(rs.getString("APELLIDO_MATERNO_ADMINISTRADOR"));
                administrador.setEmail_administrador(rs.getString("EMAIL_ADMINISTRADOR"));
                
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new Exception();
        } finally {
            cf.cerrarConexion();
            con = null;
            cf = null;
        }
        return administrador;
    }

public void AgregarAdministrador(Administrador administrador) throws Exception {
        ConnectionFactory cf = new ConnectionFactory();
        Connection con = null;
        try {
            int x = 0;
            con = cf.obtenerConexion();
            CallableStatement proc = con.prepareCall("{CALL SP_AGREGAR_ADMINISTRADOR(?,?,?,?,?,?)}");
            proc.setString(++x, administrador.getNombre_u_administrador());
            proc.setString(++x, administrador.getNombre_administrador());
            proc.setString(++x, administrador.getApellido_paterno_administrador());
            proc.setString(++x, administrador.getApellido_materno_administrador());
            proc.setString(++x, administrador.getPassword_administrador());
            proc.setString(++x, administrador.getEmail_administrador());
            System.out.println(proc);
            proc.executeQuery();
            

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            con = null;
            cf = null;
        }
    }

    public ArrayList<Anuncio> buscaranuncioadministrador() throws  Exception{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Anuncio> anuncios = new ArrayList<Anuncio>();
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIO_ADMINISTRADOR}");
                   
           
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
            Anuncio anuncio = new Anuncio();
            anuncio.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
            anuncio.setNombre_anuncio(rs.getString("NOMBRE_ANUNCIO"));
            anuncio.setImagen_anuncio(rs.getString("IMAGEN_ANUNCIO"));
            anuncio.setDescripcion_anuncio(rs.getString("DESCRIPCION_ANUNCIO"));
            anuncio.setCantidad_cupones(rs.getInt("CANTIDAD_CUPONES"));
            anuncio.setPorcentaje_descuento(rs.getInt("PORCENTAJE_DESCUENTO"));
            anuncio.setEstado_anuncio(rs.getString("ESTADO_ANUNCIO"));
            anuncio.setValor_real(rs.getInt("VALOR_REAL"));
            anuncio.setSharecoin_listos(rs.getInt("SHARECOIN_LISTOS"));
            anuncio.setSharecoin_pendientes(rs.getInt("SHARECOIN_PENDIENTES"));
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
    
    

    
    
    public boolean  actualizarestadoanuncio(int codigoanuncio) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            
           ResultSet rs = null;
           boolean resp = false;
           Anuncio estadoactualizado = new Anuncio();
           
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_ACTUALIZAR_ESTADO_ANUNCIO(?)}");
            proc.setInt(1, codigoanuncio);
           
            System.out.println(proc);
            //recibe el resultado de una query
            //rs recibe la tabla entera entera cuando se hace un slect
            resp = proc.execute();
            System.out.println(resp); 
            
            if (resp){
            
                return resp;
            }else{
                
                return resp;
            }
            
            
            
            } catch (SQLException x){
                x.printStackTrace();
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 

            return false;
}
    
    
       public ArrayList<Mensaje> buscarmensajes(String tipo_remitente) throws  Exception{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>();
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_MENSAJE(?)}");
            proc.setString(1, tipo_remitente);
           
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
            Mensaje mensaje = new Mensaje();
            mensaje.setId_mensaje(rs.getInt("ID_MENSAJE"));
            mensaje.setTipo_remitente(rs.getString("TIPO_REMITENTE"));
            mensaje.setPara(rs.getString("PARA"));
            mensaje.setDe(rs.getString("DE"));
            mensaje.setAsunto(rs.getString("ASUNTO"));
            mensaje.setMensaje(rs.getString("MENSAJE"));
            mensaje.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            mensaje.setCodigo_administrador(rs.getInt("CODIGO_ADMINISTRADOR"));
            mensaje.setFecha(rs.getString("FECHA"));
            
            mensajes.add(mensaje);
            }
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         return mensajes;
        
        }
    
    
    public void respondermensaje(Mensaje respuesta) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            
           ResultSet rs = null;
           boolean resp = false;
        
           
            try {  
            con = cf.obtenerConexion();
            int i = 0;
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_RESPONDER_MENSAJE(?,?,?,?,?,?,?,?)}"); //mandando
            proc.setString(++i, respuesta.getPara());
            proc.setString(++i, respuesta.getNombre_administrador());
            proc.setString(++i, respuesta.getAsunto());
            proc.setString(++i, respuesta.getMensaje());
            proc.setString(++i, respuesta.getNombre_u_anunciante());
            proc.setInt(++i, respuesta.getCodigo_administrador());
            proc.setString(++i, "A");
            proc.setString(++i, "NL");
           
            System.out.println(proc);
            //recibe el resultado de una query
            //rs recibe la tabla entera entera cuando se hace un slect
            //resp = proc.execute();
            proc.execute();
            System.out.println(resp); 
            
         //   if (resp){
            
           //     return resp;
            //}else{
                
              //  return resp;
           // }
           
            
            
            } catch (SQLException x){
                x.printStackTrace();
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 

          //  return false;
            
}
       
       
       
       
    public ArrayList<Anunciante> buscaranuncianteadministrador() throws  Exception{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Anunciante> anunciantes = new ArrayList<Anunciante>();
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_ANUNCIANTE_ADMINISTRADOR}");
                   
           
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
            Anunciante anunciante = new Anunciante();
            anunciante.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            anunciante.setId_comuna(rs.getInt("ID_COMUNA"));
            anunciante.setNombre_anunciante(rs.getString("NOMBRE_ANUNCIANTE"));
            anunciante.setDireccion_anunciante(rs.getString("DIRECCION_ANUNCIANTE"));
            anunciante.setEstado_anunciante(rs.getString("estado_anunciante"));
            anunciantes.add(anunciante);
            }
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         return anunciantes;
        
        }
    
    
    public boolean  actualizarestadoanunciante(String nombreuanunciante, String estado) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            
           ResultSet rs = null;
           boolean resp = false;
           Anunciante estadoactualizado = new Anunciante();
           
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_ACTUALIZAR_ESTADO_ANUNCIANTE(?,?)}");
            proc.setString(1, nombreuanunciante);
            proc.setString(2, estado);
           
            System.out.println(proc);
            //recibe el resultado de una query
            //rs recibe la tabla entera entera cuando se hace un slect
            resp = proc.execute();
            System.out.println(resp); 
            
            if (resp){
            
                return resp;
            }else{
                
                return resp;
            }
            
            
            
            } catch (SQLException x){
                x.printStackTrace();
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 

            return false;
}
    
     public ArrayList<ShareCoin> buscasharecoinp() throws  Exception{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<ShareCoin> sharecoin = new ArrayList<ShareCoin>();
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_SHARECOIN_P}");
                   
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
            ShareCoin sc = new ShareCoin();
            sc.setId_share_coin(rs.getInt("ID_SHARE_COIN"));
            sc.setCodigo_anuncio(rs.getInt("CODIGO_ANUNCIO"));
            sc.setCantidad_compartir(rs.getInt("CANTIDAD_COMPARTIR"));
            sc.setCantidad_extra_compartir(rs.getInt("CANTIDAD_EXTRA_COMPARTIR"));
            sc.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            sharecoin.add(sc);
            }
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        } 
         return sharecoin;
        
        }
     
     public void rechazarsharecoin(int id_share_coin) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            try {  
            con = cf.obtenerConexion();
            int i = 0;
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_RECHAZAR_SHARECOIN(?)}");        
            System.out.println(proc);
            proc.setInt(1, id_share_coin);
            proc.execute();
            } catch (SQLException x){
                x.printStackTrace();
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        }            
}

          public void aceptarsharecoin(int id_share_coin, int codigo_anuncio) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            try {  
            con = cf.obtenerConexion();
            int i = 0;
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_ACEPTAR_SHARECOIN(?,?)}");        
            System.out.println(proc);
            proc.setInt(1, codigo_anuncio);
            proc.setInt(2, id_share_coin);
            proc.execute();
            } catch (SQLException x){
                x.printStackTrace();
        }catch (Exception ex) {                  
            System.out.println(ex);
            ex.printStackTrace();
            throw new Exception();
       }finally {
            con = null;
            cf = null;
        }            
}
    public void respondermensaje(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    
    public void  rechazaranuncio(int codigoanuncio) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            

           Anuncio estadoactualizado = new Anuncio();
           
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_RECHAZAR_ANUNCIO(?)}");
            proc.setInt(1, codigoanuncio);
           
            System.out.println(proc);
            //recibe el resultado de una query
            //rs recibe la tabla entera entera cuando se hace un slect
            proc.execute();

            } catch (SQLException x){
                x.printStackTrace();
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
