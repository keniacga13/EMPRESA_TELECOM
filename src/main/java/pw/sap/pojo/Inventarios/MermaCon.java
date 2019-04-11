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
public class MermaCon {
    private String CoBa;
    private String IDMerma;
    private String FechaRe;
    private String tipo;
    private String cantidad;
    private String obs;

public MermaCon (String CoBa, String IDMerma,String FechaRe, String tipo, String cantidad, String obs){

    this.CoBa=CoBa;
    this.IDMerma=IDMerma;
    this.FechaRe=FechaRe;
    this.tipo=tipo;
}

    public String getCoBa() {
        return CoBa;
    }

    public void setCoBa(String CoBa) {
        this.CoBa = CoBa;
    }

    public String getIDMerma() {
        return IDMerma;
    }

    public void setIDMerma(String IDMerma) {
        this.IDMerma = IDMerma;
    }


}