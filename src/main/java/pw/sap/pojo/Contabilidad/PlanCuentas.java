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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Properties;
import pw.sap.obj.Contabilidad.ObjCuentaSat;
import pw.sap.obj.Contabilidad.ObjPlanDeCuentas;

public class PlanCuentas {

    Connection conn;

    public PlanCuentas() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }

    /**
     * inicio de conexion de la base de datos con postgres
     *
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
     *
     * @throws SQLException
     */
    public void closeDB() throws SQLException {
        conn.close();
    }
    
    public static  LinkedList  consultaTodoPlan() throws SQLException, ClassNotFoundException {
        Connection conn;
        Class.forName("org.postgresql.Driver");
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        
        LinkedList <ObjPlanDeCuentas> l=new LinkedList<ObjPlanDeCuentas>();
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT ce.id, cs.cuenta, cs.descripcion, ce.tipo_cuenta, ce.clase_cuenta, cs.cuenta||'-'||cs.descripcion as \"Clase_SAT\", ce.naturaleza FROM cuentas_empresa as ce, cuenta_sat as cs where cs.id = ce.id_cuenta;");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
                ObjPlanDeCuentas pc=new ObjPlanDeCuentas();
                pc.setId(rs.getInt("id"));
                pc.setId_cuenta(rs.getDouble("cuenta"));
                pc.setDescripcion(rs.getString("descripcion"));
                pc.setTipo_cuenta(rs.getString("tipo_cuenta"));
                pc.setClase_cuenta(rs.getString("clase_cuenta"));
                pc.setClase_sat(rs.getString("Clase_SAT"));
                pc.setNaturaleza(rs.getString("naturaleza"));              
                l.add(pc);
            }   

        conn.close();
        return l;
    }
    
    public static  LinkedList  consultaTodoSat() throws SQLException, ClassNotFoundException {
        Connection conn;
        Class.forName("org.postgresql.Driver");
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);        
        LinkedList <ObjCuentaSat> l=new LinkedList<ObjCuentaSat>();
        PreparedStatement ps;
        ps = conn.prepareStatement("select * from cuenta_sat");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
                ObjCuentaSat cs=new ObjCuentaSat();
                cs.setId(rs.getInt("id"));
                cs.setCuenta(rs.getInt("cuenta"));
                cs.setDescripcion(rs.getString("descripcion"));
                l.add(cs);
            }   

        conn.close();
        return l;
    }

    public ArrayList consultaPlan(String clave) throws SQLException {
        openDB();
        ArrayList r = new ArrayList();
        PreparedStatement ps;
        
        ps = conn.prepareStatement("SELECT ce.id,cs.cuenta, cs.descripcion, ce.tipo_cuenta, ce.clase_cuenta, cs.cuenta||'-'||cs.descripcion as \"Clase_SAT\", ce.naturaleza FROM cuentas_empresa as ce, cuenta_sat as cs where cs.id = ce.id_cuenta and (cs.cuenta=? or ce.descripcion=?);");
        
        if (isNumeric(clave)==true) {
            ps.setInt(1, Integer.parseInt(clave));
            ps.setString(2, "");
        }else{
            ps.setNull(1,0);
            ps.setString(2, clave);
        }
        
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            r.add(rs.getString(1));
            r.add(rs.getString(2));
            r.add(rs.getString(3));
            r.add(rs.getString(4));
            r.add(rs.getString(5));
            r.add(rs.getString(6));
            r.add(rs.getString(7));
        }

        closeDB();
        return r;
    }

  
    
    public int agregaPlan(int id_cuenta, String descripcion, String tipo_cuenta, String clase_cuenta, String naturaleza) throws SQLException {
        openDB();
        PreparedStatement ps = conn.prepareStatement("insert into cuentas_empresa(id_cuenta,descripcion,tipo_cuenta,clase_cuenta,naturaleza) values (?,?,?,?,?);");
        ps.setInt(1, id_cuenta); 
        ps.setString(2, descripcion);
        ps.setString(3, tipo_cuenta);
        ps.setString(4, clase_cuenta);
        ps.setString(5, naturaleza);
        int r= ps.executeUpdate();
        closeDB();
        return r;
    }
    
    public String descSat(int id) throws SQLException {
        openDB();
        String desc="";
        
        PreparedStatement ps = conn.prepareStatement("SELECT descripcion FROM cuenta_sat where id=?");
        ps.setInt(1, id);
        
        ResultSet rs = ps.executeQuery();
         rs.next(); 
        desc=rs.getString(1);
        closeDB();
        
        return desc;
    }
    
    
    public int eliminaPlan(int id) throws SQLException {
        openDB();
        int r=0;
        PreparedStatement ps=conn.prepareStatement("delete from cuentas_empresa where id=?");
        ps.setInt(1, id);
        try{
        r=ps.executeUpdate();
        }catch(Exception e){
            System.out.println("error:"+e.getMessage());
            r=0;
        }
        System.out.println("el resultado es:"+r);
        closeDB();
        return r;
    }
    
    public int editaPlan(int id, String tipo_cuenta, String clase_cuenta, String naturaleza) throws SQLException {
        openDB();
        PreparedStatement ps = conn.prepareStatement("update cuentas_empresa set tipo_cuenta=?,clase_cuenta=?,naturaleza=? where id=?");
        ps.setString(1, tipo_cuenta);
        ps.setString(2, clase_cuenta);
        ps.setString(3, naturaleza);
        ps.setInt(4, id);
        int r= ps.executeUpdate();
        closeDB();
        return r;
    }

    //Metodos de consulta de datos
    /**
     * consultaEspecifica de campos y posibilidad de where
     *
     * @param numcampos
     * @param campo
     * @param tabla
     * @throws SQLException
     */
    public int consultaEspecifica(int numcampos, String campo, String tabla) throws SQLException {
        openDB();
        int existendatos = 0;
        Statement stmt;
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT " + campo + " FROM " + tabla);

        while (rs.next()) {
            for (int i = 1; i <= numcampos; i++) {
                existendatos = 1;
                System.out.print(rs.getString(i));
            }
        }

        closeDB();
        return existendatos;
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
     
    public static boolean isNumeric(String cadena) {

        boolean resultado;

        try {
            Integer.parseInt(cadena);
            resultado = true;
        } catch (NumberFormatException excepcion) {
            resultado = false;
        }

        return resultado;
    }
           
}
