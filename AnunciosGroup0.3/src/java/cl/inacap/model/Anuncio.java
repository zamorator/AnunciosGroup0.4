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
public class Anuncio {

    private int codigo_anuncio;
    private String nombre_u_anunciante;
    private String nombre_anuncio;
    private String imagen_anuncio;
    private String descripcion_anuncio;
    private Date fecha_creacion_anuncio;
    private Date fecha_modificacion_anuncio;
    private String estado_anuncio;
    private int id_categiria;
    private int id_segmento_sexo;
    private int id_segmento_edad;

    public int getCodigo_anuncio() {
        return codigo_anuncio;
    }

    public void setCodigo_anuncio(int codigo_anuncio) {
        this.codigo_anuncio = codigo_anuncio;
    }

    public String getNombre_u_anunciante() {
        return nombre_u_anunciante;
    }

    public void setNombre_u_anunciante(String nombre_u_anunciante) {
        this.nombre_u_anunciante = nombre_u_anunciante;
    }

    public String getNombre_anuncio() {
        return nombre_anuncio;
    }

    public void setNombre_anuncio(String nombre_anuncio) {
        this.nombre_anuncio = nombre_anuncio;
    }

    public String getImagen_anuncio() {
        return imagen_anuncio;
    }

    public void setImagen_anuncio(String imagen_anuncio) {
        this.imagen_anuncio = imagen_anuncio;
    }

    public String getDescripcion_anuncio() {
        return descripcion_anuncio;
    }

    public void setDescripcion_anuncio(String descripcion_anuncio) {
        this.descripcion_anuncio = descripcion_anuncio;
    }

    public Date getFecha_creacion_anuncio() {
        return fecha_creacion_anuncio;
    }

    public void setFecha_creacion_anuncio(Date fecha_creacion_anuncio) {
        this.fecha_creacion_anuncio = fecha_creacion_anuncio;
    }

    public Date getFecha_modificacion_anuncio() {
        return fecha_modificacion_anuncio;
    }

    public void setFecha_modificacion_anuncio(Date fecha_modificacion_anuncio) {
        this.fecha_modificacion_anuncio = fecha_modificacion_anuncio;
    }

    public String getEstado_anuncio() {
        return estado_anuncio;
    }

    public void setEstado_anuncio(String estado_anuncio) {
        this.estado_anuncio = estado_anuncio;
    }

    public int getId_categiria() {
        return id_categiria;
    }

    public void setId_categiria(int id_categiria) {
        this.id_categiria = id_categiria;
    }

    public int getId_segmento_sexo() {
        return id_segmento_sexo;
    }

    public void setId_segmento_sexo(int id_segmento_sexo) {
        this.id_segmento_sexo = id_segmento_sexo;
    }

    public int getId_segmento_edad() {
        return id_segmento_edad;
    }

    public void setId_segmento_edad(int id_segmento_edad) {
        this.id_segmento_edad = id_segmento_edad;
    }

}
