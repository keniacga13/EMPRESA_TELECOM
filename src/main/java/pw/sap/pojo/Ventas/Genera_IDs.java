/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

import java.sql.SQLException;

/**
 *
 * @author ricardozaldivar
 */
public class Genera_IDs {
    
    
    public String idClientes() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarCli();
        
        if ("".equals(idCli) || idCli == null) {
            return "cli1";
        }else{
            String num = idCli.replace("cli", "");
            int con = Integer.parseInt(num)+1;
            return "cli"+String.valueOf(con);
        }
    }
    
        
    public String idIntermediario() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarInter();
        
        if ("".equals(idCli) || idCli == null) {
            return "itr1";
        }else{
            String num = idCli.replace("itr", "");
            int con = Integer.parseInt(num)+1;
            return "itr"+String.valueOf(con);
        }
    }
    
    public String idOrdenVenta() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarOrdenVenta();
        
        if ("".equals(idCli) || idCli == null) {
            return "ven1";
        }else{
            String num = idCli.replace("ven", "");
            int con = Integer.parseInt(num)+1;
            return "ven"+String.valueOf(con);
        }
    }
    
        public String idFactura() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarFactu();
        
        if ("".equals(idCli) || idCli == null) {
            return "fac1";
        }else{
            String num = idCli.replace("fac", "");
            int con = Integer.parseInt(num)+1;
            return "fac"+String.valueOf(con);
        }
    }
        
        public String idApartado() throws ClassNotFoundException, SQLException{
        
        QuerysVentas c = new QuerysVentas();
        
        String idCli = c.consultarApartado();
        
        if ("".equals(idCli) || idCli == null) {
            return "apr1";
        }else{
            String num = idCli.replace("apr", "");
            int con = Integer.parseInt(num)+1;
            return "apr"+String.valueOf(con);
        }
    }        
        
    public String uuid()
    {
        String result = java.util.UUID.randomUUID().toString();

            String replaceAll = result.replaceAll("-", "");
            String substring = replaceAll.substring(0, 32);

        return substring;
    }
}
