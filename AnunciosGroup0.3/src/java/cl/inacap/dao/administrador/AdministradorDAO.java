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
import cl.inacap.model.Difusor;
import cl.inacap.model.Mensaje;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
    
    
       public ArrayList<Mensaje> buscarmensajes() throws  Exception{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            ResultSet rs = null;
            ArrayList<Mensaje> mensajes = new ArrayList<Mensaje>();
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_BUSCAR_MENSAJE}");
                   
           
            System.out.println(proc);
            rs = proc.executeQuery();
            
            while(rs.next()){
            Mensaje mensaje = new Mensaje();
            mensaje.setId_mensaje(rs.getInt("ID_MENSAJE"));
            mensaje.setPara(rs.getString("PARA"));
            mensaje.setDe(rs.getString("DE"));
            mensaje.setAsunto(rs.getString("ASUNTO"));
            mensaje.setMensaje(rs.getString("MENSAJE"));
            mensaje.setNombre_u_anunciante(rs.getString("NOMBRE_U_ANUNCIANTE"));
            mensaje.setCodigo_administrador(rs.getInt("CODIGO_ADMINISTRADOR"));
            
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
    
    
    public boolean  respondermensaje(String mensaje) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            
           ResultSet rs = null;
           boolean resp = false;
        
           
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_RESPONDER_MENSAJE(?)}");
            proc.setString(1, mensaje);
           
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
            anunciante.setEstado_anunciante(rs.getString("ESTADO_ANUNCIANTE"));
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
    
    
    public boolean  actualizarestadoanunciante(String nombreuanunciante) throws  Exception, SQLClientInfoException{
            ConnectionFactory cf = new ConnectionFactory();
            Connection con = null;
            
           ResultSet rs = null;
           boolean resp = false;
           Anunciante estadoactualizado = new Anunciante();
           
            try {  
            con = cf.obtenerConexion();
            // se crea instancia a procedimiento.
            CallableStatement proc = con.prepareCall("{CALL SP_ACTUALIZAR_ESTADO_ANUNCIANTE(?)}");
            proc.setString(1, nombreuanunciante);
           
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
    


    private Anuncio IniciaSesionAdministrador(String estado_anuncio) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean buscarmensajes(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}    
