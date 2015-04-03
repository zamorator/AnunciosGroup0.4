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
public class Difusor {
    private String nombre_u_difusor;
    private String nombres;
    private String apellido_paterno_difusor;
    private String apellido_materno_difusor;
    private String password_difusor;
    private String email_difusor;
    private int id_segmento_edad;
    private int id_segmento_sexo;

    public String getNombre_u_difusor() {
        return nombre_u_difusor;
    }

    public void setNombre_u_difusor(String nombre_u_difusor) {
        this.nombre_u_difusor = nombre_u_difusor;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellido_paterno_difusor() {
        return apellido_paterno_difusor;
    }

    public void setApellido_paterno_difusor(String apellido_paterno_difusor) {
        this.apellido_paterno_difusor = apellido_paterno_difusor;
    }

    public String getApellido_materno_difusor() {
        return apellido_materno_difusor;
    }

    public void setApellido_materno_difusor(String apellido_materno_difusor) {
        this.apellido_materno_difusor = apellido_materno_difusor;
    }

    public String getPassword_difusor() {
        return password_difusor;
    }

    public void setPassword_difusor(String password_difusor) {
        this.password_difusor = password_difusor;
    }

    public String getEmail_difusor() {
        return email_difusor;
    }

    public void setEmail_difusor(String email_difusor) {
        this.email_difusor = email_difusor;
    }

    public int getId_segmento_edad() {
        return id_segmento_edad;
    }

    public void setId_segmento_edad(int id_segmento_edad) {
        this.id_segmento_edad = id_segmento_edad;
    }

    public int getId_segmento_sexo() {
        return id_segmento_sexo;
    }

    public void setId_segmento_sexo(int id_segmento_sexo) {
        this.id_segmento_sexo = id_segmento_sexo;
    }
    
    
}
