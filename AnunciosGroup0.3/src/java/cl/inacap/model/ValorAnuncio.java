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
public class ValorAnuncio {

    private int id_valor_anuncio;
    private int valor_real;
    private int valor_descuento;
    private int valor_final;
    private int codigo_anuncio;

    public int getId_valor_anuncio() {
        return id_valor_anuncio;
    }

    public void setId_valor_anuncio(int id_valor_anuncio) {
        this.id_valor_anuncio = id_valor_anuncio;
    }

    public int getValor_real() {
        return valor_real;
    }

    public void setValor_real(int valor_real) {
        this.valor_real = valor_real;
    }

    public int getValor_descuento() {
        return valor_descuento;
    }

    public void setValor_descuento(int valor_descuento) {
        this.valor_descuento = valor_descuento;
    }

    public int getValor_final() {
        return valor_final;
    }

    public void setValor_final(int valor_final) {
        this.valor_final = valor_final;
    }

    public int getCodigo_anuncio() {
        return codigo_anuncio;
    }

    public void setCodigo_anuncio(int codigo_anuncio) {
        this.codigo_anuncio = codigo_anuncio;
    }

}
