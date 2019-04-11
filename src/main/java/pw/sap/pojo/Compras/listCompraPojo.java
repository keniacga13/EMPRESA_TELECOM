package pw.sap.pojo.Compras;

/**
 *
 * @author Marii
 */
public class listCompraPojo  {
    private String list_folio;
    private String ord_folio;
    private String list_pago;
    private String list_fecha;
    private String list_uuid;
    private String id_producto;
    private String prov_rfc;
    private String where_fecha;
    
    
    

    public listCompraPojo() {
    }

    public listCompraPojo(String list_fecha) {
        this.list_fecha = list_fecha;
    }
    
    

    public listCompraPojo(String list_folio, String id_producto, String prov_rfc, String list_fecha) {
        this.list_folio = list_folio;
        this.list_fecha = list_fecha;
        this.id_producto = id_producto;
        this.prov_rfc = prov_rfc;
    }

    public listCompraPojo(String list_folio, String list_pago, String id_producto, String prov_rfc, String list_fecha) {
        this.list_folio = list_folio;
        this.list_pago = list_pago;
        this.list_fecha = list_fecha;
        this.id_producto = id_producto;
        this.prov_rfc = prov_rfc;
    }
    
    
    
    

    public listCompraPojo(String list_folio, String ord_folio, String list_pago, String list_fecha, String list_uuid, String id_producto, String prov_rfc) {
        this.list_folio = list_folio;
        this.ord_folio = ord_folio;
        this.list_pago = list_pago;
        this.list_fecha = list_fecha;
        this.list_uuid = list_uuid;
        this.id_producto = id_producto;
        this.prov_rfc = prov_rfc;
    }

    public listCompraPojo(String ord_folio, String list_pago, String list_fecha, String list_uuid, String id_producto, String prov_rfc) {
        this.ord_folio = ord_folio;
        this.list_pago = list_pago;
        this.list_fecha = list_fecha;
        this.list_uuid = list_uuid;
        this.id_producto = id_producto;
        this.prov_rfc = prov_rfc;
    }

    
    
    
    public String getList_folio() {
        return list_folio;
    }

    public void setList_folio(String list_folio) {
        this.list_folio = list_folio;
    }

    public String getOrd_folio() {
        return ord_folio;
    }

    public void setOrd_folio(String ord_folio) {
        this.ord_folio = ord_folio;
    }

    public String getList_pago() {
        return list_pago;
    }

    public void setList_pago(String list_pago) {
        this.list_pago = list_pago;
    }

    public String getList_fecha() {
        return list_fecha;
    }

    public void setList_fecha(String list_fecha) {
        this.list_fecha = list_fecha;
    }

    public String getList_uuid() {
        return list_uuid;
    }

    public void setList_uuid(String list_uuid) {
        this.list_uuid = list_uuid;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getProv_rfc() {
        return prov_rfc;
    }

    public void setProv_rfc(String prov_rfc) {
        this.prov_rfc = prov_rfc;
    }

    @Override
    public String toString() {
        return list_folio;
    }

    public String getWhere_fecha() {
        return where_fecha;
    }

    public void setWhere_fecha(String where_fecha) {
        this.where_fecha = where_fecha;
    }
    
 
    
}
