/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.servlets.Contabilidad;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pw.sap.pojo.Contabilidad.Con_Calendario;

/**
 *
 * @author fgb
 */
@WebServlet(name = "AgregaAsientoDetallado", urlPatterns = {"/AgregaAsientoDetallado"})
public class AgregaAsientoDetallado extends HttpServlet {

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
        Con_Calendario c=new Con_Calendario();
        //obtencion de datos
        System.out.println("obtencion de datos");
        //obtencion de idgeneral        
        int idgeneral=c.consultaIdAsientoGeneral(request.getParameter("idasientogeneral"));        
        System.out.println("idgeneral: "+idgeneral);
        String fechafac=request.getParameter("fechafac");
        System.out.println("fechafac:"+fechafac);
        String foliofac=request.getParameter("foliofac");
        System.out.println("foliofac:"+foliofac);
        //definir tipo de cuenta abono o cargo
        int cuenta=Integer.parseInt(request.getParameter("cuenta"));
        String cuentacon = null;
        if(cuenta==1){
            cuentacon="cargo";
        }else if(cuenta==2){
            cuentacon="abono";
        }
        System.out.println("cuenta:"+cuentacon);
        //fin de cuenta cargo o abono
        double nocuenta=Double.parseDouble(request.getParameter("cuentaCon"));
        System.out.println("numero de cuenta:"+nocuenta);
        int idcuentaempresa=c.consultaIdPlanCuentasEmpresa(nocuenta);
        System.out.println("id cuenta de la empresa:"+idcuentaempresa);
        double monto=Double.parseDouble(request.getParameter("monto"));
        System.out.println("monto:"+monto);
        String descripcion=request.getParameter("descripAs");
        System.out.println("descripcion"+descripcion);
        String foliofiscal=request.getParameter("uuid");
        System.out.println("uuid:"+foliofiscal);
        String rfc=request.getParameter("rfc");
        System.out.println("rfc:"+rfc);
        //proceso para los deducibles
        boolean deducible=Boolean.parseBoolean(request.getParameter("deducible"));
        System.out.println("deducible"+deducible);
        double porcentaje=0;
        if(deducible==true){
            porcentaje=Double.parseDouble(request.getParameter("porcentajeAs"));
        }else{
            porcentaje=0;
        }
        System.out.println("porcentaje"+porcentaje);
        //insercion de asiento contable;
        c.insertarAsientoDetallado(idgeneral,fechafac,foliofac,cuentacon,idcuentaempresa,monto,descripcion,foliofiscal,rfc,deducible,porcentaje);
        
        //registro para log***************************
        HttpSession sesion=request.getSession(true);
        System.out.println("sesion usuario:"+sesion.getAttribute("usuario"));
        System.out.println("sesion usuario:"+sesion.getAttribute("area"));
        c.insercionRegistro((int)sesion.getAttribute("usuario"), (String)sesion.getAttribute("area"), "Se creo un asiento contable detallado");
        //int i = c.insercionRegistro((int)request.getSession().getAttribute("usuario"), (String)request.getSession().getAttribute("area"), "Se realizo una agregacion en el calendario");
        
        //redireccionamiento a la pagina de asientos contables
        response.sendRedirect("Contabilidad/asientos_conta.jsp");
        
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AgregaAsientoDetallado.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AgregaAsientoDetallado.class.getName()).log(Level.SEVERE, null, ex);
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
