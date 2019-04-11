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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;
import pw.sap.pojo.RH.Validador;

/**
 *
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "Servlet_consultaTarea", urlPatterns = {"/Servlet_consultaTarea"})
public class Servlet_consultaTarea extends HttpServlet {

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
        ArrayList lista;
        Validador validar = new Validador();
        String empleado = request.getParameter("id_empleado");
        String tarea = request.getParameter("id_tarea");
        String referencia = validar.referenciaConsultaTarea(tarea, empleado);
        lista = c.consulta("id_tarea,nombre_tarea,id_emp,fecha_inicio,fecha_fin",
                            "tarea", referencia, "ORDER BY id_tarea ASC", "", 5);
        String [] campos = {"ID","NOMBRE","RESPONSABLE","FECHA INICIO","FECHA FIN"};
        try (PrintWriter out = response.getWriter()) {
            out.println("<table class='table table-bordered'>");
            out.println("<tr>");
            for (String arreglo1 : campos) {
                out.println("<td>"+arreglo1+"</td>");
            }
            out.println("</tr>");
            out.println("<tr>");
            for(int j = 0 ; j < lista.size() ; j++){
                if(j%5==0 && j!=0){out.println("</tr><tr>");}
                out.print("<td>"+lista.get(j)+"</td>");
            }
            out.println("</tr>");
            out.println("</table>");
        }
               //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "consulta de tarea");        
        
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
            Logger.getLogger(Servlet_consultaTarea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_consultaTarea.class.getName()).log(Level.SEVERE, null, ex);
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
