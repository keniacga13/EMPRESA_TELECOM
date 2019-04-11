/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Contabilidad;

/**
 *
 * @author fgb
 */
public class AsientoGeneral {
    int id;
    String clave;
    String modulo;
    String tipo_comprobante;
    String fecha_cap;
    String concepto;
    String periodo_conta;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public String getTipo_comprobante() {
        return tipo_comprobante;
    }

    public void setTipo_comprobante(String tipo_comprobante) {
        this.tipo_comprobante = tipo_comprobante;
    }

    public String getFecha_cap() {
        return fecha_cap;
    }

    public void setFecha_cap(String fecha_cap) {
        this.fecha_cap = fecha_cap;
    }

    public String getConcepto() {
        return concepto;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public String getPeriodo_conta() {
        return periodo_conta;
    }

    public void setPeriodo_conta(String periodo_conta) {
        this.periodo_conta = periodo_conta;
    }

}
