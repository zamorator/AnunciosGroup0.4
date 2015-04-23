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
public class ShareCoin {

    private int id_share_coin;
    private int codigo_anuncio;
    private int cantidad_compartir;
    private int cantidad_extra_compartir;
    private int id_valor_coin;

    public int getId_share_coin() {
        return id_share_coin;
    }

    public void setId_share_coin(int id_share_coin) {
        this.id_share_coin = id_share_coin;
    }

    public int getCodigo_anuncio() {
        return codigo_anuncio;
    }

    public void setCodigo_anuncio(int codigo_anuncio) {
        this.codigo_anuncio = codigo_anuncio;
    }

    public int getCantidad_compartir() {
        return cantidad_compartir;
    }

    public void setCantidad_compartir(int cantidad_compartir) {
        this.cantidad_compartir = cantidad_compartir;
    }

    public int getCantidad_extra_compartir() {
        return cantidad_extra_compartir;
    }

    public void setCantidad_extra_compartir(int cantidad_extra_compartir) {
        this.cantidad_extra_compartir = cantidad_extra_compartir;
    }

    public int getId_valor_coin() {
        return id_valor_coin;
    }

    public void setId_valor_coin(int id_valor_coin) {
        this.id_valor_coin = id_valor_coin;
    }

}
