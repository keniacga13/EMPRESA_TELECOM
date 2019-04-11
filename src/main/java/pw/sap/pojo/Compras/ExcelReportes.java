/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Compras;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.xmlbeans.impl.common.IOUtil;

/**
 *
 * @author Adrian
 */
public class ExcelReportes
{

    Connection conn;

    public ExcelReportes() throws ClassNotFoundException, SQLException
    {
        Class.forName("org.postgresql.Driver");
    }

    public void openBD() throws SQLException
    {
        Properties connProp = new Properties();
        connProp.put("user", "postgres");
        connProp.put("password", "root");
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/BDSAPPW", connProp);
    }

    public void closeBD() throws SQLException
    {
        conn.close();
    }

    public void cearExcel()
    {
        Workbook libro = new HSSFWorkbook();
        org.apache.poi.ss.usermodel.Sheet hoja = libro.createSheet("Reporte Compras");

        try
        {
            FileOutputStream archivo = new FileOutputStream("C:\\Users\\Adrian\\Escritorio\\excel\\Reporte Compras Productos.xls");
            libro.write(archivo);
            archivo.close();
        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void crearExcelNuevo()
    {
        Workbook libro = new XSSFWorkbook();
        org.apache.poi.ss.usermodel.Sheet hoja = libro.createSheet("Reporte Compras");

        //Creacion de filas y cledas relacionadas con la fila
        Row fila = hoja.createRow(5);
        fila.createCell(6).setCellValue("Primer Reporte");
        fila.createCell(2).setCellValue(780505.2);
        fila.createCell(3).setCellValue(true);

        //Celda por separado para formulas, para dar mas caracteristicas a la celda
        Cell celda = fila.createCell(7);
        celda.setCellFormula(String.format("1+1", ""));

        Row fila1 = hoja.createRow(1);
        fila1.createCell(2).setCellValue(70.5);
        fila1.createCell(3).setCellValue(70.5);

        Cell celda2 = fila1.createCell(7);
        celda2.setCellFormula(String.format("C%d+D%d", 2, 2));

        try
        {
            FileOutputStream archivo = new FileOutputStream("Reporte Compras.xlsx");
            libro.write(archivo);
            archivo.close();
        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void leerExcel() throws IOException
    {
        try
        {
            FileInputStream archivo = new FileInputStream(new File("C:\\Users\\Adrian\\Escritorio\\excel\\Excel.xlsx"));

            XSSFWorkbook extraerinfo = new XSSFWorkbook(archivo);
            XSSFSheet hoja = extraerinfo.getSheetAt(0);

            int numFilas = hoja.getLastRowNum();

            for (int a = 0; a <= numFilas; a++)
            {
                Row fila = hoja.getRow(a);
                int numCol = fila.getLastCellNum();

                for (int b = 0; b < numCol; b++)
                {
                    Cell celda = fila.getCell(b);
                    switch (celda.getCellTypeEnum().toString())
                    {
                        case "NUMERIC":

                            System.out.println(celda.getNumericCellValue() + " ");

                            break;
                        case "STRING":

                            System.out.println(celda.getStringCellValue() + " ");

                            break;
                        case "Formula":

                            System.out.println(celda.getCellFormula() + " ");

                            break;
                    }
                }
                System.out.println(" ");
            }

        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Cargar demanera masiva desde un Excel a la Base de Datos
    public void cargaExcel() throws SQLException, ClassNotFoundException, IOException
    {
        PreparedStatement ps;
        try
        {
            FileInputStream archivo = new FileInputStream(new File("C:\\Users\\Adrian\\Escritorio\\excel\\Excel.xlsx"));

            XSSFWorkbook extraerinfo = new XSSFWorkbook(archivo);
            XSSFSheet hoja = extraerinfo.getSheetAt(0);

            int numFilas = hoja.getLastRowNum();

            for (int a = 1; a <= numFilas; a++)
            {
                Row fila = hoja.getRow(a);
                ps = conn.prepareStatement("INSERT INTO producto (codigo, nombre, precio, cantidad) VALUES (?,?,?,?)");
                ps.setString(1, fila.getCell(0).getStringCellValue());
                ps.setString(2, fila.getCell(1).getStringCellValue());
                ps.setDouble(3, fila.getCell(2).getNumericCellValue());
                ps.setDouble(4, fila.getCell(3).getNumericCellValue());
                ps.executeQuery();
            }
            closeBD();
        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void modificarExcel() throws IOException
    {
        try
        {
            FileInputStream archivo = new FileInputStream(new File("C:\\Users\\Adrian\\Escritorio\\excel\\Excel.xlsx"));

            XSSFWorkbook extraerinfo = new XSSFWorkbook(archivo);
            XSSFSheet hoja = extraerinfo.getSheetAt(0);

            //Fila que se va a traer
            XSSFRow fila = hoja.getRow(1);
            if (fila == null)
            {
                fila = hoja.createRow(1);
            }

            XSSFCell celda = fila.createCell(1);
            if (celda == null)
            {
                celda = fila.createCell(1);
            }
            //Agregar valor a la celda
            celda.setCellValue(90);

            archivo.close();

            FileOutputStream guardar = new FileOutputStream("C:\\Users\\Adrian\\Escritorio\\excel\\Excel.xlsx");
            extraerinfo.write(guardar);
            guardar.close();

        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void reporteProveedorBD() throws SQLException
    {
        Workbook libroReporte = new XSSFWorkbook();
        Sheet hojaR = libroReporte.createSheet("Reporte Productos");
        
        try
        {
//            //Fuente del archivo que se utilizara
//            InputStream is = new FileInputStream("C:\\Users\\Adrian\\Mis documentos\\NetBeansProjects\\SAP_PW_2018\\SAP_PW_2018\\src\\main\\java\\pw\\sap\\pojo\\Compras\\imgReportes\\download.png");
//            byte[] bytes = IOUtils.toByteArray(is);
//            //Tipo de imagen  y se cierra el archivo is
//            int imgIndex = libroReporte.addPicture(bytes, libroReporte.PICTURE_TYPE_PNG);
//            is.close();
//            
//           CreationHelper ayuda = libroReporte.getCreationHelper();
//           Drawing draw = hojaR.createDrawingPatriarch();
//           //Se coloca en que fila y columna se colocara la imagen
//           ClientAnchor ancho = ayuda.createClientAnchor();
//           ancho.setCol1(0);
//           ancho.setRow1(1);
//           Picture imagen = draw.createPicture(ancho, imgIndex);
//           //Cambiar tamaño de la imagen (donde empieza, cuanto puede usar)
//           imagen.resize(1, 3);
           //Titulo del Reporte
           CellStyle tituloEstilo = libroReporte.createCellStyle();
           tituloEstilo.setAlignment(HorizontalAlignment.CENTER);
           tituloEstilo.setVerticalAlignment(VerticalAlignment.CENTER);
           Font fuenteTitulo = libroReporte.createFont();
           fuenteTitulo.setFontName("Arial");
           fuenteTitulo.setBold(true);
           fuenteTitulo.setFontHeightInPoints((short)25);
           //Se asina al estilo, se envia objeto de la fuente que se a creado
           tituloEstilo.setFont(fuenteTitulo);
           
           Row filaTitulo = hojaR.createRow(0);
           Cell celdaTitulo = filaTitulo.createCell(0);
           celdaTitulo.setCellStyle(tituloEstilo);
           celdaTitulo.setCellValue("Reporte Proveedores");
           //Combinar celdas, parametros (fila donde empieza, ultima fila que utilizara, primer columna que utilizara, ultima columna que utilizara)
           hojaR.addMergedRegion(new CellRangeAddress(0, 3, 0, 7));
           
           String[] cabecera = new String[]{"RFC Proveedor", "Nombre Empresa", "Nombre Contacto", "Correo", "Teléfono", "Estado", "Municipio", "Codigo Postal"};
           
           //Cabecera
           CellStyle cabeceraEstilo = libroReporte.createCellStyle();
           cabeceraEstilo.setFillForegroundColor(IndexedColors.DARK_RED.getIndex());
           cabeceraEstilo.setFillPattern(FillPatternType.SOLID_FOREGROUND);
           cabeceraEstilo.setBorderBottom(BorderStyle.THIN);
           cabeceraEstilo.setBorderLeft(BorderStyle.THIN);
           cabeceraEstilo.setBorderRight(BorderStyle.THIN);
           cabeceraEstilo.setBorderTop(BorderStyle.THIN);
           
           //Fuente Cabecera
           Font fuenteCabecera = libroReporte.createFont();
           fuenteCabecera.setFontName("Arial");
           fuenteCabecera.setBold(true);
           fuenteCabecera.setColor(IndexedColors.WHITE.getIndex());
           fuenteCabecera.setFontHeightInPoints((short) 12);
           cabeceraEstilo.setFont(fuenteCabecera);
           
           //Fila Encabezados
           Row filaEncabezados = hojaR.createRow(4);
           
            for (int i = 0; i < cabecera.length; i++)
            {
                Cell celdaEncabezado = filaEncabezados.createCell(i);
                celdaEncabezado.setCellStyle(cabeceraEstilo);
                celdaEncabezado.setCellValue(cabecera[i]);
            }
            
            openBD();
            if (conn != null)
            {
                PreparedStatement ps;

                int numFilaDatos = 5;
                //Estolo Contenido
                CellStyle contenidoEstilo = libroReporte.createCellStyle();
                contenidoEstilo.setBorderBottom(BorderStyle.THIN);
                contenidoEstilo.setBorderLeft(BorderStyle.THIN);
                contenidoEstilo.setBorderRight(BorderStyle.THIN);
                contenidoEstilo.setBorderTop(BorderStyle.THIN);

                ps = conn.prepareStatement("SELECT * FROM proveedor");

                ResultSet rs = ps.executeQuery();

                //Se cuentan las columnas que se tienen en la base de datos en esa tabla
                int numCol = rs.getMetaData().getColumnCount();

                //Recorrer Todo los Resultados
                while (rs.next())
                {
                    Row filaDatos = hojaR.createRow(numFilaDatos);

                    //Crear cada una de las celdas
                    for (int a = 0; a < numCol; a++)
                    {
                        Cell celdaDatos = filaDatos.createCell(a);
                        //Asignar estilo a las celda
                        celdaDatos.setCellStyle(contenidoEstilo);
//
                        //Agregar Contenido a las Celdas
//                        if (a == 1 || a == 2 || a == 3 || a == 4 || a == 6 || a == 7)
//                        {
                            celdaDatos.setCellValue(rs.getString(a+1));
//                        } else
//                        {
//                            celdaDatos.setCellValue(rs.getInt(a + 1));
//                        }
//
                        numFilaDatos++;
                    }
                }
                //Auto ajuste de las columnas
                hojaR.autoSizeColumn(0);
                hojaR.autoSizeColumn(1);
                hojaR.autoSizeColumn(2);
                hojaR.autoSizeColumn(3);
                hojaR.autoSizeColumn(4);
                hojaR.autoSizeColumn(5);
                hojaR.autoSizeColumn(6);
                hojaR.autoSizeColumn(7);
                
                //Zoom en el excel
                hojaR.setZoom(130);

            } 
           
           //Archivo a generar
           FileOutputStream archivoReporte = new FileOutputStream("PrimerReporteCompras.xlsx");
           //Se escribe en el libro
           libroReporte.write(archivoReporte);
           //Se Cierra el archivo
           archivoReporte.close();
        } catch (FileNotFoundException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex)
        {
            Logger.getLogger(ExcelReportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void abrirExcel()
    {
        try{
          Runtime.getRuntime().exec("cmd /c start PrimerReporteCompras.xlsx");
          }catch(IOException  e){
              e.printStackTrace();
          }
    }

}
