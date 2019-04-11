<%-- 
    Document   : pagoTarjeta
    Created on : 07-may-2018, 1:28:53
    Author     : ricardozaldivar
--%>

<%@page import="pw.sap.pojo.Ventas.VentaPorProducto"%>
<%@page import="java.util.ArrayList"%>
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
    <jsp:useBean id="inVentas" scope="page" class="pw.sap.pojo.Ventas.insertVentaPorProd"/>   
    <jsp:useBean id="insertVPP" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
        <script type="text/javascript">
            function validamodalapagotarjeta(){

        
    var tar=document.getElementById("tarjeta").value;

    var me=document.getElementById("mes").value;
    var anio=document.getElementById("año").value;
    var cods=document.getElementById("codseguridad").value;
        var nomtar=document.getElementById("nomtar").value;
         var Max_nomtar = 64;
        var lengthnomtar = document.getElementById("nomtar").value.length;
    
 if(tar == "" || tar == null || tar.length == 0 || /^\s+$/.test(tar)){
       alert("ingrese su numero de tarjeta")     
        }else  if( !(/^\d{16}$/.test(tar)) ) {
            alert("ingrese los 16 digitos de su tarjeta: ejemplo 1234567891234567");
          return false;
        }else if(me == "" || me == null || me.length == 0 || /^\s+$/.test(me)){
       alert("ingrese un mes")     
        }else  if( !(/^\d{2}$/.test(me)) ) {
            alert("ingrese los 2 dijitos del mes: ejemplo 12");
          return false;
        }else if(me<1 || me >12){
            alert("ingrese un mes entre 1  y 12");
            return false;
        }else if(anio == "" || anio == null ||anio.length == 0 || /^\s+$/.test(anio)){
       alert("ingrese un año")     
        }else  if( !(/^\d{4}$/.test(anio)) ) {
            alert("ingrese los 4 digitos del año: ejemplo 2018");
          return false;
        }else if(anio<2018 || anio>2050){
            alert("ingrese un año que sea del actual al 2050");
            return false;
        }else if(cods == "" || cods == null || cods.length == 0 || /^\s+$/.test(cods)){
       alert("ingrese un año")     
        }else  if( !(/^\d{3}$/.test(cods)) ) {
            alert("ingrese los 3 caracteres del codigo: ejemplo 218");
          return false;
        }else if(nomtar == "" || nomtar == null || nomtar.length == 0 || /^\s+$/.test(nomtar)){
            alert("ingrese un nombre de la tarjeta");
            return false;
        } else if (lengthnomtar > Max_nomtar) {
            alert("el numero de caracteres maximo son 60");
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
        
        <!-- Modal PAGAR TARJETA-->
        <div class="modal fade" id="pagoTarjeta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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

                                <span class="idemp">TOTAL</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Total" readonly="readonly" placeholder="$15,924.48"/></span>
                                
                                <span id="titulo"><span class="number">2</span>Cobro</span><br><br>
                               

                                <span style="width: 100px">N&uacute;mero de tarjeta&nbsp;&nbsp;</span><span class="idemp"><input style="width: 200px; height: 30px;text-align: center;" id="tarjeta" type="text" name="noTarjeta" placeholder="xxxx-xxxx-xxxx-xxxx"/></span>
                                 <center>
                                <br>
                                <span class="idemp">Mes de expiraci&oacute;n</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;"  id="mes" type="text" maxlength="2" onkeypress="SoloNumeros(event)" name="MesTajeta" min="1" max="12" placeholder="MM"/></span>
                                <span class="idemp">Año de expiraci&oacute;n</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="año" type="text" maxlength="4" onkeypress="SoloNumeros(event)" min="2018" max="2050" name="anioTarjeta" placeholder="AAAA"/></span>
                                <br><br>
                                <span class="idemp">C&oacute;digo de seguridad</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" id="codseguridad" type="text" name="codSeguridad" placeholder="CVC"/></span> <br><br>
                                 </center>
                                <span style="width: 100px">Nombre de tarjeta&nbsp;&nbsp;</span><span class="idemp"><input style="width: 200px; height: 30px;text-align: center;" onkeypress="return soloLetras(event)" id="nomtar" type="text" name="nomTarjeta" placeholder="Nombre"/></span>                               
                               
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                <button type="button" style="background-color: #9F150D" onclick="validamodalapagotarjeta()" class="btn btn-danger">Realizar pago</button>
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
