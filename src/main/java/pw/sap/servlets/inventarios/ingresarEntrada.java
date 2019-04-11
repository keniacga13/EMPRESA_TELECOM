/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.inventarios;

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
import javax.servlet.http.HttpSession;
import pw.sap.pojo.Inventarios.Modificar;
import pw.sap.pojo.Inventarios.registro;

/**
 *
 * @author migue_f4t6hjx
 */
@WebServlet(name = "ingresarEntrada", urlPatterns = {"/ingresarEntrada"})
public class ingresarEntrada extends HttpServlet {

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
  
             String codigo = request.getParameter("no_lote");
             
             registro rg = new registro();
             rg.agregarLote(codigo);
            
             
//            ArrayList l= rg.cantidadComprada(codigo);
//            ArrayList m= rg.cantidadProducto(String.valueOf(l.get(1)));
//            
//            int cantidad_com = Integer.parseInt((String) l.get(0));
//            int cantidad_exist = Integer.parseInt((String) m.get(0));
//             Modificar mod = new Modificar();
//             mod.modificarCantidad(String.valueOf(l.get(1)), String.valueOf(cantidad_com+cantidad_exist));
            
             //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        rg.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Entrada de producto");        
        
             
            PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('Producto ingresado correctamente');");
            out.print("window.location='Inventarios/Inventario/entradas.jsp'");
            out.println("</script>");
            
            
            
            
            
            

        
        
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
            Logger.getLogger(ingresarEntrada.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ingresarEntrada.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ingresarEntrada.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ingresarEntrada.class.getName()).log(Level.SEVERE, null, ex);
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
