/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

import java.util.ArrayList;
import pw.sap.servlets.Ventas.ListaProductos;

/**
 *
 * @author ricar
 */
public class insertVentaPorProd {
    
    public ArrayList<VentaPorProducto> cargaVentas(){
        
        ArrayList<VentaLista> arrayTemp = ListaProductos.ventList;
        ArrayList<VentaPorProducto> ventas_ov = new ArrayList();
        
        for (int i = 0; i < arrayTemp.size(); i++) {
            
            ventas_ov.add( new VentaPorProducto(arrayTemp.get(i).getId_producto(),arrayTemp.get(i).getSubtotal(),arrayTemp.get(i).getCantidad(),arrayTemp.get(i).getIva()));
            
        }
        
        return ventas_ov;
    }
    
}
