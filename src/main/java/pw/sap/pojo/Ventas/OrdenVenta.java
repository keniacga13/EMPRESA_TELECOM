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
public class OrdenVenta {
    
    private String id_ordenventa;
    private String id_intermC;
    private String fecha_ordv;
    private String hora_ordv;
    private double total_iva;
    private double subtotal_pago;
    private double total_pago;
    private String fecha_entrega;
    private double promocion;
    private String moneda;
    private int id_emp;

    public OrdenVenta(String id_ordenventa, String id_intermC, String fecha_ordv, String hora_ordv, double total_iva, double subtotal_pago, double total_pago, String fecha_entrega, double promocion, String moneda, int id_emp) {
        this.id_ordenventa = id_ordenventa;
        this.id_intermC = id_intermC;
        this.fecha_ordv = fecha_ordv;
        this.hora_ordv = hora_ordv;
        this.total_iva = total_iva;
        this.subtotal_pago = subtotal_pago;
        this.total_pago = total_pago;
        this.fecha_entrega = fecha_entrega;
        this.promocion = promocion;
        this.moneda = moneda;
        this.id_emp = id_emp;
    }

    public OrdenVenta(String id_ordenventa, String id_intermC, String fecha_ordv, String hora_ordv, double total_iva, double subtotal_pago, double total_pago, String fecha_entrega, String moneda, int id_emp) {
        this.id_ordenventa = id_ordenventa;
        this.id_intermC = id_intermC;
        this.fecha_ordv = fecha_ordv;
        this.hora_ordv = hora_ordv;
        this.total_iva = total_iva;
        this.subtotal_pago = subtotal_pago;
        this.total_pago = total_pago;
        this.fecha_entrega = fecha_entrega;
        this.moneda = moneda;
        this.id_emp = id_emp;
    }

    public OrdenVenta(String id_intermC, String fecha_ordv, double total_iva, double subtotal_pago, double total_pago, String fecha_entrega, String moneda, int id_emp) {
        this.id_intermC = id_intermC;
        this.fecha_ordv = fecha_ordv;
        this.total_iva = total_iva;
        this.subtotal_pago = subtotal_pago;
        this.total_pago = total_pago;
        this.fecha_entrega = fecha_entrega;
        this.moneda = moneda;
        this.id_emp = id_emp;
    }
    
    

    public OrdenVenta() {
       
    }

    public OrdenVenta(double total_iva, double subtotal_pago, double total_pago) {
        this.total_iva = total_iva;
        this.subtotal_pago = subtotal_pago;
        this.total_pago = total_pago;
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
     * @return the id_intermC
     */
    public String getId_intermC() {
        return id_intermC;
    }

    /**
     * @param id_intermC the id_intermC to set
     */
    public void setId_intermC(String id_intermC) {
        this.id_intermC = id_intermC;
    }

    /**
     * @return the fecha_ordv
     */
    public String getFecha_ordv() {
        return fecha_ordv;
    }

    /**
     * @param fecha_ordv the fecha_ordv to set
     */
    public void setFecha_ordv(String fecha_ordv) {
        this.fecha_ordv = fecha_ordv;
    }

    /**
     * @return the hora_ordv
     */
    public String getHora_ordv() {
        return hora_ordv;
    }

    /**
     * @param hora_ordv the hora_ordv to set
     */
    public void setHora_ordv(String hora_ordv) {
        this.hora_ordv = hora_ordv;
    }

    /**
     * @return the total_iva
     */
    public double getTotal_iva() {
        return total_iva;
    }

    /**
     * @param total_iva the total_iva to set
     */
    public void setTotal_iva(double total_iva) {
        this.total_iva = total_iva;
    }

    /**
     * @return the subtotal_pago
     */
    public double getSubtotal_pago() {
        return subtotal_pago;
    }

    /**
     * @param subtotal_pago the subtotal_pago to set
     */
    public void setSubtotal_pago(double subtotal_pago) {
        this.subtotal_pago = subtotal_pago;
    }

    /**
     * @return the total_pago
     */
    public double getTotal_pago() {
        return total_pago;
    }

    /**
     * @param total_pago the total_pago to set
     */
    public void setTotal_pago(double total_pago) {
        this.total_pago = total_pago;
    }

    /**
     * @return the fecha_entrega
     */
    public String getFecha_entrega() {
        return fecha_entrega;
    }

    /**
     * @param fecha_entrega the fecha_entrega to set
     */
    public void setFecha_entrega(String fecha_entrega) {
        this.fecha_entrega = fecha_entrega;
    }

    /**
     * @return the promocion
     */
    public double getPromocion() {
        return promocion;
    }

    /**
     * @param promocion the promocion to set
     */
    public void setPromocion(double promocion) {
        this.promocion = promocion;
    }

    /**
     * @return the moneda
     */
    public String getMoneda() {
        return moneda;
    }

    /**
     * @param moneda the moneda to set
     */
    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    /**
     * @return the id_emp
     */
    public int getId_emp() {
        return id_emp;
    }

    /**
     * @param id_emp the id_emp to set
     */
    public void setId_emp(int id_emp) {
        this.id_emp = id_emp;
    }

    
}
