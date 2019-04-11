<%-- 
    Document   : eligeTipoReporte
    Created on : 07-may-2018, 1:33:58
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
        <div class="modal fade" id="eligeReporte" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Elige criterio de busqueda</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form>
                        
                            <table>
                            
                                <tr>
                                    <td>
                                        <select id="tipoBusqueda" name="tipoBusqueda" style="width: 50%">
                                        <optgroup label="Elige tipo">
                                            <option value="select">Selecciona</option>
                                            <option value=”id">Por ID</option>
                                            <option value="nombre">Por nombre</option>                                       
                                        </optgroup>
                                        </select>
                                        <span class="idemp"><input type="text" id="busc" name="busqueda" id="busqueda" placeholder="Ingrese"></span>
                                        <button type="button" name="cargar" style="background-color: #9F150D" onclick="buscar()" class="btn btn-danger">Cargar</button><br>
                                    </td>
                                </tr>
                            </table> 
                            
                                        <!-- Seccion central TABLA -->
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                          <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">RFC</th>
                                            <th scope="col">Listar</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td>cli0001</td>
                                            <td>Apple</td>
                                            <td>ZAPR101097HCL</td>
                                            <td>
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
                                                    <label class="form-check-label" for="defaultCheck1">
                                                      Elegir
                                                    </label>
                                                </div>
                                            </td>
                                          </tr>
                                        </tbody>
                                    </table>
                                </div> 


                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #9F150D" class="btn btn-danger">Cargar</button>
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
