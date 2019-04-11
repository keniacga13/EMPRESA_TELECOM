/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.inventarios;

import pw.sap.pojo.Inventarios.registro;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;
import pw.sap.pojo.Inventarios.Merma;
import pw.sap.pojo.Inventarios.Modificar;

/**
 *
 * @author montse
 */
@WebServlet(name = "Modificar_Merma", urlPatterns = {"/Modificar_Merma"})
public class Modificar_Merma extends HttpServlet {

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
        
        Modificar mod= new Modificar();  
        registro rg = new registro();
        
        String codigo = request.getParameter("id_merma");
        String tipo = request.getParameter("tipo_merma");
        String cantidad = request.getParameter("cant_mer");
        String observaciones = request.getParameter("motivo_mer");
        
//        ArrayList nombre_producto = rg.productoMerma(cantidad);
//        ArrayList l= rg.cantidadProducto(String.valueOf(nombre_producto.get(0)));
//        ArrayList m= rg.cantidadMerma(codigo);
//       
//        int cantidad_prod = Integer.parseInt((String) l.get(0));
//        int cantidad_merma_actual = Integer.parseInt((String) m.get(0));
//        int cantidad_merma = Integer.parseInt(request.getParameter("cant_mer"));

             //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        rg.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Modificacion de merma");        
        
            PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('Merma ingresada correctamente');");
            out.print("window.location='Inventarios/Inventario/merma.jsp'");
            out.println("</script>");
        
        
         mod.modificarMerma(codigo, tipo, cantidad, observaciones);
      
//       String total= String.valueOf(cantidad_prod - (cantidad_merma_actual-cantidad_merma));
//       
//       if(cantidad_merma<=cantidad_prod){
//           
//            PrintWriter out=response.getWriter();
//            out.println("<script>");
//            out.println("alert('Merma ingresada correctamente');");
//            out.print("window.location='Inventarios/Inventario/merma.jsp'");
//            out.println("</script>");
//             
//              mod.modificarCantidad(codigo, total);
//            
//       }else{
//        PrintWriter out=response.getWriter();
//            out.println("<script>");
//            out.println("alert('No se puede mermar más de lo que existe');");
//            out.print("window.location='Inventarios/Inventario/merma.jsp'");
//            out.println("</script>");
//       }
//        
        
          

 
        
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
            Logger.getLogger(Modificar_Merma.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Modificar_Merma.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Modificar_Merma.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Modificar_Merma.class.getName()).log(Level.SEVERE, null, ex);
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

