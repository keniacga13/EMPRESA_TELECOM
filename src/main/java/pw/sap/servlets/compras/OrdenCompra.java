/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.compras;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.pojo.Compras.OrdenCompraPojo;
import pw.sap.pojo.Compras.QuerysCompras;
import pw.sap.pojo.Compras.requisicionPojo;

/**
 *
 * @author Nesto
 */
@WebServlet(name = "OrdenCompra", urlPatterns = {"/OrdenCompra"})
public class OrdenCompra extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        QuerysCompras c = new QuerysCompras();
        
        String ord_cantidad = request.getParameter("ord_cantidad");
        String ord_codprod = request.getParameter("ord_codprod");
        String prov_rfc = request.getParameter("prov_rfc");
        String ord_fecha = request.getParameter("ord_fecha");
        String ord_pagotot = request.getParameter("ord_pagotot");
        
        OrdenCompraPojo ordenBean = new OrdenCompraPojo(ord_codprod, ord_cantidad, prov_rfc, ord_fecha, ord_pagotot);
        
        boolean sw = c.agregarOrdenCompra(ordenBean);
        
        if (sw) {
            
          //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Registro de Orden de Compra");        
                    
            PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('REGISTRO INSERTADO CORRECTAMENTE!!!');");
            out.print("window.location='Compras/html/CompraOrden.jsp'");
            out.println("</script>");
        }else{
            
          //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento fallido de insercion");        
        
            PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('ERROR EN LA CONEXIÓN DE BASE DE DATOS');");
            out.print("window.location='Compras/html/CompraOrden.jsp'");
            out.println("</script>");
        }
          
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdenCompra.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdenCompra.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdenCompra.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdenCompra.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
