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


    private String descripcion_cupon;
    private Date fecha_creacion_cupon;
    private Date fecha_vencimiento_cupon;
    private String codigo_anuncio;
    private String descuento_obtenido;
    private String valor_final_producto;
    private String img_anuncio;
    private int ptos_utilizados;
    private String descripcion_cupon2;
    public String getDescripcion_cupon2() {
        return descripcion_cupon2;
    }

    public void setDescripcion_cupon2(String descripcion_cupon2) {
        this.descripcion_cupon2 = descripcion_cupon2;
    }
    
    
    public String getDescripcion_cupon() {
        return descripcion_cupon;
    }

    public void setDescripcion_cupon(String descripcion_cupon) {
        this.descripcion_cupon = descripcion_cupon;
    }
    public int getPtos_utilizados() {
        return ptos_utilizados;
    }

    public void setPtos_utilizados(int ptos_utilizados) {
        this.ptos_utilizados = ptos_utilizados;
    }
   
    public String getImg_anuncio() {
        return img_anuncio;
    }

    public void setImg_anuncio(String img_anuncio) {
        this.img_anuncio = img_anuncio;
    }
    

    public String getCodigo_anuncio() {
        return codigo_anuncio;
    }

    public void setCodigo_anuncio(String codigo_anuncio) {
        this.codigo_anuncio = codigo_anuncio;
    }

    public String getDescuento_obtenido() {
        return descuento_obtenido;
    }

    public void setDescuento_obtenido(String descuento_obtenido) {
        this.descuento_obtenido = descuento_obtenido;
    }

    public String getValor_final_producto() {
        return valor_final_producto;
    }

    public void setValor_final_producto(String valor_final_producto) {
        this.valor_final_producto = valor_final_producto;
    }

    
    


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
