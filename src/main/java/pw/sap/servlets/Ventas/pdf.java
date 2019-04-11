
package pw.sap.servlets.Ventas;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.beans.Statement;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class pdf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out=response.getOutputStream();
        try  {
            try{
               Connection con=null;
                Statement st=null;
                ResultSet rs=null;
                Class.forName("org.postgresql.Driver");
                
              Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
        st=(Statement) con.createStatement();
      //  rs = st.executeQuery("SELECT * FROM propducto;");
      //st.executeUpdate("SELECT * FROM propducto");
        st.execute();
        
        if(con!=null){
           try{
               Document documento=new Document();
               PdfWriter.getInstance(documento, out);
               
               documento.open();
               
               Paragraph par1=new Paragraph();
               
               Font fontitulo=new Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLUE);
               
               par1.add(new Phrase("Reporte con iTextpdf.jar",fontitulo));
               par1.setAlignment(Element.ALIGN_CENTER);
               par1.add(new Phrase(Chunk.NEWLINE));//salto de linea
               par1.add(new Phrase(Chunk.NEWLINE));
               documento.add(par1);
               
               
                Paragraph par2=new Paragraph();
               
               Font fondescripccion=new Font(Font.FontFamily.HELVETICA,16,Font.BOLD,BaseColor.BLUE);
               
               par2.add(new Phrase("Reporte con iTextpdf.jar esto es un pededkjsfhdskjfhsjdf jsadfhs",fondescripccion));
               par2.setAlignment(Element.ALIGN_CENTER);
               par2.add(new Phrase(Chunk.NEWLINE));//salto de linea
               par2.add(new Phrase(Chunk.NEWLINE));
               documento.add(par2);
               
               PdfPTable tabla= new PdfPTable(3);
               PdfPCell celda1=new PdfPCell(new Paragraph("codigo",FontFactory.getFont("Arial")));
               PdfPCell celda2=new PdfPCell(new Paragraph("nombre",FontFactory.getFont("Arial")));
               PdfPCell celda3=new PdfPCell(new Paragraph("subtotal",FontFactory.getFont("Arial")));
               
               tabla.addCell(celda1);
               tabla.addCell(celda2);
               tabla.addCell(celda3);
               
               while(rs.next()){
                   tabla.addCell(rs.getString(1));
                   tabla.addCell(rs.getString(2));
                   tabla.addCell(rs.getString(3));
               }
               documento.close();
           }catch(Exception ex){
               ex.getMessage();
           } 
        }
            }catch(Exception ex){
                ex.getMessage();
            }
            
           
        }finally{
            out.close();
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
