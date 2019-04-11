<%-- 
    Document   : pagoEfectivo
    Created on : 06-may-2018, 17:34:37
    Author     : ricardozaldivar
--%>

<%@page import="pw.sap.pojo.Ventas.VentaPorProducto"%>
<%@page import="java.util.ArrayList"%>
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
        <jsp:useBean id="inVentas" scope="page" class="pw.sap.pojo.Ventas.insertVentaPorProd"/>   
    <jsp:useBean id="insertVPP" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
    <script type="text/javascript">
            
    function validamodalapagoEfectivo(){
        var moneda = document.getElementById("job").selectedIndex;
        var efec=document.getElementById("efectivo").value;
        var tota=document.getElementById("total").value;

            //select group lista

        if( (moneda == null )) {
  
            alert("seleccione una moneda");
  
            return false;
        }else if(efec == "" || efec == null || efec.length == 0 || /^\s+$/.test(efec)){
            alert("Ingrese cantidad con la que se pagará")
            return false;
        }else{
              <%
              ArrayList<VentaPorProducto> vpp = inVentas.cargaVentas();
              boolean sw = insertVPP.insertVPP(vpp);
              if(sw){
                  %>
                  alert("VENTA CONCLUIDA");
                  $('#pagoTarjeta').modal('hide');
                  location.reload();
                  <%
              }else{
                  %>
                  alert("VENTA FALLIDA");
                  $('#pagoTarjeta').modal('hide');
                  location.reload();
                  <%
              }
              
              %>
        }

    }
            
    </script>
        <!-- Modal PAGAR EFECTIVO-->
        <div class="modal fade" id="pagoEfectivo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Pago</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form>
                            <span id="titulo"><span class="number">1</span>Datos de venta</span>
                            
                            
                                <br><br><span class="idemp">Subtotal</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" readonly="readonly" placeholder="$13,728.00"/></span>

                                <span class="idemp">IVA</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="IVA" readonly="readonly" placeholder="$2,196.48"/></span>

                                <span class="idemp">Descuento</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Descuento" readonly="readonly" placeholder="0%"/></span>

                                <span class="idemp">TOTAL</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" id="total" name="Total" readonly="readonly" placeholder="$15,924.48"/></span>
                                
                                <span id="titulo"><span class="number">2</span>Cobro</span><br><br>
                                <center>
                                <span class="idemp">Moneda</span><span class="idemp">
                                    <select id="job" name="field4" style="width: 150px">
                                    <optgroup label="Moneda">
                                          <option value="peso">Peso mexicano</option>
                                          <option value="dolar">D&oacute;lar</option>
                                          <option value="euro">Euro</option>
                                          <option value="libra">Libra</option>
                                    </optgroup>
                                    </select> 
                                </span>
                                <br>
                                <span class="idemp">Cantidad con la que se pagará:</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="efectivo" type="text" name="cantidadEfectivo" placeholder="$000.00"/></span>
                                </center>
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #9F150D" onclick="validamodalapagoEfectivo()" class="btn btn-danger">Realizar pago</button>
              </div>
            </div>
          </div>
        </div>
        
    <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../../js/Ventas/VenGeneral.js"></script>
    <script src="../../js/Ventas/VenValidaciones.js"></script>
    
    </body>
</html>
