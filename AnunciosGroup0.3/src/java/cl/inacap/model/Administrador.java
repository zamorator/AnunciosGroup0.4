/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.model;

/**
 *
 * @author zamorator
 */
public class Administrador {

    private int codigo_administrador;
    private String nombre_u_administrador;
    private String nombre_administrador;
    private String apellido_paterno_administrador;
    private String apellido_materno_administrador;
    private String email_administrador;
    private String password_administrador;

    public int getCodigo_administrador() {
        return codigo_administrador;
    }

    public void setCodigo_administrador(int codigo_administrador) {
        this.codigo_administrador = codigo_administrador;
    }

    public String getNombre_u_administrador() {
        return nombre_u_administrador;
    }

    public void setNombre_u_administrador(String nombre_u_administrador) {
        this.nombre_u_administrador = nombre_u_administrador;
    }

    public String getNombre_administrador() {
        return nombre_administrador;
    }

    public void setNombre_administrador(String nombre_administrador) {
        this.nombre_administrador = nombre_administrador;
    }

    public String getApellido_paterno_administrador() {
        return apellido_paterno_administrador;
    }

    public void setApellido_paterno_administrador(String apellido_paterno_administrador) {
        this.apellido_paterno_administrador = apellido_paterno_administrador;
    }

    public String getApellido_materno_administrador() {
        return apellido_materno_administrador;
    }

    public void setApellido_materno_administrador(String apellido_materno_administrador) {
        this.apellido_materno_administrador = apellido_materno_administrador;
    }

    public String getEmail_administrador() {
        return email_administrador;
    }

    public void setEmail_administrador(String email_administrador) {
        this.email_administrador = email_administrador;
    }
    
    public String getPassword_administrador() {
        return password_administrador;
    }

    public void setPassword_administrador(String password_administrador) {
        this.password_administrador = password_administrador;
    }

}
