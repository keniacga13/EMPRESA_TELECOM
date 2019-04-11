/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

import java.util.ArrayList;

/**
 *
 * @author ricardozaldivar
 */
public class ListaDeProductos {
    
    private ArrayList<VentaLista> listaProd = new ArrayList<VentaLista>();

    public ListaDeProductos() {
        
    }
    
    /**
     * @return the listaProd
     */
    public ArrayList<VentaLista> getListaProd() {
        return listaProd;
    }

    /**
     * @param listaProd the listaProd to set
     */
    public void setListaProd(ArrayList<VentaLista> listaProd) {
        this.listaProd = listaProd;
    }
    
    
    
}
