/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

/**
 *
 * @author ricar
 */
public class ApartaProducto {
    
    private String id_aparta;
    private String id_ordenventa;
    private String status_apart;
    private double abono_apart;
    private double cargo_apart;

    public ApartaProducto(String id_aparta, String id_ordenventa, String status_apart, double abono_apart, double cargo_apart) {
        this.id_aparta = id_aparta;
        this.id_ordenventa = id_ordenventa;
        this.status_apart = status_apart;
        this.abono_apart = abono_apart;
        this.cargo_apart = cargo_apart;
    }

    public ApartaProducto(double abono_apart, double cargo_apart) {
        this.abono_apart = abono_apart;
        this.cargo_apart = cargo_apart;
    }

    
    
    /**
     * @return the id_aparta
     */
    public String getId_aparta() {
        return id_aparta;
    }

    /**
     * @param id_aparta the id_aparta to set
     */
    public void setId_aparta(String id_aparta) {
        this.id_aparta = id_aparta;
    }

    /**
     * @return the id_ordenventa
     */
    public String getId_ordenventa() {
        return id_ordenventa;
    }

    /**
     * @param id_ordenventa the id_ordenventa to set
     */
    public void setId_ordenventa(String id_ordenventa) {
        this.id_ordenventa = id_ordenventa;
    }

    /**
     * @return the status_apart
     */
    public String getStatus_apart() {
        return status_apart;
    }

    /**
     * @param status_apart the status_apart to set
     */
    public void setStatus_apart(String status_apart) {
        this.status_apart = status_apart;
    }

    /**
     * @return the abono_apart
     */
    public double getAbono_apart() {
        return abono_apart;
    }

    /**
     * @param abono_apart the abono_apart to set
     */
    public void setAbono_apart(double abono_apart) {
        this.abono_apart = abono_apart;
    }

    /**
     * @return the cargo_apart
     */
    public double getCargo_apart() {
        return cargo_apart;
    }

    /**
     * @param cargo_apart the cargo_apart to set
     */
    public void setCargo_apart(double cargo_apart) {
        this.cargo_apart = cargo_apart;
    }
    
    
    
}
