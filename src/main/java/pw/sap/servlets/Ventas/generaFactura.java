/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Ventas;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.pojo.Ventas.Factura;
import pw.sap.pojo.Ventas.QuerysVentas;

/**
 *
 * @author ricar
 */
@WebServlet(name = "generaFactura", urlPatterns = {"/generaFactura"})
public class generaFactura extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
        processRequest(request, response);
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
        processRequest(request, response);
        
        String id_intermC= request.getParameter("id_intermC");
        double total_iva=Double.parseDouble(request.getParameter("total_iva"));
        double subtotal_pago=Double.parseDouble(request.getParameter("subtotal_pago"));
        double total_pago=Double.parseDouble(request.getParameter("total_pago"));
        String tipo_venta = request.getParameter("tipo_venta");
        String forma_pago = request.getParameter("forma_pago");
        
        QuerysVentas c = null;
        try {
            c = new QuerysVentas();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(generaFactura.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(generaFactura.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        String rfc = c.consultaRFCReceptor(id_intermC);
        
//        Factura fac = new Factura("EMIS101097HCL","RECE111197HCL",subtotal_pago,total_iva,total_pago,"Toluca, EdoMex","Tarjeta",tipo_venta);
        Factura f = new Factura("EMIS101097HCL",rfc, subtotal_pago, total_iva,total_pago, "Toluca, EdoMex",forma_pago, tipo_venta);
        try {
            boolean sw = c.agregarFactura(f);
            
            if (sw) {
                PrintWriter out = response.getWriter();
                out.print(total_pago);
            }else{
                PrintWriter out = response.getWriter();
                out.print(total_pago);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(generaFactura.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(generaFactura.class.getName()).log(Level.SEVERE, null, ex);
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
