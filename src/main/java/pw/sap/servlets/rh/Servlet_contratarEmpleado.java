/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.rh;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.http.HttpSession;
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
@WebServlet(name = "Servlet_contratarEmpleado", urlPatterns = {"/Servlet_contratarEmpleado"})
public class Servlet_contratarEmpleado extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String valores = ("'"+request.getParameter("cuenta")+"','"
                    +request.getParameter("contratarNombre")+"','"
                    + request.getParameter("contratarApellido") + "','"
                    + request.getParameter("contratarDireccion") + "','"
                    + request.getParameter("contratarRfc") + "','"
                    + request.getParameter("contratarTelefono")+"','"
                    + request.getParameter("contratarEdocivil") + "','"
                    + request.getParameter("contratarlicenciaMedica") + "','"
                    + request.getParameter("contratarSueldo") + "','"
                    + request.getParameter("contratarArea") + "','"
                    + request.getParameter("contratarCargo")+"'");        
            Integer query = c.insertar("cuenta,nombre_emp,apellido_emp,direccion_emp,rfc_emp,telefono_emp,edo_civil_emp,licencia_medica,sueldo_emp,area_emp,cargo_emp",
                    "empleado", valores);
            lista.add(c.consulta("id_emp", "empleado", "id_emp", "is not null", "ORDER BY id_emp DESC LIMIT 1", 1));
            if(query == 1){
                      //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Se contrato un empleado");        
        
                response.getWriter().write("Registro ingresado correctamente: "+lista.get(0));
            }else{
                       //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento fallido de contratacion");        
        
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
            Logger.getLogger(Servlet_contratarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_contratarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
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
