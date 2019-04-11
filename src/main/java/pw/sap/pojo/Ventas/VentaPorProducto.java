/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

/**
 *
 * @author ricardozaldivar
 */
public class VentaPorProducto {
    
    private String id_producto;
    private String id_ordenventa;
    private double monto;
    private int cantidad;
    private double iva;

    public VentaPorProducto(String id_producto, String id_ordenventa, double monto, int cantidad, double iva) {
        this.id_producto = id_producto;
        this.id_ordenventa = id_ordenventa;
        this.monto = monto;
        this.cantidad = cantidad;
        this.iva = iva;
    }    

    public VentaPorProducto(String id_producto, double monto, int cantidad, double iva) {
        this.id_producto = id_producto;
        this.monto = monto;
        this.cantidad = cantidad;
        this.iva = iva;
    }
    
    
    
    /**
     * @return the id_producto
     */
    public String getId_producto() {
        return id_producto;
    }

    /**
     * @param id_producto the id_producto to set
     */
    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
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
     * @return the monto
     */
    public double getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(double monto) {
        this.monto = monto;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the iva
     */
    public double getIva() {
        return iva;
    }

    /**
     * @param iva the iva to set
     */
    public void setIva(double iva) {
        this.iva = iva;
    }
    
    
    
}
