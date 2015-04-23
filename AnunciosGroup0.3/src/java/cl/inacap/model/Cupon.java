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
public class Cupon {

    private int id_cupon;
    private String nombre_u_difusor;
    private int descripcion_cupon;
    private Date fecha_creacion_cupon;
    private Date fecha_vencimiento_cupon;

    public int getId_cupon() {
        return id_cupon;
    }

    public void setId_cupon(int id_cupon) {
        this.id_cupon = id_cupon;
    }

    public String getNombre_u_difusor() {
        return nombre_u_difusor;
    }

    public void setNombre_u_difusor(String nombre_u_difusor) {
        this.nombre_u_difusor = nombre_u_difusor;
    }

    public int getDescripcion_cupon() {
        return descripcion_cupon;
    }

    public void setDescripcion_cupon(int descripcion_cupon) {
        this.descripcion_cupon = descripcion_cupon;
    }

    public Date getFecha_creacion_cupon() {
        return fecha_creacion_cupon;
    }

    public void setFecha_creacion_cupon(Date fecha_creacion_cupon) {
        this.fecha_creacion_cupon = fecha_creacion_cupon;
    }

    public Date getFecha_vencimiento_cupon() {
        return fecha_vencimiento_cupon;
    }

    public void setFecha_vencimiento_cupon(Date fecha_vencimiento_cupon) {
        this.fecha_vencimiento_cupon = fecha_vencimiento_cupon;
    }

}
