/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.rh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;

/**
 *
 * @author Windows 10 Pro
 */
@WebServlet(name = "Servlet_agregarNomina", urlPatterns = {"/Servlet_agregarNomina"})
public class Servlet_agregarNomina extends HttpServlet {

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
        ArrayList lista = new ArrayList();
                    Conexion c = new Conexion();
             c.openDB();
            Double deducciones=Double.parseDouble(request.getParameter("deducciones"));
            Double percepciones=Double.parseDouble(request.getParameter("percepciones"));
            Double diast=Double.parseDouble(request.getParameter("diasPagados"));
            Double sueldod=Double.parseDouble(request.getParameter("contratarSueldoDiario"));
            
            Double pago;
            pago = ((percepciones-deducciones)+(diast*sueldod));
        try (PrintWriter out = response.getWriter()) {
            String valores = ("'"
                    +request.getParameter("empresa")+"','"
                    + request.getParameter("fechaCreacion")+"','"
                    + request.getParameter("fechaLimite") + "',"
                    + request.getParameter("idEmpleado") + ","
                    + request.getParameter("percepciones")+","
                    + request.getParameter("deducciones") + ","
                    + request.getParameter("diasPagados") + ","
                    + request.getParameter("contratarSueldoDiario")+","
                    + pago + ",'"
                    + request.getParameter("formaPago")+"',"+(-1)); 
            System.out.println(valores);           
            Integer query = c.insertar("nombre_emp,fecha_creacion,fecha_limite,id_emp,percepciones,deducciones,dias_pagados,sueldo_por_dia,pago_total,forma_pago,status",
                    "nomina", valores);
            lista.add(c.consulta("id_nomina", "nomina", "id_nomina", "is not null", "ORDER BY id_nomina DESC LIMIT 1", 1));
            if(query == 1){
                response.sendRedirect("RH/RH/rh_index.jsp");
            }else{
                response.getWriter().write("Registro incorrecto, revisar datos");
            }         
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
            Logger.getLogger(Servlet_agregarNomina.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_agregarNomina.class.getName()).log(Level.SEVERE, null, ex);
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
