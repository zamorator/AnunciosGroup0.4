/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.inacap.model;

/**
 *
 * @author zamorator <zamorator@gmail.com>
 */
public class GiroDetalle {
    private int id_giro_detalle;
    private String nombre_giro_detalle;
    private int id_giro_cabecera;

    public int getId_giro_detalle() {
        return id_giro_detalle;
    }

    public void setId_giro_detalle(int id_giro_detalle) {
        this.id_giro_detalle = id_giro_detalle;
    }

    public String getNombre_giro_detalle() {
        return nombre_giro_detalle;
    }

    public void setNombre_giro_detalle(String nombre_giro_detalle) {
        this.nombre_giro_detalle = nombre_giro_detalle;
    }

    public int getId_giro_cabecera() {
        return id_giro_cabecera;
    }

    public void setId_giro_cabecera(int id_giro_cabecera) {
        this.id_giro_cabecera = id_giro_cabecera;
    }
    
    
}
