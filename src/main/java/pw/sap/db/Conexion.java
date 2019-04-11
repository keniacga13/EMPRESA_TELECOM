package pw.sap.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

 
public class Conexion {

    Connection conn;
    
    public Conexion() throws ClassNotFoundException, SQLException {
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
    
    
    
    public ArrayList consultaAsientos(String clave) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT a.clave,a.modulo,a.tipo,a.fechaalta,a.concepto,c.clave FROM asientogral as a,calen_contable as c where a.id_periodo=c.id and a.clave=?");
        ps.setString(1, clave);
        System.out.println("cadena"+ps.toString());
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
            }
            
        closeDB();        
        return r;
    }
    
    public ArrayList calenContable(String clave) throws SQLException{
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT clave,periodo,fechaini,fechafin,status FROM calen_contable WHERE clave=?");
        ps.setString(1, clave);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getInt(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));                
            }
            
        closeDB();        
        return r;
    }
    //eliminacion de periodos en calendario contable
     public int eliminaCalen(String clave) throws SQLException{        
        openDB();       
        PreparedStatement ps= conn.prepareStatement("DELETE FROM calen_contable where clave=?;");
        ps.setString(1, clave);
        int r=ps.executeUpdate();
        closeDB();
        return r;        
    }
    
    //Inicio Inventario
     public ArrayList consultaEntradas(int IDEntrada) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_entrada,id_ordencompra,id_producto, id_lote,tipo_producto,catidad_recibida,fecha_registro,fecha_caducidad FROM entrada WHERE id_entrada=?");
        ps.setInt(1, IDEntrada);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                r.add(rs.getString(7));
                r.add(rs.getString(8));
            }
            
        closeDB();        
        return r;
    }
     
     
     public ArrayList consultaG(int IDEntrada) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_entrada,id_ordencompra,id_producto, id_lote,tipo_producto,catidad_recibida,fecha_registro,fecha_caducidad FROM entrada WHERE id_entrada=?");
        ps.setInt(1, IDEntrada);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                r.add(rs.getString(7));
                r.add(rs.getString(8));
            }
            
        closeDB();        
        return r;
    }
     
     
     public ArrayList consultaMermad(int id_merma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto, id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo FROM merma WHERE id_merma=? and tipo_merma='MermaDesconocida'");
        ps.setInt(1, id_merma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                
            }
            
        closeDB();        
        return r;
    }
       
    public ArrayList consultaSalidasId(String id_producto) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto,id_ordenventa,monto,cantidad FROM venta_por_prod WHERE id_producto=?");
        ps.setString(1, id_producto);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
            }
            
        closeDB();        
        return r;
    }
    
    public ArrayList consultaSalidasOrden(int id_ordenventa) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto,id_ordenventa,monto,cantidad FROM venta_por_prod WHERE id_ordenventa=?");
        ps.setInt(2, id_ordenventa);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getInt(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
            }
            
        closeDB();        
        return r;
    }
     
     public ArrayList consultaDevolucion(int id_devolucion) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_devolucion,id_compra,canitidad_devuelta,fecha_devolucion,motivo FROM devolucion where id_devolucion=?");
        ps.setInt(1, id_devolucion);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                
            }
            
        closeDB();        
        return r;
    }
     
     public ArrayList consultaMermac(int id_merma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto, id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo FROM merma WHERE id_merma=? and tipo_merma='MermaConocida'");
        ps.setInt(1, id_merma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
         
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getInt(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                
            }
            
        closeDB();        
        return r;
    }
     
     public ArrayList consultaGDevolucion(int CoBa, int IDDevolucion, int IDOrdenCom) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_ordencompra,id_producto, id_devolucion,canitidad_devuelta,fecha_devolucion,motivo FROM devolucion where id_producto=? or id_devolucion=? or id_ordencompra=?");
        ps.setInt(1, CoBa);
        ps.setInt(2, IDDevolucion);
        ps.setInt(3, IDOrdenCom);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                
            }
            
        closeDB();        
        return r;
    }
     
     public ArrayList consultaGEntrada(int CoBa, int IDEntrada, int IDOrdenCom, String TipoPro) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_ordencompra,id_producto, id_devolucion,canitidad_devuelta,fecha_devolucion,motivo FROM devolucion where id_producto=? or id_entrada=? or id_ordencompra=? or tipo_producto='?'");
        ps.setInt(1, CoBa);
        ps.setInt(2, IDEntrada);
        ps.setInt(3, IDOrdenCom);
        ps.setString(4, TipoPro);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                
            }
            
        closeDB();        
        return r;
    }
      public ArrayList consultaEG(int CoBa, int IDEntrada, int IDOrdenCom, String TipoPro) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_entrada,id_ordencompra,id_producto, id_lote,tipo_producto,catidad_recibida,fecha_registro,fecha_caducidad FROM entrada WHERE id_entrada=? or id_entrada=? or id_ordencompra=? or tipo_producto='?'");
        ps.setInt(1, CoBa);
        ps.setInt(1, IDEntrada);
        ps.setInt(3, IDOrdenCom);
        ps.setString(4, TipoPro);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                r.add(rs.getString(7));
                r.add(rs.getString(8));
            }
            
        closeDB();        
        return r;
    }
      public ArrayList consultaEMermac(int CoBa, int IDMerma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto, id_merma,fecha_merma,tipo_merma,cantidad_merma,observaciones FROM merma WHERE tipo_merma='Merma Conocida' and id_producto=? or id_merma=?");
        ps.setInt(1, CoBa);
        ps.setInt(2, IDMerma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                
            }
            
        closeDB();        
        return r;
    }
     
      public ArrayList consultaEMermad(int id_merma) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto, id_merma,fecha_merma,tipo_merma,cantidad_merma,motivo FROM merma WHERE tipo_merma='MermaDesconocida' and id_merma=?");
        ps.setInt(2, id_merma);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                r.add(rs.getString(6));
                
            }
            
        closeDB();        
        return r;
    }
      public ArrayList consultaESalidas(int CoBa,int IDSalida, int IDOrdenCom) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_producto, id_salida,id_ordenventa,fecha_salida,cantidad_vendida FROM salida WHERE id_producto=? or id_salida=? or id_ordencompra=?");
        ps.setInt(1, CoBa);
        ps.setInt(1, IDSalida);
        ps.setInt(1, IDOrdenCom);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getInt(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));
                r.add(rs.getString(4));
                r.add(rs.getString(5));
                
            }
            
        closeDB();        
        return r;
    }
     
     //Fin inventarios
     
    
    //Metodos de consulta de datos
    /**
     * consultaEspecifica de campos y posibilidad de where
     * @param numcampos
     * @param campo
     * @param tabla
     * @throws SQLException 
     */
    public int consultaEspecifica(int numcampos,String campo,String tabla) throws SQLException {
        openDB();        
        int existendatos=0;
        Statement stmt;
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT "+campo+" FROM "+tabla);
            
            while (rs.next()) {                
                for (int i = 1; i <= numcampos; i++) {
                    existendatos=1;
                    System.out.print(rs.getString(i));             
                }                                
            }
        
        closeDB();
        return existendatos;
    }
    
    /**
    * Actualización de los datos de una tabla siempre y cuando el campo a modificar sea numérico 
    * @param tabla
    * @param campoMod
    * @param valor1
    * @param campocriterio
    * @param valor2
    * @return
    * @throws SQLException
    */
    public int actualizarCampoNumerico(String tabla, String campoMod, int valor1, String campocriterio, int valor2) throws SQLException {
        openDB();
        System.out.println("V2 Conexión: " + conn);
        PreparedStatement ps = conn.prepareStatement("UPDATE "+tabla+" SET "+campoMod+"=? WHERE "+campocriterio+"=?");
        ps.setInt(1, valor1);
        ps.setInt(2, valor2);
        int r = ps.executeUpdate();
        closeDB();
        return r;
    }
    
    /**
     * Este método actualiza datos de una tabla siempre y cuando el campo a modificar sea texto
     * @param tabla
     * @param campoMod
     * @param valor1
     * @param campocriterio
     * @param valor2
     * @return
     * @throws SQLException 
     */    
    public int actualizarCampoTexto(String tabla, String campoMod,String valor1, String campocriterio, int valor2) throws SQLException {
        openDB();
        System.out.println("V2 Conexión: " + conn);
        PreparedStatement ps = conn.prepareStatement("UPDATE "+tabla+" SET "+campoMod+"= "+valor1+" WHERE "+campocriterio+"="+valor2+";");        
        System.out.println(ps);
        int r = ps.executeUpdate();
        closeDB();
        return r;        
    }
 
 
    public int actualizarCampoTextod(String tabla, String campoMod,String valor1, String campocriterio,String valor2) throws SQLException {
        openDB();
        //System.out.println("V2 Conexión: " + conn);
        PreparedStatement ps = conn.prepareStatement("UPDATE "+tabla+" SET "+campoMod+"= "+valor1+" WHERE "+campocriterio+"="+valor2+";");        
        System.out.println(ps);
        int r = ps.executeUpdate();
        closeDB();
        return r;        
    }
    /**
     *      
     * @param tabla nombre de la tabla donde se ingresarán los datos
     * @param campos nombre de los campos que se llenarán de la tabla
     * @param valores son los valores de los campos
     * @return
     * @throws SQLException 
     */
    public int ingresarRegistro(String tabla,String campos, String valores) throws SQLException {
        openDB();       
        PreparedStatement ps= conn.prepareStatement("INSERT INTO "+tabla+"("+campos+")"+" VALUES ("+valores+")");
        int r=ps.executeUpdate();
        closeDB();
        return r;
    }
    //METODO DE INSERCION DE DATOS Fer
//    public int ingresarRegistro(String tabla, String valores) throws SQLException {
//        openDB();
////        System.out.println("V2 Conexión: " + conn);
//        PreparedStatement ps= conn.prepareStatement("INSERT INTO "+tabla+" VALUES ("+valores+")");
//        int r=ps.executeUpdate();
//        closeDB();
//        return r;
//    }


    
    //METODO DE ELIMINACION DE REGISTROS Lalo
    /**
     * elimina un registro siempre por medio de una valor numérico
     * @param tabla
     * @param campocriterio
     * @param valor1
     * @return
     * @throws SQLException 
     */
    public int eliminaRegistro(String tabla, String campocriterio, int valor1) throws SQLException {
        openDB();
        System.out.println("V2 Conexión: " + conn);
        PreparedStatement ps = conn.prepareStatement("DELETE FROM "+tabla+" WHERE "+campocriterio+"=?");        
        ps.setInt(1, valor1);        
        System.out.println(ps);
        int r = ps.executeUpdate();
        closeDB();
        return r;
    }
    
    //plan de cuentas
    public ArrayList consultaPlan(String clave) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT codigosat, descripcion FROM cuenta_sat WHERE codigosat=?");
        ps.setString(1, clave);
          ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getString(2));
            }
            
        closeDB();        
        return r;
    }
    
    public Integer insertar(String campos, String tabla, String valores) throws SQLException {
        openDB();
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO "+tabla+" ("+campos+") VALUES ("+valores+")");
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    public ArrayList consulta(String campos, String tabla, String referencia, String condicion, String extra, int cantidad) throws SQLException {
        openDB();
        if(condicion.equals("")){condicion="is not null";}
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT "+campos+" FROM "+tabla+" WHERE "+referencia+" "+condicion+" "+extra);
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            for(int i = 1 ; i <= cantidad ; i++){r.add(rs.getObject(i));}
        }
        closeDB();        
        return r;
    }
    
    public Integer borrar(String tabla, String referencia, String condicion) throws SQLException {
        openDB();
        if(condicion.equals("")){condicion="is not null";}
        PreparedStatement ps;
        ps=conn.prepareStatement("DELETE FROM "+tabla+" WHERE "+referencia+" "+condicion);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    /**
     * este metodo permite actualizar datos de cualquier tabla
     * @param campos
     * @param tabla
     * @param referencia
     * @param condicion
     * @return
     * @throws SQLException 
     */
    
    public Integer actualizar(String campos, String tabla, String referencia, String condicion) throws SQLException {
        openDB();
        if(condicion.equals("")){
            condicion="is not null";
        }
        PreparedStatement ps;
        ps=conn.prepareStatement("UPDATE "+tabla+" SET "+campos+" WHERE "+referencia+" "+condicion);
        Integer rs = ps.executeUpdate();
        closeDB();
        return rs;
    }
    
    public ArrayList pendienteNomina() throws SQLException{
        openDB();
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT nomina.id_nomina,nomina.id_emp,empleado.cuenta,nomina.pago_total,estado.descripcion FROM nomina,estado,empleado WHERE nomina.id_emp = empleado.id_emp AND nomina.status = estado.id_estado AND nomina.status != 0;");
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            for(int i = 1 ; i <= 5 ; i++){r.add(rs.getObject(i));}
        }
        closeDB();        
        return r;
    }
    
    public ArrayList pendienteOrden() throws SQLException{
        openDB();
        ArrayList r=new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT ord_folio,prov_rfc, ord_codpro, ord_cantida, ord_fecha, estado_orden.descripcion FROM  orden_compra, estado_orden WHERE orden_compra.estatus = estado_orden.id_estado AND orden_compra.estatus != 0 ;");
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            for(int i = 1 ; i <= 6 ; i++){r.add(rs.getObject(i));}
        }
        closeDB();        
        return r;
    }
    
    public ArrayList sesion(int usuario, String pass) throws SQLException{
        openDB();
        ArrayList r = new ArrayList();
        PreparedStatement ps;
        ps=conn.prepareStatement("SELECT area_emp FROM empleado WHERE id_emp=? AND password=?;");
        ps.setInt(1, usuario);
        ps.setString(2, pass);
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            r.add(rs.getString(1));
        }
        closeDB();        
        return r;
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
     
     
     public ArrayList consultaRegistro(String id_emp) throws SQLException {
        openDB();    
        ArrayList r=new ArrayList();
        //Statement stmt;
        PreparedStatement ps;
        //stmt = conn.createStatement();
        ps=conn.prepareStatement("SELECT id_emp,area,des WHERE id_emp=? ");
        ps.setString(1, id_emp);
        //ResultSet rs = stmt.executeQuery("SELECT clave,modulo,tipo, fecha FROM asientos WHERE clave=");
          ResultSet rs= ps.executeQuery();
          System.out.println(rs.getString(1));
          System.out.println(rs.getString(2));
          System.out.println(rs.getString(3));
          System.out.println(rs.getString(4));
          System.out.println(rs.getString(5));
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
                r.add(rs.getString(1));
                r.add(rs.getString(2));
                r.add(rs.getString(3));  
                r.add(rs.getString(4));
                r.add(rs.getString(5));  
            }
            
        closeDB();        
        return r;
    }
     
       
    
}
