

package pw.sap.pojo.Inventarios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import pw.sap.db.Conexion;


/**
 *
 * @author migue_f4t6hjx
 */


public class registro {
   
    Connection conn;
    
    public registro() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    
    public void openDB() throws SQLException {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
    }
    
     public void closeDB() throws SQLException {
        conn.close();
    }
    
    
            public int agregarMerma(String codigo, String fecha, String tipo, String cantidad, String motivo) throws SQLException, ClassNotFoundException{
         
                 openDB();
                 int valor=1;
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO merma(id_producto,fecha_merma,tipo_merma,cantidad_merma,motivo) "
                                       + " VALUES ('"+codigo+"','now()','"+tipo+"',"+cantidad+",'"+motivo+"')");
                    valor = ps.executeUpdate();
          
                    System.out.println(ps);
                    
                    closeDB();
                    return valor;
                  
        }
            
            public int agregarLote(String codigo) throws SQLException, ClassNotFoundException{
         
                 openDB();
                 int valor=1;
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO entrada (id_compra,fecha_ingreso) "
                                       + " VALUES ('"+codigo+"','now()')");
                    valor = ps.executeUpdate();
          
                    System.out.println(ps);
                    
                    closeDB();
                    return valor;
                  
        }
    public int eliminarDevolucion(String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
            
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("delete from devolucion where id_devolucion="+codigo);
                    valor = ps.executeUpdate();
        
            closeDB();
            return valor;
        }
    
    
               
   
   
 public int agregarDevolucion(String id,String codigo, String fecha, String cantidad, String observaciones) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
                     PreparedStatement ps;
                    
                     ps = conn.prepareStatement("INSERT INTO devolucion(id_devolucion,id_compra,cantidad_devuelta,fecha_devolucion,motivo) "
                                       + " VALUES ("+id+","+codigo+","+cantidad+",'now()','"+observaciones+"')");
                    valor = ps.executeUpdate();
                    System.out.println(ps);
        
            closeDB();
            return valor;
        }
          
    public int eliminarMerma (String codigo) throws SQLException, ClassNotFoundException{
         
            openDB();
            int valor=1;
                     PreparedStatement ps;
                    
                    ps = conn.prepareStatement("delete from merma where id_merma="+codigo);
                    valor = ps.executeUpdate();
                    System.out.println(ps);
        
            closeDB();
            return valor;
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
     
      public ResultSet consultaGeneral() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select id_producto, prov_nom_emp, nombre,tipo_producto,cantidad,minimo,maximo,costo_unitario,costo_venta\n" +
                                                "from producto\n" +
                                                "inner join proveedor\n" +
                                                "on producto.proveedor=proveedor.prov_rfc;");
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
      
      public ArrayList cantidadProducto (String id_merma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT cantidad FROM producto WHERE id_producto=? ");
        ps.setString(1, id_merma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
         
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));                
            }
            
        closeDB();        
        return r;
    }
     
      public ArrayList cantidadMerma(String id_merma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT cantidad FROM merma WHERE id_merma=? ");
        ps.setString(1, id_merma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
         
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));                
            }
            
        closeDB();        
        return r;
    }
           public ArrayList cantidadComprada(String lote) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("select req_cantidad , id_producto\n" +
"from entrada\n" +
"inner join orden_compra on entrada.id_compra = orden_compra.ord_folio\n" +
"inner join requisicion on orden_compra.req_folio = requisicion.req_folio\n" +
"where lote=? ");
        ps.setString(1, lote);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
         
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));                
            }
            
        closeDB();        
        return r;
    }
        public ArrayList productoMerma(String id_merma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto FROM merma WHERE id_merma=? ");
        ps.setString(1, id_merma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
         
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));                
            }
            
        closeDB();        
        return r;
    }
         
}
