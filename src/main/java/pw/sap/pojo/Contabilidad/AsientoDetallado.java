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
public class AsientoDetallado {
String clave;     
String foliofac;     
String descripcion;     
String folio_fiscal;     
String fecha_fac;     
String cuenta;    
double monto;

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getFoliofac() {
        return foliofac;
    }

    public void setFoliofac(String foliofac) {
        this.foliofac = foliofac;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFolio_fiscal() {
        return folio_fiscal;
    }

    public void setFolio_fiscal(String folio_fiscal) {
        this.folio_fiscal = folio_fiscal;
    }

    public String getFecha_fac() {
        return fecha_fac;
    }

    public void setFecha_fac(String fecha_fac) {
        this.fecha_fac = fecha_fac;
    }

    public String getCuenta() {
        return cuenta;
    }

    public void setCuenta(String cuenta) {
        this.cuenta = cuenta;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

}
