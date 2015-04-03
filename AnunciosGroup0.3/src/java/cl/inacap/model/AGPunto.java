/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.model;

import java.util.Date;

/**
 *
 * @author zamorator
 */
public class AGPunto {

    private int id_punto;
    private Date fecha_incio;
    private Date fecha_termino;
    private int estado_punto;
    private String nombre_u_difusor;

    public int getId_punto() {
        return id_punto;
    }

    public void setId_punto(int id_punto) {
        this.id_punto = id_punto;
    }

    public Date getFecha_incio() {
        return fecha_incio;
    }

    public void setFecha_incio(Date fecha_incio) {
        this.fecha_incio = fecha_incio;
    }

    public Date getFecha_termino() {
        return fecha_termino;
    }

    public void setFecha_termino(Date fecha_termino) {
        this.fecha_termino = fecha_termino;
    }

    public int getEstado_punto() {
        return estado_punto;
    }

    public void setEstado_punto(int estado_punto) {
        this.estado_punto = estado_punto;
    }

    public String getNombre_u_difusor() {
        return nombre_u_difusor;
    }

    public void setNombre_u_difusor(String nombre_u_difusor) {
        this.nombre_u_difusor = nombre_u_difusor;
    }

}
