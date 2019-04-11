/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;
//import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;


import java.sql.Connection;

import java.sql.SQLException;


/**
 *
 * @author Nesto
 */
public class OrdenCompraPojo {
    
    Connection conn;
    
    public OrdenCompraPojo() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
    }
    
    
   
    private String ord_codprod;
    private String ord_cantidad;
    private String prov_rfc;
    private String ord_fecha;
    private String ord_pagotot;

    public OrdenCompraPojo(String ord_codprod, String ord_cantidad, String prov_rfc, String ord_fecha, String ord_pagotot) {
        this.ord_codprod = ord_codprod;
        this.ord_cantidad = ord_cantidad;
        this.prov_rfc = prov_rfc;
        this.ord_fecha = ord_fecha;
        this.ord_pagotot = ord_pagotot;
    }

    public Connection getConn() {
        return conn;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public String getOrd_codprod() {
        return ord_codprod;
    }

    public void setOrd_codprod(String ord_codprod) {
        this.ord_codprod = ord_codprod;
    }

    public String getOrd_cantidad() {
        return ord_cantidad;
    }

    public void setOrd_cantidad(String ord_cantidad) {
        this.ord_cantidad = ord_cantidad;
    }

    public String getProv_rfc() {
        return prov_rfc;
    }

    public void setProv_rfc(String prov_rfc) {
        this.prov_rfc = prov_rfc;
    }

    public String getOrd_fecha() {
        return ord_fecha;
    }

    public void setOrd_fecha(String ord_fecha) {
        this.ord_fecha = ord_fecha;
    }

    public String getOrd_pagotot() {
        return ord_pagotot;
    }

    public void setOrd_pagotot(String ord_pagotot) {
        this.ord_pagotot = ord_pagotot;
    }
    
    
}
