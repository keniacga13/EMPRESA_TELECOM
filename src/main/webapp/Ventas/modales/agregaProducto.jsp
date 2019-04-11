<%-- 
    Document   : agregaProducto
    Created on : 06-may-2018, 11:10:56
    Author     : ricardozaldivar
--%>

<%@page import="java.sql.ResultSet"%>
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
        
        <div class="modal fade" id="agregaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar producto</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form method="POST">
                            <span id="titulo"><span class="number">1</span>Añade</span>
                            
                            
                                <br><br><span>C&oacute;digo de producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" onkeypress="return searchKeyPress(event);" id="codprod" type="text" name="codprod" placeholder="###############"/></span>

                                <br><span >Cantidad:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" onkeypress="return cantOnPress(event);" id="cant" type="text" name="cant" placeholder="0"/></span>
                                <br><br>

                                <span id="titulo"><span class="number">2</span>Datos de producto</span>
                                <br><br>
                                <span id="nom">Nombre producto:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text"  name="nomProd" id="nomprod" readonly="readonly" placeholder="Nombre"/></span>
                                <br><br>
                                <span >Precio unitario:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="precioprod" id="precioprod" readonly="readonly" placeholder="$000.00"/></span>
                                <br><br>
                                <span>IVA:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="ivaprod" id="ivaprod" readonly="readonly" placeholder="$000.00"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                <span >Subtotal:&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="subtotal" id="subtotal" readonly="readonly" placeholder="$000.00"/></span>
                    </form>        
                    
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #9F150D" onclick="valAgrega() " class="btn btn-danger">Agregar</button>
              </div>
            </div>
          </div>
        </div> 
        
    <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../../js/Ventas/VenGeneral.js"></script>
    <script src="../../js/Ventas/VenValidaciones.js"></script>
    <script src="../../js/Ventas/muestraModales.js"></script>
    <script src="../../js/Ventas/ajaxFunctions.js"></script>

    </body>
</html>
