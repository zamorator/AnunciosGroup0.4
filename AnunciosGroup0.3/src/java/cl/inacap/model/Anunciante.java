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
public class Anunciante {

    private String nombre_u_anunciante;
    private int id_comuna;
    private String nombre_anunciante;
    private String direccion_anunciante;
    private String password_anunciante;

    public String getNombre_u_anunciante() {
        return nombre_u_anunciante;
    }

    public void setNombre_u_anunciante(String nombre_u_anunciante) {
        this.nombre_u_anunciante = nombre_u_anunciante;
    }

    public int getId_comuna() {
        return id_comuna;
    }

    public void setId_comuna(int id_comuna) {
        this.id_comuna = id_comuna;
    }

    public String getNombre_anunciante() {
        return nombre_anunciante;
    }

    public void setNombre_anunciante(String nombre_anunciante) {
        this.nombre_anunciante = nombre_anunciante;
    }

    public String getDireccion_anunciante() {
        return direccion_anunciante;
    }

    public void setDireccion_anunciante(String direccion_anunciante) {
        this.direccion_anunciante = direccion_anunciante;
    }

    public String getPassword_anunciante() {
        return password_anunciante;
    }

    public void setPassword_anunciante(String password_anunciante) {
        this.password_anunciante = password_anunciante;
    }

}
