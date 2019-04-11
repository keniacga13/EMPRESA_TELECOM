/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Inventarios;

/**
 *
 * @author montse
 */
public class Merma {
    private String id_producto;
    private int IDMerma;
    private String FechaRe;
    private String tipo;
    private int cantidad;
    private String obs;

public Merma (String id_producto, int IDMerma,String FechaRe, String tipo, int cantidad, String obs){

    this.id_producto=id_producto;
    this.IDMerma=IDMerma;
    this.FechaRe=FechaRe;
    this.tipo=tipo;
    this.cantidad=cantidad;
    this.obs=obs;
}

    public Merma() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getFechaRe() {
        return FechaRe;
    }

    public void setFechaRe(String FechaRe) {
        this.FechaRe = FechaRe;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }


    public int getIDMerma() {
        return IDMerma;
    }

    public void setIDMerma(int IDMerma) {
        this.IDMerma = IDMerma;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }


}