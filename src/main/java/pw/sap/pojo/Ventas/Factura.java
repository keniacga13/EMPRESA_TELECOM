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
public class Factura {
    
    private String rfc_receptor;
    private String rfc_emisor;
    private double subtotal;
    private double total_iva;
    private double total;
    private String lugar_exp;
    private String forma_pago;
    private String tipo_venta;

    public Factura(String rfc_receptor, String rfc_emisor, double subtotal, double total_iva, double total, String lugar_exp, String forma_pago, String tipo_venta) {
        this.rfc_receptor = rfc_receptor;
        this.rfc_emisor = rfc_emisor;
        this.subtotal = subtotal;
        this.total_iva = total_iva;
        this.total = total;
        this.lugar_exp = lugar_exp;
        this.forma_pago = forma_pago;
        this.tipo_venta = tipo_venta;
    }

    

    /**
     * @return the rfc_receptor
     */
    public String getRfc_receptor() {
        return rfc_receptor;
    }

    /**
     * @param rfc_receptor the rfc_receptor to set
     */
    public void setRfc_receptor(String rfc_receptor) {
        this.rfc_receptor = rfc_receptor;
    }

    /**
     * @return the rfc_emisor
     */
    public String getRfc_emisor() {
        return rfc_emisor;
    }

    /**
     * @param rfc_emisor the rfc_emisor to set
     */
    public void setRfc_emisor(String rfc_emisor) {
        this.rfc_emisor = rfc_emisor;
    }

    /**
     * @return the subtotal
     */
    public double getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal the subtotal to set
     */
    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
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
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     * @return the lugar_exp
     */
    public String getLugar_exp() {
        return lugar_exp;
    }

    /**
     * @param lugar_exp the lugar_exp to set
     */
    public void setLugar_exp(String lugar_exp) {
        this.lugar_exp = lugar_exp;
    }

    /**
     * @return the forma_pago
     */
    public String getForma_pago() {
        return forma_pago;
    }

    /**
     * @param forma_pago the forma_pago to set
     */
    public void setForma_pago(String forma_pago) {
        this.forma_pago = forma_pago;
    }

    /**
     * @return the tipo_venta
     */
    public String getTipo_venta() {
        return tipo_venta;
    }

    /**
     * @param tipo_venta the tipo_venta to set
     */
    public void setTipo_venta(String tipo_venta) {
        this.tipo_venta = tipo_venta;
    }
    
    
}
