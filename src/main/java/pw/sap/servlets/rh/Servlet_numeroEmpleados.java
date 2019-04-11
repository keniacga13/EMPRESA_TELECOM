package pw.sap.servlets.rh;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
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
 * @author Josafat Rosas Ortiz
 */
@WebServlet(name = "Servlet_numeroEmpleados", urlPatterns = {"/Servlet_numeroEmpleados"})
public class Servlet_numeroEmpleados extends HttpServlet {

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
        Map <String,Object> empleado = new LinkedHashMap();
        lista = c.consulta("count(*)", "empleado", "area_emp", " = 'Recursos Humanos'", "AND status != 'Despedido'", 1);
        empleado.put("RH",lista.get(0));
        lista = c.consulta("count(*)", "empleado", "area_emp", " = 'Compras'", "AND status != 'Despedido", 1);
        empleado.put("COM",lista.get(0));
        lista = c.consulta("count(*)", "empleado", "area_emp", " = 'Gerencia'", "AND status != 'Despedido'", 1);
        empleado.put("GER",lista.get(0));
        lista = c.consulta("count(*)", "empleado", "area_emp", " = 'Ventas'", "AND status != 'Despedido'", 1);
        empleado.put("VEN",lista.get(0));
        lista = c.consulta("count(*)", "empleado", "area_emp", " = 'Inventarios'", "AND status != 'Despedido'", 1);
        empleado.put("INV",lista.get(0));
        lista = c.consulta("count(*)", "empleado", "area_emp", " = 'Contabilidad'", "AND status != 'Despedido'", 1);
        empleado.put("CON",lista.get(0));
        for(String area: empleado.keySet()){System.out.println(area + " TIENE "+empleado.get(area));}
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
            Logger.getLogger(Servlet_numeroEmpleados.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_numeroEmpleados.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Servlet_numeroEmpleados.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_numeroEmpleados.class.getName()).log(Level.SEVERE, null, ex);
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
