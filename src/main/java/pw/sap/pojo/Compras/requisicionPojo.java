/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;
/**
 *
 * @author Nesto
 */
public class requisicionPojo {
    
    private String req_folio;
    private String id_producto;
    private Productos productos;
    private String req_cantidad;
    private String req_fecha;

    public requisicionPojo() {
    }
    
    

    public requisicionPojo(String req_folio, String id_producto, String req_cantidad, String req_fecha) {
        this.req_folio = req_folio;
        this.id_producto = id_producto;
        this.req_cantidad = req_cantidad;
        this.req_fecha = req_fecha;
    }
    
    public requisicionPojo(String req_folio) {
        this.req_folio = req_folio;
    }
    

    public requisicionPojo(String req_folio, Productos productos, String req_cantidad, String req_fecha) {
        this.req_folio = req_folio;
        this.productos = productos;
        this.req_cantidad = req_cantidad;
        this.req_fecha = req_fecha;
    }

    public String getReq_folio() {
        return req_folio;
    }

    public void setReq_folio(String req_folio) {
        this.req_folio = req_folio;
    }

    public Productos getProductos() {
        return productos;
    }

    public void setProductos(Productos productos) {
        this.productos = productos;
    }

    public String getReq_cantidad() {
        return req_cantidad;
    }

    public void setReq_cantidad(String req_cantidad) {
        this.req_cantidad = req_cantidad;
    }

    public String getReq_fecha() {
        return req_fecha;
    }

    public void setReq_fecha(String req_fecha) {
        this.req_fecha = req_fecha;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }
    

    @Override
    public String toString() {
        return req_folio; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
