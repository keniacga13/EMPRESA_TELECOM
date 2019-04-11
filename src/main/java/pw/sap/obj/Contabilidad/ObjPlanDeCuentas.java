/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.obj.Contabilidad;

/**
 *
 * @author maxim
 */
public class ObjPlanDeCuentas { 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getId_cuenta() {
        return id_cuenta;
    }

    public void setId_cuenta(Double id_cuenta) {
        this.id_cuenta = id_cuenta;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo_cuenta() {
        return tipo_cuenta;
    }

    public void setTipo_cuenta(String tipo_cuenta) {
        this.tipo_cuenta = tipo_cuenta;
    }

    public String getClase_cuenta() {
        return clase_cuenta;
    }

    public void setClase_cuenta(String clase_cuenta) {
        this.clase_cuenta = clase_cuenta;
    }

    public String getClase_sat() {
        return clase_sat;
    }

    public void setClase_sat(String clase_sat) {
        this.clase_sat = clase_sat;
    }

    public String getNaturaleza() {
        return naturaleza;
    }

    public void setNaturaleza(String naturaleza) {
        this.naturaleza = naturaleza;
    }
    int id;
    Double id_cuenta;
    String descripcion;
    String tipo_cuenta;
    String clase_cuenta;
    String clase_sat;
    String naturaleza;

    
}
