<%@page import="pw.sap.servlets.Ventas.ListaProductos"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="nuevaTabla" scope="page" class="pw.sap.servlets.Ventas.ListaProductos"/>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Ventas")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Ventas</title>
        <meta charset="UTF-8">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTabla.css">
    </head>

    <body style="width:100%; height:100%;">

        <!-- BARRA NAV -->
        <header style="z-index: 2"> 
            <nav class="navbar navbar-expand-lg navbar-light menu" style="background-color: #9F150D;">
                <a class="navbar-brand" style="color: white;" href="mainVentas.jsp">Ventas</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="clientes.jsp" style="color: white"> Clientes </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cotizacion.jsp" style="color: white">Cotizaci&oacute;n</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Orden de venta
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="apartadoProducto.jsp">Apartar pedido</a>
                                <a class="dropdown-item" href="#">Venta en parcialidades <span class="sr-only">(current)</span></a>
                                <a class="dropdown-item" href="ventaContado.jsp">Venta neta</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Reportes
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="RVentasF.jsp">Reporte de ventas</a>
                                <a class="dropdown-item" href="RFacturas.jsp">Facturas</a>
                                <a class="dropdown-item" href="verCotizaciones.jsp">Cotizaciones archivadas</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Cobros.jsp" style="color: white">Cobros</a>
                        </li>
                    </ul>
                    <li class="nav-item">
                        <a class="nav-link" href="com_ayuda.jsp" target="_blank" style="color: white">Ayuda(?)</a>
                    </li>   
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../js/gerencia.js"></script>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../CerrarSesion" style="color: white">Salir</a>
                    </li>
                </div>
            </nav>
        </header>

        <!-- CONTENIDO-->   
        <div class="container-fluid contenido">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->


                    <div class="form-style-5">
                        <form method="post">
                            <jsp:useBean id="idClient" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <jsp:useBean id="idInter" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                             <jsp:useBean id="idEmp" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <%
                                ResultSet rs = idClient.consultarIDEMP(); 
                                ResultSet rss = idInter.consultarIDInterm();
                                ResultSet remp = idEmp.consultarEmpleado(request.getSession().getAttribute("usuario").hashCode());
                                ListaProductos.ventList.clear();
                                ListaProductos.subtotalTotal_ov = 0;
                                ListaProductos.totalIva_ov = 0;
                                ListaProductos.TOTAL_ov = 0;

                            %>  
                            <span id="titulo"><span class="number">1</span> Informaci&oacute;n de cliente</span><br>
                            <span class="idemp"><input type="text" id="IDCliente" name="IDCliente" placeholder="ID Cliente"></span>
                            <button type="button" name="cargar" onclick="validaIDCliente(); this.form.action = '../ClienteID'" style="background-color: #9F150D" class="btn btn-danger">Cargar</button><br>
                            <br><select id="nomEmp" name="nombreEmp">
                                <optgroup label="Empresa">
                                    <option value="emp1">Empresa</option>
                                    <%
                                        while(rs.next()){
                                    %>
                                    <option value="<%=rs.getString(1)%>"> <%=rs.getString(2)%> </option>
                                    <%
                                        }
                                    %>
                                </optgroup>
                            </select> 
                            <select id="nomInter" name="nombreEmp">
                                <optgroup label="Empresa">
                                    <option value="emp1">Intermediario</option>
                                    <%
                                        while(rss.next()){
                                    %>
                                    <option value="<%=rss.getString(1)%>"> <%=rss.getString(2)%> </option>
                                    <%
                                        }
                                    %>
                                </optgroup>
                            </select>

                                <span id="titulo"><span class="number">2</span><span id="tipo_venta">Venta en parcialidades</span></span><br>
                            <br><span>N&uacute;m. venta&nbsp;&nbsp;</span><br><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" readonly="readonly" placeholder="001"/></span><br>

                            <br><span style="font-size: 18px">Fecha de venta</span><br><span class="idemp"><input min="2010-01-01" style="width: 180px; height: 30px;text-align: center;" readonly="readonly" type="date" id="fecha1" name="fechaC" /></span><br>
                            <script>
                                document.getElementById('fecha1').value = new Date().toISOString().substring(0, 10);
                            </script>
                            <span style="font-size: 18px">Fecha de entrega</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fecha2" name="fechaC" /></span><br>    

                            <span id="titulo"><span class="number">3</span>Pago</span><br><br>

                            <span >Forma pago</span>

                            <select id="tipoPago" name="field4">
                                <optgroup label="Pago">
                                    <option value="select">Selecciona</option>
                                    <option value="efectivo">Efectivo</option>
                                    <option value="tarjeta">Tarjeta</option>
                                </optgroup>
                            </select>

                            <span>Parcialidad</span>

                            <select id="tipoParcial" name="field4">
                                <optgroup label="Parcialidad">
                                    <option value="selectPar">Selecciona</option>
                                    <option value="seisMeses">6 meses</option>
                                    <option value="doceMeses">12 meses</option>
                                    <option value="diesciochoMeses">18 meses</option>
                                    <option value="veiticuatroMeses">24 meses</option>
                                </optgroup>
                            </select>
                            <center>
                                <span >Pago inicial</span>
                                <span class="idemp">
                                    <input style="width: 110px; height: 30px;text-align: center;" readonly="readonly" placeholder="$000.00" type="text" name="Montot"/>
                                </span><br><br>
                                <span >Fecha pr&oacute;x. pago</span>
                                <span class="idemp">
                                    <input style="width: 110px; height: 30px;text-align: center;" readonly="readonly" placeholder="dd/mm/aaaa" type="text" name="Pagoin"/>
                                </span><br><br>

                                <span >Cargo por parcialidades</span>
                                <span class="idemp">
                                    <input style="width: 100px; height: 30px;text-align: center;" readonly="readonly" placeholder="$000.00" type="text" name="Totalp"/>
                                </span><br><br>

                                <span >Total a pagar &nbsp;&nbsp;</span>
                                <span class="idemp">
                                    <input style="width: 100px; height: 30px;text-align: center;" readonly="readonly" placeholder="$000.00" type="text" name="Totalp"/>
                                </span>
                            </center>

                        </form>
                    </div>

                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <div id="tablaProductos"></div>
                    </div> 

                </div>


                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->


                    <div class="form-style-5">
                        <form>

                            <span id="titulo"><span class="number">3</span>Vendedor</span><br> 
                             <% while(remp.next()){ %>
                            <br>ID VENDEDOR: <input type="text" name="nomVent" id="idVendedor" readonly="readonly" value="<%=request.getSession().getAttribute("usuario").hashCode()%>"></input> 
                            NOMBRE VENDEDOR<input type="text" name="nombreVent" readonly="readonly" placeholder="<%=remp.getString(1)%> <%=remp.getString(2)%>"></input> 
                            <% } %>
                            <center>
                                <button type="button" name="agregaProd" style="background-color: #9F150D" class="btn btn-danger" id="btnModal">Agregar producto</button><br>
                                <br><button type="button" name="EliminaProd" style="background-color: #9F150D" class="btn btn-danger">Eliminar producto</button><br>

                                <br><span id="titulo"><span class="number">4</span>Resultados</span><br>

                                <br><span >Subtotal&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Subtotal" id="subtotalOV" readonly="readonly" placeholder="$0000.00"/></span><br>

                                <br><span>IVA&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="IVA" id="totalIvaOV" readonly="readonly" placeholder="$0000.00"/></span>

                                <br><span>Descuento&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Descuento" readonly="readonly" placeholder="0%"/></span>

                                <br><span>TOTAL&nbsp;&nbsp;</span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="Total" id="totalOV" readonly="readonly" placeholder="$0000.00"/></span><br>


                                <br><button type="button" name="pagar" style="background-color: #9F150D" onclick="validaFechasPARCIAL()" class="btn btn-danger">Pagar</button> <button type="button" name="cancelar" id="cancelar" onclick="cancelar()" style="background-color: #9F150D" class="btn btn-danger">Cancelar</button>
                            </center>
                        </form>
                    </div>

                </div>
            </div>

        </div>               
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
        <div id="tmpModal"></div>

        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenGeneral.js"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>
        <script src="../js/Ventas/muestraModales.js"></script>
        <script src="../js/Ventas/ajaxFunctions.js"></script>
    </body>
</html>
