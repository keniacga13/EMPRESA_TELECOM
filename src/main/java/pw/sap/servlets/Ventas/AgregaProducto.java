/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Ventas;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.pojo.Ventas.ProductoBean;
import pw.sap.pojo.Ventas.QuerysVentas;

/**
 *
 * @author ricardozaldivar
 */
@WebServlet(name = "AgregaProducto", urlPatterns = {"/AgregaProducto"})
public class AgregaProducto extends HttpServlet {

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
            throws ServletException, IOException {
        
        //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
//        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Se agrego un producto");        
        
        
        response.setContentType("text/html;charset=UTF-8");
        
//        String codigoProd = request.getParameter("codigoProd");

         
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws java.io.IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws IOException{
        response.setContentType("text/plain");
        String codprod = request.getParameter("codprod");

         QuerysVentas c = null;
        try {
            c = new QuerysVentas();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AgregaProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AgregaProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
         ResultSet rs = c.buscaProductosVenta(codprod);
        PrintWriter out = response.getWriter();
        String nombre = null;
        double precio = 0;
        double iva = 0;
        try {
            while(rs.next()){
               nombre = rs.getString(2);
               iva = rs.getDouble(3);
               precio = rs.getDouble(4);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AgregaProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
                out.print(nombre);
//        if (codprod.equalsIgnoreCase("demo1")) {
            Gson gson = new Gson();
            out.print(gson.toJson(new ProductoBean(nombre,precio,iva)));
            out.flush();
            out.close();
//        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws java.io.IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/plain");
        String codprod = request.getParameter("codprod");
//        String codigo = codprod.

         QuerysVentas c = null;
        try {
            c = new QuerysVentas();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AgregaProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AgregaProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
         ResultSet rs = c.buscaProductosVenta(codprod);
        PrintWriter out = response.getWriter();
        String nombre = null;
        double precio = 0;
        double iva = 0;
        try {
            while(rs.next()){
               nombre = rs.getString(2);
               precio = rs.getDouble(3);
            }

        } catch (SQLException ex) {
            Logger.getLogger(AgregaProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
            iva = precio*0.16;
            Gson gson = new Gson();
            out.print(gson.toJson(new ProductoBean(nombre,precio,iva)));
            out.flush();
            out.close();
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
