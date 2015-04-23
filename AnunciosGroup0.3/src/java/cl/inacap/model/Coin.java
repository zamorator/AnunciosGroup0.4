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
public class Coin {

    private int id_coin;
    private Date fecha_incio;
    private Date fecha_termino;
    private int estado_coin;
    private String nombre_u_difusor;
    private int id_valor_coin;

    public int getId_coin() {
        return id_coin;
    }

    public void setId_coin(int id_coin) {
        this.id_coin = id_coin;
    }

    public int getEstado_coin() {
        return estado_coin;
    }

    public void setEstado_coin(int estado_coin) {
        this.estado_coin = estado_coin;
    }

    public int getId_valor_coin() {
        return id_valor_coin;
    }

    public void setId_valor_coin(int id_valor_coin) {
        this.id_valor_coin = id_valor_coin;
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

    public String getNombre_u_difusor() {
        return nombre_u_difusor;
    }

    public void setNombre_u_difusor(String nombre_u_difusor) {
        this.nombre_u_difusor = nombre_u_difusor;
    }

}
