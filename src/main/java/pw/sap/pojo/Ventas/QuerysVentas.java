/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

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
 * @author ricardozaldivar
 */
public class QuerysVentas {
        
    Connection conn;
    
    public QuerysVentas() throws ClassNotFoundException, SQLException {
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
    
    
        public boolean agregarCliente(ClienteBean cliBean) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDs idcli = new Genera_IDs();
            openDB();
            try {
                
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO empresa_cliente VALUES ('"+idcli.idClientes()+"','"+cliBean.getNombreEmpresa()+"','"+cliBean.getRfcEmpresa()+"','"+cliBean.getEstadoDomEmpresa()+"','"+cliBean.getMuniDomEmpresa()+"','"+cliBean.getCallenumDomEmpresa()+"','"+cliBean.getPostalDomEmpresa()+"')");
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
        
        

        
        
        
        
        public boolean agregarInterm(IntermBean interBean) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDs idcli = new Genera_IDs();
            openDB();
            try {
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO interm_cliente VALUES ('"+idcli.idIntermediario()+"','"+interBean.getIntermNom()+"','"+interBean.getIntermApellidos()+"','"+interBean.getIntermTel()+"','"+interBean.getIntermMail()+"','"+interBean.getIdEmpresa()+"')");
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
        
        public boolean insertApartado(ApartaProducto ap) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDs idcli = new Genera_IDs();
            openDB();
            try {
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO apartaprod VALUES ('"+idcli.idApartado()+"','"+consultarOrdenVenta()+"','Deuda',"+ap.getAbono_apart()+","+ap.getCargo_apart()+")");
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
        
        public boolean insertVPP(ArrayList<VentaPorProducto> vpp) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDs idcli = new Genera_IDs();
            openDB();
            try {
                    if(conn!=null){
                        for (int i = 0; i < vpp.size(); i++) {
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO venta_por_prod VALUES ('"+vpp.get(i).getId_producto()+"','"+consultarOrdenVenta()+"',"+vpp.get(i).getMonto()+","+vpp.get(i).getCantidad()+","+vpp.get(i).getIva()+")");
                        agregado=true;
                        st.close();
                        }

                    }
                closeDB();
                    } catch (SQLException e) {
                        agregado=false;
                        e.printStackTrace();
                    }
            return agregado;
        }
        
                public String consultarCli(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_emprc from empresa_cliente order by id_emprc desc limit 1");
          while(rs.next()){
           id = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id;
        }
        
        public String consultarFactu(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select folio from factura order by folio desc limit 1");
          while(rs.next()){
           id = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id;
        }
        
        public String consultarApartado(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_aparta from apartaprod order by id_aparta desc limit 1");
          while(rs.next()){
           id = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id;
        }
        
        public int consultarIDFactura(){
         int id = 0;
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select count(*) from Factura;");
          while(rs.next()){
           id = rs.getInt(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id+1;
        }
        
        public String consultarOrdenVenta(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_ordenventa from OrdenVenta order by id_ordenventa desc limit 1");
          while(rs.next()){
           id = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id;
        }
        
        public String consultarInter(){
         String id="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_interm from interm_cliente order by id_interm desc limit 1");
          while(rs.next()){
           id = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return id;
        }
        
        public String consultaRFCReceptor(String RFC){
         String rfc="";
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("SELECT rfc_emp FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc where id_interm = '"+RFC+"'");
          while(rs.next()){
           rfc = rs.getString(1);
          }
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rfc;
        }
        
        public ClienteBean detalleCli(){
         ClienteBean cliBean = null;
        String idCliente; 
        String nombreEmpresa = null;
        String rfcEmpresa = null;
        String estadoDomEmpresa = null;
        String muniDomEmpresa = null;
        String callenumDomEmpresa = null;
        String postalDomEmpresa = null;
        
         try{
          openDB();
          Statement st=conn.createStatement();
          ResultSet rs=st.executeQuery("select id_emprc from empresa_cliente order by id_emprc desc limit 1");
          while(rs.next()){
           idCliente = rs.getString(1);
           nombreEmpresa = rs.getString(2);
           postalDomEmpresa = rs.getString(3);
           estadoDomEmpresa = rs.getString(4);
           muniDomEmpresa = rs.getString(5);
           callenumDomEmpresa = rs.getString(6);
           rfcEmpresa = rs.getString(7);
          }
          cliBean = new ClienteBean(nombreEmpresa, rfcEmpresa, estadoDomEmpresa, muniDomEmpresa, callenumDomEmpresa, postalDomEmpresa);
          rs.close();
          st.close();
         }catch(SQLException se){
          se.printStackTrace();
         }
         
         return cliBean;
        }      
    
        public ResultSet consultarIDEMP(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_emprc, nombre_emp from empresa_cliente");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        
         public ResultSet consultarIDInterm(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_interm, nombre_inter from interm_cliente");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
         
         public ResultSet consultarEmpleado(int id_emp){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select nombre_emp,apellido_emp from empleado where id_emp="+id_emp);
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
         
        public ResultSet buscaProductosVenta(String codigo){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("select id_producto, nombre, costo_venta from producto where id_producto='"+codigo+"'");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        }
        
         public ResultSet tablaCliente(){
         ResultSet rs = null;
         try{
          openDB();
          Statement st=conn.createStatement();
          rs=st.executeQuery("SELECT empresa_cliente.id_emprc, nombre_emp, rfc_emp, nombre_inter, apellidos_inter, tel_inter, correo_inter FROM empresa_cliente INNER JOIN interm_cliente ON interm_cliente.id_emprc = empresa_cliente.id_emprc;");
         }catch(SQLException se){
          se.printStackTrace();
         }
         return rs;
        } 
         
        public boolean agregarOrdenVenta(OrdenVenta ov) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDs idcli = new Genera_IDs();
            openDB();
            try {
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO OrdenVenta VALUES ('"+idcli.idOrdenVenta()+"','"+ov.getId_intermC()+"','"+ov.getFecha_ordv()+"',current_timestamp,"+ov.getTotal_iva()+","+ov.getSubtotal_pago()+","+ov.getTotal_pago()+",'"+ov.getFecha_entrega()+"',null,'"+ov.getMoneda()+"',"+ov.getId_emp()+")");
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
        
          public boolean agregarFactura(Factura fac) throws SQLException, ClassNotFoundException{
            boolean agregado=false;
            Genera_IDs fact = new Genera_IDs();
            openDB();
            try {
                    if(conn!=null){
                        Statement st;
                        st = conn.createStatement();
                        st.executeUpdate("INSERT INTO Factura VALUES ("+consultarIDFactura()+",'"+fact.uuid()+"','"+fact.idFactura()+"',null,'"+fac.getRfc_receptor()+"','"+fac.getRfc_emisor()+"',"+fac.getSubtotal()+","+fac.getTotal_iva()+",null,null,null,"+fac.getTotal()+",current_date,null,'"+fac.getLugar_exp()+"','"+fac.getForma_pago()+"','"+fac.getTipo_venta()+"','"+consultarOrdenVenta()+"')");
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
         
         
          public int insercionRegistro(int id_emp, String area, String des) throws SQLException{
        openDB();
        int valor=1;
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO log(id_emp,area,des) VALUES ("+id_emp+",'"+area+"','"+des+"');");
        valor= ps.executeUpdate();
        closeDB();        
        return valor;
    }
          
             public ResultSet consultaProducto() throws SQLException, ClassNotFoundException{
         
                 openDB();
                  PreparedStatement ps;
                    
                     ps = conn.prepareStatement("select factura.id, producto.id_producto, producto.nombre, factura.folio, producto.cantidad, producto.proveedor, producto.costo_unitario, factura.total_iva, factura.subtotal from producto INNER JOIN factura ON producto.proveedor = factura.rfc_receptor ;");
                     //ON producto.proveedor = factura.rfc_receptor
                    ResultSet rs= ps.executeQuery();
          
                    System.out.println(ps);
                    
                    closeDB();
                  return rs;
        }
}
