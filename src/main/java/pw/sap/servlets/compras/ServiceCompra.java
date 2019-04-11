package pw.sap.servlets.compras;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.MalformedURLException;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import mx.com.servicecompra.compraServicio;
import pw.sap.db.Conexion;
import pw.sap.pojo.Compras.WebServiceCompra;

/**
 *
 * @author Josafat, Maximiliano y Francisco
 */
@WebServlet(name = "ServiceCompra", urlPatterns = {"/ServiceCompra"})
public class ServiceCompra extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, MalformedURLException {
        response.setContentType("text/html;charset=UTF-8");
        Conexion c = new Conexion();
        WebServiceCompra servicio = new WebServiceCompra();
        String cod_producto;
        String cantidad;
        String procesar;
        ArrayList lista;
        URL url = new URL(request.getParameter("url"));
        String [] compra = request.getParameterValues("compraPendiente");
        QName qname = new QName("http://implementation.service.com.mx/", "compraImplementacion");
        Service service = Service.create(url, qname);
        compraServicio nm = service.getPort(compraServicio.class);
        for(String arreglo: compra){
           lista = c.consulta("prov_rfc, ord_codpro, ord_cantida, ord_fecha, estado_orden.descripcion","orden_compra, estado_orden",
                                "orden_compra.estatus != 0", "AND ord_folio = "+arreglo, "", 5);
            cod_producto = String.valueOf((BigDecimal) lista.get(1));
            cantidad = String.valueOf((BigDecimal) lista.get(2));
            procesar = servicio.fecha(lista.get(0).toString(),servicio.cod_cantidad(cod_producto, cantidad),lista.get(3).toString());
            switch(Integer.parseInt(nm.processor(procesar))){
                case 0:
                    c.actualizar("estatus = "+0, "orden_compra", "ord_folio = ", arreglo);
                    break;
                case 1:
                    c.actualizar("estatus = "+1, "orden_compra", "ord_folio = ", arreglo);
                    break;
                case 2:
                    c.actualizar("estatus = "+2, "orden_compra", "ord_folio = ", arreglo);
                    break;
                case 3:
                    c.actualizar("estatus = "+3, "orden_compra", "ord_folio = ", arreglo);
                    break;
                default:
                    c.actualizar("estatus = "+1, "orden_compra", "ord_folio = ", arreglo);
                    break;
            }
        }
        response.getWriter().write("Proceso Completado");
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
            Logger.getLogger(ServiceCompra.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ServiceCompra.class.getName()).log(Level.SEVERE, null, ex);
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
