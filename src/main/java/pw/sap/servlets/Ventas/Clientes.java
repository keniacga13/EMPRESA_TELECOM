/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Ventas;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pw.sap.db.Conexion;
import pw.sap.pojo.Ventas.ClienteBean;
import pw.sap.pojo.Ventas.QuerysVentas;

/**
 *
 * @author ricardozaldivar
 */
@WebServlet(name = "Clientes", urlPatterns = {"/Clientes"})
public class Clientes extends HttpServlet {

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
        
        QuerysVentas c = new QuerysVentas();
//        
//        String claveCliente = "cli0001";
        

        
        String nombreEmpresa = request.getParameter("nomEmp");
        String rfcEmpresa = request.getParameter("rfcEmp");
        String estadoDomEmpresa = request.getParameter("estadoDom");
        String muniDomEmpresa = request.getParameter("municipioDom");
        String callenumDomEmpresa = request.getParameter("calleDom");
        String postalDomEmpresa = request.getParameter("postalDom");
        
        ClienteBean cliBean = new ClienteBean(nombreEmpresa, rfcEmpresa, estadoDomEmpresa, muniDomEmpresa, callenumDomEmpresa, postalDomEmpresa);
        
           boolean sw=c.agregarCliente(cliBean);
//           ClienteBean cb =c.detalleCli();
            if(sw){
//                PrintWriter out=response.getWriter();

//                request.setAttribute("idCli", cliBean.getIdClienteEmp());
//                request.setAttribute("nombreEmp", cliBean.getNombreEmpresa());
//                request.setAttribute("rfcEmp", cliBean.getRfcEmpresa());
//                request.setAttribute("estadoDom", cliBean.getEstadoDomEmpresa());
//                request.setAttribute("muniDom", cliBean.getMuniDomEmpresa());
//                request.setAttribute("calleynumDom", cliBean.getCallenumDomEmpresa());
//                request.setAttribute("postalDom", cliBean.getPostalDomEmpresa());
//                
//                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Ventas/modales/detalleCliente.jsp");
//                dispatcher.forward(request, response);
                
//                request.getRequestDispatcher("Ventas/modales/detalleCliente.jsp").forward(request, response);

//registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Registro de cliente");        
        
             PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('REGISTRO INSERTADO CORRECTAMENTE!!!');");
            out.print("window.location='Ventas/clientes.jsp'");
            out.println("</script>");

            }else{
                
                //registro para log
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Intento fallido de insercion de cliente");    
             PrintWriter out=response.getWriter();
            out.println("<script>");
            out.println("alert('ERROR EN LA CONEXIÓN DE BASE DE DATOS');");
            out.print("window.location='Ventas/clientes.jsp'");
            out.println("</script>");
            }
//      request.getRequestDispatcher("Ventas/clientes.jsp").forward(request, response);
//        response.sendRedirect("Ventas/clientes.jsp");
        

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
            Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Clientes.class.getName()).log(Level.SEVERE, null, ex);
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
