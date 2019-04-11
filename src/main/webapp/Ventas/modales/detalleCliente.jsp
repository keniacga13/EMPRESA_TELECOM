<%-- 
    Document   : detalleCliente
    Created on : 07-may-2018, 1:33:17
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
    </head>
    <body>
        <!-- Modal -->
        <div class="modal fade" id="detalleCliente" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Detalles del cliente</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form>
                        <span id="titulo"><span class="number">1</span>Informaci&oacute;n cliente</span><br>
                        <br>
                        
                        
                        <table>
                            
                              <tr>
                                  <td><h5>ID de empresa:&nbsp;</h5><input type="text" value="<%= request.getAttribute("idCli")%>" id="idEmpresa" name="idEmpresa" placeholder="ID Empresa"></td>
                              </tr>
                              
                              <tr>
                                    <td><h5>Nombre de empresa:&nbsp;</h5><input type="text" onkeypress="return soloLetras(event)" value="<%= request.getAttribute("nombreEmp")%>" id="nombreEmp" name="nomEmp" placeholder="Nombre de la empresa"></td>
                              </tr>
                                
                              <tr>
                                  <td><h5>RFC de empresa:&nbsp;</h5><input type="text" value="<%= request.getAttribute("rfcEmp")%>" id="rfcEmp" name="rfcEmp" placeholder="RFC de la empresa"></td>
                              </tr>
                        </table>
                        
                            <center><h4>Domicilio</h4></center><br>
                            
                            <table>
                                <tr>
                                    <td>
                                        <h5>Entidad:&nbsp;</h5>
                                        <select id="estado" name="field4">
                                        <optgroup label="Estados">
                                            <option value="select">Selecciona</option>
                                            <option value=”Aguascalientes">Aguascalientes</option>
                                            <option value="Baja California">Baja California </option>
                                            <option value="Baja California Sur">Baja California Sur </option>
                                            <option value="Campeche">Campeche </option>
                                            <option value="Chiapas">Chiapas </option>
                                            <option value="Chihuahua">Chihuahua </option>
                                            <option value="Coahuila">Coahuila </option>
                                            <option value="Colima">Colima </option>
                                            <option value="Distrito Federal">Distrito Federal</option>
                                            <option value="Durango">Durango </option>
                                            <option value="Estado de México">Estado de México </option>
                                            <option value="Guanajuato">Guanajuato </option>
                                            <option value="Guerrero">Guerrero </option>
                                            <option value="Hidalgo">Hidalgo </option>
                                            <option value="Jalisco">Jalisco </option>
                                            <option value="Michoacán">Michoacán </option>
                                            <option value="Morelos">Morelos </option>
                                            <option value="Nayarit">Nayarit </option>
                                            <option value="Nuevo León">Nuevo León </option>
                                            <option value="Oaxaca">Oaxaca </option>
                                            <option value="Puebla">Puebla </option>
                                            <option value="Querétaro">Querétaro </option>
                                            <option value="Quintana Roo">Quintana Roo </option>
                                            <option value="San Luis Potosí">San Luis Potosí </option>
                                            <option value="Sinaloa">Sinaloa </option>
                                            <option value="Sonora">Sonora </option>
                                            <option value="Tabasco">Tabasco </option>
                                            <option value="Tamaulipas">Tamaulipas </option>
                                            <option value="Tlaxcala">Tlaxcala </option>
                                            <option value="Veracruz">Veracruz </option>
                                            <option value="Yucatán">Yucatán </option>
                                            <option value="Zacatecas">Zacatecas</option>
                                        </optgroup>
                                        </select>     
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td><h5>Municipio:&nbsp;</h5><input type="text" onkeypress="return soloLetras(event)" value="<%= request.getAttribute("muniDom")%>" id="municipioEmp" name="municipioDom" placeholder="Municipio"></td>
                                </tr>
                                
                                <tr>
                                    <td><h5>Calle y n&uacute;mero:&nbsp;</h5><input type="text" value="<%= request.getAttribute("calleynumDom")%>" id="calleEmp" name="callDom" placeholder="Calle y n&uacute;mero"></td>
                                </tr>
                                
                                <tr>
                                    <td><h5>C&oacute;digo Postal:&nbsp;</h5><input type="text" onkeypress="return SoloNumeros(event)" value="<%= request.getAttribute("postalDom")%>" id="codpostal" name="postalDom" placeholder="C&oacute;digo postal"></td>
                                </tr>
                            </table>
                                 
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" onclick="validacionRegistraCliente()" style="background-color: #9F150D" class="btn btn-danger">Aceptar</button>
              </div>
            </div>
          </div>
        </div>
                               
        <div id="tmpModal"></div>
        
    <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../../js/Ventas/VenGeneral.js"></script>
    <script src="../../js/Ventas/VenValidaciones.js"></script>
    
    </body>
</html>
