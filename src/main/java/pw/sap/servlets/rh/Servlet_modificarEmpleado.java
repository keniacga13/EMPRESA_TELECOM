package pw.sap.servlets.rh;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;
import pw.sap.pojo.RH.Validador;

/**
 *
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "Servlet_modificarEmpleado", urlPatterns = {"/Servlet_modificarEmpleado"})
public class Servlet_modificarEmpleado extends HttpServlet {

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
        Conexion c = new Conexion();
        Validador validar = new Validador();
        String empleado = request.getParameter("modificarIdResultado");
        String [] valores = {request.getParameter("modificarNombreEmpleado"),request.getParameter("modificarApellidoEmpleado"),
                            request.getParameter("modificarDireccionEmpleado"),request.getParameter("modificarRFC"),
                            request.getParameter("modificarTelefonoEmpleado"),request.getParameter("modificarEdocivilEmpleado"),
                            request.getParameter("modificarLicEmpleado"),request.getParameter("modificarSueldoEmpleado"),
                            request.getParameter("modificarAreaEmpleado"),request.getParameter("modificarCargoEmpleado"),
                            request.getParameter("modificarCuentaEmpleado")};
        String [] numero = {request.getParameter("modificarTelefonoEmpleado"),request.getParameter("modificarSueldoEmpleado"),
                            request.getParameter("modificarCuentaEmpleado")};
        String [] letra = {request.getParameter("modificarNombreEmpleado"),request.getParameter("modificarApellidoEmpleado"),
                           request.getParameter("modificarEdocivilEmpleado"),request.getParameter("modificarLicEmpleado"),
                           request.getParameter("modificarAreaEmpleado"),request.getParameter("modificarCargoEmpleado")};
        if(validar.noVacio(valores)){
            if(validar.sinLetras(numero) && validar.sinNumeros(letra)){
                String campos = "nombre_emp='"+valores[0]+"',apellido_emp='"+valores[1]+"',direccion_emp='"+valores[2]+
                "',rfc_emp='"+valores[3]+"',telefono_emp='"+valores[4]+"',edo_civil_emp='"+valores[5]+
                    "',licencia_medica='"+valores[6]+"',sueldo_emp="+valores[7]+",area_emp='"+valores[8]+
                        "',cargo_emp='"+valores[9]+"',cuenta="+valores[10]+"";
                if(empleado != null && !empleado.equals("")){
                    Integer query = c.actualizar(campos, "empleado", "id_emp","="+empleado);
                    if(query == 1){
                               //registro para log
        HttpSession sesion=request.getSession(true);
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "se modifico a un empleado");        
        
                        response.getWriter().write("1");
                    }else{
                         //registro para log
        HttpSession sesion=request.getSession(true);
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de un empleado");        
        
                        response.getWriter().write("0");
                    }
                }else{
                     //registro para log
        HttpSession sesion=request.getSession(true);
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de un empleado");        
        
                    response.getWriter().write("0");
                }
            }else{
                 //registro para log
        HttpSession sesion=request.getSession(true);
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de un empleado");        
        
                response.getWriter().write("0");
            }
        }else{
             //registro para log
        HttpSession sesion=request.getSession(true);
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de un empleado");        
        
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
            Logger.getLogger(Servlet_modificarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_modificarEmpleado.class.getName()).log(Level.SEVERE, null, ex);
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
