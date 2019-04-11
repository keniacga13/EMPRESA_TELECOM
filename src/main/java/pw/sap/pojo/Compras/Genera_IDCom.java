/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;

import java.sql.SQLException;

/**
 *
 * @author Nesto
 */
public class Genera_IDCom {
    
    public String idOrdenCompra() throws ClassNotFoundException, SQLException{
        
        QuerysCompras c = new QuerysCompras();
        
        String idOC = c.consultarOrdenC();
        
        if ("".equals(idOC) || idOC == null) {
            return "cli1";
        }else{
            String num = idOC.replace("cli", "");
            int con = Integer.parseInt(num)+1;
            return "cli"+String.valueOf(con);
        }
    }
    
}
