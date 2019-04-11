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
public class InvenGe {
    private String CoBa;
    private String IDEnt;
    private String IDOrdenCom;
    private String TipoPro;
    private String CantidadRec;
    private String FechaReg;
    private String FechaCad;
    private String IDLote;
    


  public InvenGe(String CoBa, String IDEnt, String IDOrdenCom, String IDLote,String TipoPro, String CantidadRec, String FechaReg, String FechaCad) {
 
      this.CoBa=CoBa;
      this.IDEnt=IDEnt;
      this.IDOrdenCom=IDOrdenCom;
      this.TipoPro=TipoPro;
      this.CantidadRec=CantidadRec;
      this.FechaReg=FechaReg;
      this.FechaCad=FechaCad;
      this.IDLote=IDLote;
      
    }

    public String getIDLote() {
        return IDLote;
    }

    public void setIDLote(String IDLote) {
        this.IDLote = IDLote;
    }

    public String getCoBa() {
        return CoBa;
    }

    public void setCoBa(String CoBa) {
        this.CoBa = CoBa;
    }

    public String getIDEnt() {
        return IDEnt;
    }

    public void setIDEnt(String IDEnt) {
        this.IDEnt = IDEnt;
    }

    public String getIDOrdenCom() {
        return IDOrdenCom;
    }

    public void setIDOrdenCom(String IDOrdenCom) {
        this.IDOrdenCom = IDOrdenCom;
    }

    public String getTipoPro() {
        return TipoPro;
    }

    public void setTipoPro(String TipoPro) {
        this.TipoPro = TipoPro;
    }

    public String getCantidadRec() {
        return CantidadRec;
    }

    public void setCantidadRec(String CantidadRec) {
        this.CantidadRec = CantidadRec;
    }

    public String getFechaReg() {
        return FechaReg;
    }

    public void setFechaReg(String FechaReg) {
        this.FechaReg = FechaReg;
    }

    public String getFechaCad() {
        return FechaCad;
    }

    public void setFechaCad(String FechaCad) {
        this.FechaCad = FechaCad;
    }
  
}