/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Inventarios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import pw.sap.db.Conexion;
import pw.sap.pojo.Inventarios.InvenGe;

/**
 *
 * @author montse
 */
public class QuerysInventarios {
    Connection conn;
    
    public QuerysInventarios() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
     * @throws SQLException
     */
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
    }

    /**
    * Cierra la conexión con la base de datos
    * @throws SQLException
    */    
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    
    public boolean consultaEspInvenG(InvenGe inv) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            openDB();
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("SELECT '"+inv.getIDEnt()+"','"+inv.getIDOrdenCom()+"','"+ inv.getCoBa()+"','"+inv.getIDLote()+"','"+inv.getTipoPro()+"',"+inv.getCantidadRec()+",'"+inv.getFechaReg()+"','"+inv.getFechaCad()+"'FROM entrada WHERE id_producto="+"'"+inv.getCoBa()+"' or id_entrada='"+inv.getIDEnt()+"' or id_ordencompra='"+ inv.getIDOrdenCom()+"or tipo_producto='"+inv.getTipoPro()+"'");
                        agregado=true;
                        st.close();
                    }
                closeDB();
                    } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    }
            return agregado;
        }
    
     public ResultSet consultaGeneral(String producto, String prov, String tipo, String nombre) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    if (producto != null) {
                                                    ps = conn.prepareStatement("select id_producto,nombre,tipo_producto,prov_nom_emp,cantidad,minimo,costo_unitario, costo_venta  \n" +
                                                    "from producto\n" +
                                                    "inner join proveedor\n" +
                                                    "on producto.proveedor=proveedor.prov_rfc "
                                                    + "where id_producto='"+producto+"' ;");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         }else {
                     ps = conn.prepareStatement("select id_producto,nombre,tipo_producto,prov_nom_emp,cantidad,minimo,costo_unitario, costo_venta  \n" +
                                                    "from producto\n" +
                                                    "inner join proveedor\n" +
                                                    "on producto.proveedor=proveedor.prov_rfc "
                                                    + "where nombre='"+nombre+"'  or  prov_nom_emp='"+prov+"' or tipo_producto='"+tipo+"'"
                                                   );
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                                                       closeDB();
                  return rs;
                    
                    }
                    
                    
          
                  
        }
      public ResultSet consultaSalidas(String producto, String venta) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    if (producto != null) {
                                                    ps = conn.prepareStatement("select id_producto,venta_por_prod.id_ordenventa,cantidad,monto,fecha_ordv  \n" +
                                                    "from venta_por_prod\n" +
                                                    "inner join ordenventa\n" +
                                                    "on venta_por_prod.id_ordenventa=ordenventa.id_ordenventa\n"
                                                    +"where id_producto='"+producto+"' ;");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         }else  if(venta !=null){
                     ps = conn.prepareStatement("select id_producto,venta_por_prod.id_ordenventa,cantidad,monto,fecha_ordv \n" +
                                                    "from venta_por_prod\n" +
                                                    "inner join ordenventa\n" +
                                                    "on venta_por_prod.id_ordenventa=ordenventa.id_ordenventa\n"
                                                    + "where venta_por_prod.id_ordenventa='"+venta+"'"
                                                   );
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                                                       closeDB();
                  return rs;
                    
                    }else {
                     ps = conn.prepareStatement("select id_producto,venta_por_prod.id_ordenventa,cantidad,monto,fecha_ordv  \n" +
                                                    "from venta_por_prod\n" +
                                                    "inner join ordenventa\n" +
                                                    "on venta_por_prod.id_ordenventa=ordenventa.id_ordenventa");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                                                       closeDB();
                  return rs;
                    
                    
                    }
                  
        }
     public ResultSet Consultasalidas() throws SQLException, ClassNotFoundException{
                          openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto,venta_por_prod.id_ordenventa,cantidad,monto,fecha_ordv  \n" +
                                                    "from venta_por_prod\n" +
                                                    "inner join ordenventa\n" +
                                                    "on venta_por_prod.id_ordenventa=ordenventa.id_ordenventa");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }    
     public ResultSet ConsultaG() throws SQLException, ClassNotFoundException{
                          openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto,nombre,tipo_producto,prov_nom_emp,cantidad,minimo,costo_unitario, costo_venta\n" +
"                                                    from producto\n" +
"                                                    inner join proveedor\n" +
"                                                    on producto.proveedor=proveedor.prov_rfc ");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }    
    
  public ResultSet consultaGeneralMC(String id_merma, String producto, String fecha) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
//                    if (producto != null) {
                                                    ps = conn.prepareStatement("select id_producto,id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo  \n" +
                                                    "from merma "
                                                    + "where id_merma="+id_merma+" and tipo_merma='MermaConocida';");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
//         }else {
//                     ps = conn.prepareStatement("select id_producto,id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo \n" +
//                                                    "from merma "
//                                                    + "where id_producto='"+producto+"' or fecha_merma='"+fecha+"' and tipo_merma='MermaConocida'"
//                                                   );
//                                                    ResultSet rs= ps.executeQuery();
//                                                      System.out.println(ps);
//                    
//                                                       closeDB();
//                  return rs;
//                    
                    }
  public ResultSet consultaEntrada() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
//                    if (producto != null) {
                                                    ps = conn.prepareStatement("select ord_folio,  prov_nom_emp, ord_codpro, ord_cantida, ord_fecha \n" +
"from orden_compra \n" +
"inner join proveedor on orden_compra.prov_rfc = proveedor.prov_rfc where estatus=0" );
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
//           
//                    
                    }  
  
  
    public ResultSet consultaLote() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
//                    if (producto != null) {
                                                    ps = conn.prepareStatement("select * from entrada;");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
//           
//                    
                    }                    
  
  
  
         public ResultSet ConsultaGM() throws SQLException, ClassNotFoundException{
                          openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto,id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo  \n" +
                                                    "from merma where tipo_merma='MermaConocida'");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        } 
      public ResultSet consultaGeneralMD(String id_merma, String producto, String fecha) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
//                    if (producto != null) {
                                                    ps = conn.prepareStatement("select id_producto,id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo  \n" +
                                                    "from merma "
                                                    + "where id_merma="+id_merma+" and tipo_merma='MermaDesconocida';");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
//         }else {
//                     ps = conn.prepareStatement("select id_producto,id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo \n" +
//                                                    "from merma "
//                                                    + "where id_producto='"+producto+"' or fecha_merma='"+fecha+"' and tipo_merma='MermaConocida'"
//                                                   );
//                                                    ResultSet rs= ps.executeQuery();
//                                                      System.out.println(ps);
//                    
//                                                       closeDB();
//                  return rs;
//                    
                    }
                    
  
         public ResultSet ConsultaGD() throws SQLException, ClassNotFoundException{
                          openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto,id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo  \n" +
                                                    "from merma where tipo_merma='MermaDesconocida'");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        } 
    
    
         public int insercionRegistro(int id_emp, String area, String des) throws SQLException{
        openDB();
        int valor=1;
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO log(id_emp,area,des) VALUES ("+id_emp+",'"+area+"','"+des+"');");
        valor= ps.executeUpdate();
        closeDB();        
        return valor;
    }
    
    public ResultSet consultaEDev(String id_devolucion, String producto, String compra) throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    if (producto != null) {
                                                    ps = conn.prepareStatement("select id_devolucion,id_compra,cantidad_devuelta,fecha_devolucion,motivo,ord_codpro \n" +
                                                    "from devolucion "+
                                                    "inner join orden_compra\n" +
                                                    "on devolucion.id_compra=orden_compra.ord_folio\n"
                                                    + "where id_devolucion="+id_devolucion+";");
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                    closeDB();
                  return rs;
         }else {
                     ps = conn.prepareStatement("select id_devolucion,id_compra,cantidad_devuelta,fecha_devolucion,motivo,ord_codpro \n" +
                                                    "from devolucion "+
                                                    "inner join orden_compra\n" +
                                                    "on devolucion.id_compra=orden_compra.ord_folio\n"
                                                  
                                                    + "where ord_codpro='"+producto+"' or id_compra="+compra);
                                                    ResultSet rs= ps.executeQuery();
                                                      System.out.println(ps);
                    
                                                       closeDB();
                  return rs;
                    }                  
                    }
    
    public ResultSet ConsultaDev() throws SQLException, ClassNotFoundException{
                          openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_devolucion,id_compra,cantidad_devuelta,fecha_devolucion,motivo,ord_codpro\n" +
"from devolucion \n" +
"inner join orden_compra \n" +
"on devolucion.id_compra=orden_compra.ord_folio;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
    
    
}     

    

