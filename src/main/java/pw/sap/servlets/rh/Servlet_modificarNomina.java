package pw.sap.servlets.rh;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;
import pw.sap.pojo.RH.Validador;

/**
 *
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "Servlet_modificarNomina", urlPatterns = {"/Servlet_modificarNomina"})
public class Servlet_modificarNomina extends HttpServlet {

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
        Conexion c = new Conexion();
        Validador validar = new Validador();
        String nomina = request.getParameter("modificarNominaIdResultado");
        String [] valores = {request.getParameter("modificarNominaEmpresa"),request.getParameter("modificarNominaFechaCreacion"),
                            request.getParameter("modificarNominaFechaLimite"),request.getParameter("modificarNominaIdEmpleado"),
                            request.getParameter("modificarNominaPercepciones"),request.getParameter("modificarNominaDeducciones"),
                            request.getParameter("modificarNominaDias"),request.getParameter("modificarNominaPagoDias"),
                            request.getParameter("modificarNominaTotal"),request.getParameter("modificarNominaPago")};
        String [] numero = {request.getParameter("modificarNominaFechaCreacion"),request.getParameter("modificarNominaFechaLimite"),
                            request.getParameter("modificarNominaIdEmpleado"),request.getParameter("modificarNominaPercepciones"),
                            request.getParameter("modificarNominaDeducciones"),request.getParameter("modificarNominaDias"),
                            request.getParameter("modificarNominaPagoDias"),request.getParameter("modificarNominaTotal")};
        String [] letra = {request.getParameter("modificarNominaPago")};
        if(validar.noVacio(valores)){
            if(validar.sinLetras(numero) && validar.sinNumeros(letra) && validar.fechaMayor(valores[1],valores[2])){
                String campos = "nombre_emp='"+valores[0]+"',fecha_creacion='"+valores[1]+"',fecha_limite='"+valores[2]+
                "',id_emp="+valores[3]+",percepciones="+valores[4]+",deducciones="+valores[5]+
                    ",dias_pagados="+valores[6]+",sueldo_por_dia="+valores[7]+",pago_total="+valores[8]+
                        ",forma_pago='"+valores[9]+"'";
                if(nomina != null && !nomina.equals("")){
                    Integer query = c.actualizar(campos, "nomina", "id_nomina","="+nomina);
                    if(query == 1){
                          //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "modificacion de una nomina");        
        
                        response.getWriter().write("1");
                    }else{
                          //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una nomina");        
        
                        response.getWriter().write("0");
                    }
                }else{
                      //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una nomina");        
        
                    response.getWriter().write("0");
                }
            }else{
                  //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una nomina");        
        
                response.getWriter().write("0");
            }
        }else{
             //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una nomina");        
        
            response.getWriter().write("0");
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
            Logger.getLogger(Servlet_modificarNomina.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_modificarNomina.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Servlet_modificarNomina.class.getName()).log(Level.SEVERE, null, ex);
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
