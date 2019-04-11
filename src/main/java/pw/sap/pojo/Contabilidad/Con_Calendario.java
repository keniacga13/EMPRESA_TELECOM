/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Contabilidad;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

/**
 *
 * @author fgb
 */
public class Con_Calendario {
        Connection conn;
    
    public Con_Calendario() throws ClassNotFoundException, SQLException {
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
    
    public int actualizarCalendario(String clave,String fechaini,String fechafin,int periodo,String status) throws SQLException{
        openDB();       
        PreparedStatement ps= conn.prepareStatement("update calen_contable set fechaini='"+fechaini+"', fechafin='"+fechafin+"', periodo="+periodo+", status='"+status+"' where clave='"+clave+"';");        
        int r=ps.executeUpdate();
        closeDB();
        return r;        
        
    }
    
    public int consultaIdPlanCuentasEmpresa(double cuenta) throws SQLException{
        openDB();        
        PreparedStatement ps;
        int r = 0;
        ps=conn.prepareStatement("select ce.id from cuentas_empresa as ce,cuenta_sat as cs where ce.id_cuenta=cs.id and cs.cuenta=?;");
        ps.setDouble(1, cuenta);
        ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
              r=rs.getInt(1);
            }        
        closeDB();
        return r;
    }
    
    /**
     * Metodo para insertar datos en el asiento detallado
     * @param idgeneral
     * @param fechafac
     * @param foliofac
     * @param cuentacon
     * @param nocuenta
     * @param monto
     * @param descripcion
     * @param foliofiscal
     * @param rfc
     * @param deducible
     * @param porcentaje
     * @return
     * @throws SQLException 
     */
    public int insertarAsientoDetallado(int idgeneral,String fechafac,String foliofac,String cuentacon,double nocuenta, double monto,String descripcion,String foliofiscal,String rfc,boolean deducible,double porcentaje) throws SQLException{
        openDB();        
        PreparedStatement ps;
        ps=conn.prepareStatement("insert into asientodetalle (id_general,fecha_fac,foliofac,cuenta,nocuenta,monto,descripcion,folio_fiscal,rfc,deducible,porcentaje_dedu)\n" +
"values(?,'"+fechafac+"',?,?,?,?,?,?,?,?,?);");
        ps.setInt(1, idgeneral);
        ps.setString(2, foliofac);
        ps.setString(3, cuentacon);
        ps.setDouble(4,nocuenta);
        ps.setDouble(5,monto);
        ps.setString(6, descripcion);
        ps.setString(7, foliofiscal);
        ps.setString(8, rfc);
        ps.setBoolean(9, deducible);
        ps.setDouble(10,porcentaje);
        int r=ps.executeUpdate();
        closeDB();
        return r;        
    }
    
    /**
     * Metodo para insertar asiento general
     * @param modulo
     * @param comprobante
     * @param fechacap
     * @param concepto
     * @param periodo
     * @return
     * @throws SQLException 
     */
    public int insertarAsientoGeneral(String claveasiento,int modulo,String comprobante,String fechacap,String concepto,int periodo) throws SQLException{
        openDB();        
        PreparedStatement ps;
        ps=conn.prepareStatement("INSERT INTO asientogeneral (clave,modulo,tipo_comprobante,fecha_apli,concepto,periodo_conta) VALUES (?,?,?,'"+fechacap+"',?,?);");
        ps.setString(1, claveasiento);
        ps.setInt(2, modulo);
        ps.setString(3, comprobante);      
        ps.setString(4, concepto);
        ps.setInt(5, periodo);
        int r=ps.executeUpdate();
        closeDB();
        return r;
    }
    
    public int consultaIdAsientoGeneral(String clave) throws SQLException{
        openDB();        
        PreparedStatement ps;
        int r = 0;
        ps=conn.prepareStatement("select id from asientogeneral where clave=?;");
        ps.setString(1, clave);
        ResultSet rs= ps.executeQuery();
            while (rs.next()) {                
                //System.out.println(rs.getInt(1));
              r=rs.getInt(1);
            }        
        closeDB();
        return r;
    }
    
    public ResultSet consultaAsientoDetalle() throws SQLException{
        ArrayList r=new ArrayList();
        openDB();        
        PreparedStatement ps;        
        ps=conn.prepareStatement("select ag.clave,ad.foliofac,ad.descripcion,ad.folio_fiscal,ad.fecha_fac,ad.cuenta,ad.monto from asientodetalle as ad, asientogeneral as ag where ad.id_general=ag.id;");        
        ResultSet rs= ps.executeQuery();
//            while (rs.next()) {                
//                //System.out.println(rs.getInt(1));
//              r.add(rs.getString(1));
//              r.add(rs.getString(2));
//              r.add(rs.getString(3));
//              r.add(rs.getString(4));
//              r.add(rs.getString(5));
//              r.add(rs.getString(6));
//              r.add(rs.getDouble(7));
//            }        
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
    
}
