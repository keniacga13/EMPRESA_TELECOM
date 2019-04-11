package pw.sap.servlets.rh;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
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
@WebServlet(name = "Servlet_modificarTarea", urlPatterns = {"/Servlet_modificarTarea"})
public class Servlet_modificarTarea extends HttpServlet {

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
        String tarea = request.getParameter("modificarTareaIdResultado");
        String [] valores = {request.getParameter("modificarNombreTarea"),request.getParameter("modificarTareaIdEmpleado"),
                            request.getParameter("modificarTareaFechaInicio"),request.getParameter("modificarTareaFechaFin")};
        String [] numero = {request.getParameter("modificarTareaIdEmpleado")};
        if(validar.noVacio(valores)){
            if(validar.sinLetras(numero) && validar.fechaMayor(valores[2],valores[3])){
                String campos = "nombre_tarea='"+valores[0]+"',id_emp="+valores[1]+",fecha_inicio='"+valores[2]+
                "',fecha_fin='"+valores[3]+"'";
                if(tarea != null && !tarea.equals("")){
                    Integer query = c.actualizar(campos, "tarea", "id_tarea","="+tarea);
                    if(query == 1){
                          //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "modificacion de una tarea");        
        
                        response.getWriter().write("1");
                    }else{
                          //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una tarea");        
        
                        System.out.println("query");
                        response.getWriter().write("0");
                    }
                }else{
                      //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una tarea");        
        
                    System.out.println("tarea");
                    response.getWriter().write("0");
                }
            }else{
                  //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una tarea");        
        
                System.out.println("validacion");
                response.getWriter().write("0");
            }
        }else{
              //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento de modificacion de una tarea");        
        
            System.out.println("vacio");
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
            Logger.getLogger(Servlet_modificarTarea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_modificarTarea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(Servlet_modificarTarea.class.getName()).log(Level.SEVERE, null, ex);
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
