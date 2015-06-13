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
public class Giro {

    private int codigo_giro;
    private int id_giro_detalle;
    private String detalle;
    private String afecto_iva;
    private int categoria_tributaria;
    private String disponible_internet;

    public int getCodigo_giro() {
        return codigo_giro;
    }

    public void setCodigo_giro(int codigo_giro) {
        this.codigo_giro = codigo_giro;
    }

    public int getId_giro_detalle() {
        return id_giro_detalle;
    }

    public void setId_giro_detalle(int id_giro_detalle) {
        this.id_giro_detalle = id_giro_detalle;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getAfecto_iva() {
        return afecto_iva;
    }

    public void setAfecto_iva(String afecto_iva) {
        this.afecto_iva = afecto_iva;
    }

    public int getCategoria_tributaria() {
        return categoria_tributaria;
    }

    public void setCategoria_tributaria(int categoria_tributaria) {
        this.categoria_tributaria = categoria_tributaria;
    }

    public String getDisponible_internet() {
        return disponible_internet;
    }

    public void setDisponible_internet(String disponible_internet) {
        this.disponible_internet = disponible_internet;
    }

}
