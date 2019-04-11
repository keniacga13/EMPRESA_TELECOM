/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Contabilidad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.obj.Contabilidad.ObjLibroDiario;
import pw.sap.pojo.Contabilidad.LibroDiario;

/**
 *
 * @author maxim
 */
@WebServlet(name = "LibroDiarioConsulta", urlPatterns = {"/LibroDiarioConsulta"})
public class LibroDiarioConsulta extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");

        LibroDiario ld = new LibroDiario();
        String fechainicio;
        String fechafinal;
        fechainicio = request.getParameter("fechaIni");
        fechafinal = request.getParameter("fechaFin");
        double abono;
        double cargo;
        abono = ld.consultaLibroDiarioAbono(fechainicio, fechafinal);
        cargo = ld.consultaLibroDiarioCargo(fechainicio, fechafinal);

        request.getSession().setAttribute("fechaini", request.getParameter("fechaIni"));
        request.getSession().setAttribute("fechafin", request.getParameter("fechaFin"));
        request.getSession().setAttribute("modulo", request.getParameter("modulo1"));
        request.getSession().setAttribute("abono", abono);
        request.getSession().setAttribute("cargo", cargo);
        // ld.consultaLibroDiario(request.getParameter("modulo1"), request.getParameter("tipoconsulta"), request.getParameter("fechaIni"), request.getParameter("fechaFin"));

        response.sendRedirect("Contabilidad/ct_libro_diario_1.jsp");
        
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
            Logger.getLogger(LibroDiarioConsulta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LibroDiarioConsulta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(LibroDiarioConsulta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(LibroDiarioConsulta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LibroDiarioConsulta.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(LibroDiarioConsulta.class.getName()).log(Level.SEVERE, null, ex);
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
