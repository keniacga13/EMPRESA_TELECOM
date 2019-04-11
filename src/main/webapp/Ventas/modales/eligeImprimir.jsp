<%-- 
    Document   : eligeImprimir
    Created on : 07-may-2018, 1:34:26
    Author     : ricardozaldivar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTabla.css">
        <link rel="stylesheet" type="text/css" href="../css/VenTablareporteventas1.css">
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>   
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="formatoImprime" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Formato de impresi&oacute;n</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form onsubmit="descargarExcel()">
                        <span id="titulo"><span class="number">1</span>Imprimir</span><br>
                        <br>
                        
                        
                        <table id="tblReporte">
                            
                              <tr>
                                  <td>
                                      <h5>Eliga un formato de impresi&oacute;n:&nbsp;</h5>
                                      <select id="formatoImp" name="formatoImp">
                                        <optgroup label="Elige formato">
                                            <option value="select">Selecciona</option>
                                            <option value=”pdf">PDF</option>
                                            <option value="excel">Excel (.xlsx)</option>
                                            <option value="word">Word (.docx)</option>
                                        </optgroup>
                                        </select>     
                                  </td>
                              </tr>
                              
                        </table>    
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
           <button type="submit" value="Generar Excel" style="background-color: #9F150D" name="imprimir" class="btn btn-danger">Imprimir</button>
           <<%--type="button" style="background-color: #9F150D" onclick="valmodalimprimir()" class="btn btn-danger"--%>
              </div>
            </div>
          </div>
        </div>
        
    <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../../js/Ventas/VenGeneral.js"></script>
    <script src="../../js/Ventas/VenValidaciones.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    </body>
</html>
