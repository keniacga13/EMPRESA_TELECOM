<%-- 
    Document   : detalleInter
    Created on : 07-may-2018, 1:33:33
    Author     : ricardozaldivar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTabla.css">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="detalleInterme" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Detalles del intermediario</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form>
                        <span id="titulo"><span class="number">2</span>Informaci&oacute;n intermediario</span><br>
                            <br>
                            
                            <table>
                            
                                <tr>
                                    <td><h5>ID de intermediario:&nbsp;</h5><input type="text" onkeypress="return SoloNumeros(event)" id="idIntermediario" name="idIntermediario" placeholder="ID Intermediaio"></td>
                                </tr>

                                <tr>
                                      <td><h5>Nombre de empresa:&nbsp;</h5><input type="text" onkeypress="return soloLetras(event)" id="nombreEmp" name="nomEmp" placeholder="Nombre de la empresa"></td>
                                </tr>
                            </table>
                            <br>
                            <table>
                            
                                <tr>
                                    <td><h5>Nombre de intermediario:&nbsp;</h5><input type="text" onkeypress="return soloLetras(event)" id="nombreInter2" name="nombreInt" placeholder="Nombre"></td>
                                </tr>

                                <tr>
                                      <td><h5>Apellidos de intermediario:&nbsp;</h5><input type="text" onkeypress="return soloLetras(event)" id="apellidoInter2" name="apellInt" placeholder="Apellidos"></td>
                                </tr>
                                
                                <tr>
                                    <td><h5>Tel&eacute;fono de intermediario:&nbsp;</h5><input type="text" id="telefonoInter2" name="telInt" placeholder="N&uacute;mero de tel&eacute;fono"></td>
                                </tr>

                                <tr>
                                      <td><h5>Mail de intermediario:&nbsp;</h5><input type="text" id="correoInter2" name="correoInt" placeholder="Correo electr&oacute;nico"></td>
                                </tr>
                            </table>
                            
                         
                               
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #9F150D" onclick="validaRegistroInterm()" class="btn btn-danger">Aceptar</button>
              </div>
            </div>
          </div>
        </div>
        
    <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../js/Ventas/VenGeneral.js"></script>
    <script src="../js/Ventas/VenValidaciones.js"></script>
    
    </body>
</html>
