/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

import pw.sap.servlets.Ventas.ListaProductos;

/**
 *
 * @author ricardozaldivar
 */
public class GeneraOrdenVenta {
    
    double subtotal = ListaProductos.subtotalTotal_ov;
    double totalIva = ListaProductos.totalIva_ov;
    double total_ov = ListaProductos.TOTAL_ov;
    
    public static OrdenVenta ov = new OrdenVenta();
    
    public void generaOrden(){
        
        ov.setSubtotal_pago(subtotal);
        ov.setTotal_iva(totalIva);
        ov.setTotal_pago(total_ov);
    }
    
}
