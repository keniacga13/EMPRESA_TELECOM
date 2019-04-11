
package pw.sap.pojo.Compras;

/**
 *
 * @author Mauricio
 */
public class Productos
{
    private String id_producto;
    private String nombre_producto;
    private String tipo_producto;
    private String catidad_por_lote;
    private String cantidad_en_existencia;
    private String minimo;
    private String maximo;
    private String costo_unitario;
    private String costo_venta;
    private String unidad;

    public Productos() {
    }

    public Productos(String id_producto, String nombre_producto, String tipo_producto, String catidad_por_lote, String cantidad_en_existencia, String minimo, String maximo, String costo_unitario, String costo_venta, String unidad) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.tipo_producto = tipo_producto;
        this.catidad_por_lote = catidad_por_lote;
        this.cantidad_en_existencia = cantidad_en_existencia;
        this.minimo = minimo;
        this.maximo = maximo;
        this.costo_unitario = costo_unitario;
        this.costo_venta = costo_venta;
        this.unidad = unidad;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getTipo_producto() {
        return tipo_producto;
    }

    public void setTipo_producto(String tipo_producto) {
        this.tipo_producto = tipo_producto;
    }

    public String getCatidad_por_lote() {
        return catidad_por_lote;
    }

    public void setCatidad_por_lote(String catidad_por_lote) {
        this.catidad_por_lote = catidad_por_lote;
    }

    public String getCantidad_en_existencia() {
        return cantidad_en_existencia;
    }

    public void setCantidad_en_existencia(String cantidad_en_existencia) {
        this.cantidad_en_existencia = cantidad_en_existencia;
    }

    public String getMinimo() {
        return minimo;
    }

    public void setMinimo(String minimo) {
        this.minimo = minimo;
    }

    public String getMaximo() {
        return maximo;
    }

    public void setMaximo(String maximo) {
        this.maximo = maximo;
    }

    public String getCosto_unitario() {
        return costo_unitario;
    }

    public void setCosto_unitario(String costo_unitario) {
        this.costo_unitario = costo_unitario;
    }

    public String getCosto_venta() {
        return costo_venta;
    }

    public void setCosto_venta(String costo_venta) {
        this.costo_venta = costo_venta;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    @Override
    public String toString() {
        return id_producto; //To change body of generated methods, choose Tools | Templates.
    }

    
}
