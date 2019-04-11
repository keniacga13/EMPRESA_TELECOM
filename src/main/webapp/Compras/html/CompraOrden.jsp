<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Compras")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Compras</title>
        <meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>       
        <script src="../js/validaciones.js"></script>
    </head>
    <body>
        <!-- BARRA NAVEGACIÓN-->
        <!-- BARRA NAVEGACIÓN-->
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">
                <a class="navbar-brand text-white" ><h3>Compras</h3></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="com_index.jsp" style="color: white">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="com_proveedor.jsp" style="color: white">Proveedores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CompraOrden.jsp" style="color: white">Orden&nbsp;de&nbsp;compra</a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="enviarOrden.jsp" style="color: white">Enviar Orden&nbsp;de&nbsp;compra</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="com_listadecom.jsp" style="color: white">Lista&nbsp;de&nbsp;compras</a>
                        </li> 
                    </ul>
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="com_ayuda.jsp" target="_blank" style="color: white">Ayuda(?)</a>
                        </li>     
                        <li class="nav-item">
                            <a id="btn_gerencia" class="nav-link" href="../../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                            <script src="../../js/gerencia.js"></script>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../CerrarSesion"  style="color: white">Salir</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>

        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"> <!-- Seccion izquierda -->
                        
                        
                                   
                            
                            <span id="titulo"><span class="number">1</span>Requisición</span><br>
                            <div class="row">
                                <div class="table-responsive"><table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID&nbsp;Requisici&oacute;n</th>
                                                <th scope="col">Código&nbsp;del&nbsp;producto</th>
                                                <th scope="col">Cantidad</th>

                                            </tr>
                                        </thead>
                                        
                                        <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Compras.QuerysCompras"/>
                                        <%
                                        ResultSet rsTabla = interTabla.tablaReq();
                                        
                                        %>
                                        
                                        <tbody>
                                            <%
                                                while(rsTabla.next()){
                                            %>
                                            <tr id="modalInter">
                                                <td><%=rsTabla.getString(1)%></td>
                                                <td><%=rsTabla.getString(2)%></td>
                                                <td><%=rsTabla.getString(3)%></td>
                                                
                                                
                                            </tr>
                                            
                                            <%
                                            }
                                            %>
                                            
                                            
                                        </tbody>

                                    </table></div> </div>   
                        <hr>
                        
                        
                        
                        
                        <form method="POST" onsubmit="return vali_nuevoproducto();" name="eliminarReq" action="../../eliminarReq">
                        <div>
                                                
                        <input type="text" name="req_folio" placeholder="Folio de requisición a eliminar" id="req_folio" required/>
                        <center><input type="submit" value="Aceptada" style="background-color: #9F150D" name="acep" class="btn btn-danger"/></center>
                                                
                    </div>
                        </form>
                        
                        
                        
                        
                    </div> 
                                            
                    


                    <div style="background-color: #f4f7f8;" class="col-lg-5 col-md-5 col-sm-5 col-xs-11 form-style-5"><!-- Seccion central -->                          
                        <span id="titulo"><span class="number">3</span>Orden de compra</span>
                        
                        
                        <form method="POST" onsubmit="return vali_nuevoproducto();" name="OrdenCompra" action="../../OrdenCompra"> 
                            
                            <br>
                            <div class="row">
                                                               
                                <div class="form-style-5">
                    <div>
                    <table>
                       
                        <tr>
                            <td><fieldset>
                                    <legend>Código del producto</legend>
                            <input type="text" name="ord_codprod" id="ord_codprod" required>
                                </fieldset>
                            </td> 
                            
                              <td><fieldset>
                                    <legend>Cantidad</legend>
                            <input type="number" name="ord_cantidad" id="ord_cantidad" required>
                                </fieldset>
                            </td>
                           
                        </tr>
                        
                        <tr>
                            <td><fieldset>
                                    <legend>RFC&nbsp;proveedor</legend>
                            <input type="text" name="prov_rfc" id="prov_rfc" min="0" required>
                                </fieldset>
                            </td>
                            <td><fieldset><legend>Pago&nbsp;Total</legend>
                            <input type="text" name="ord_pagotot" id="ord_pagotot" min="0" required>
                                </fieldset>
                            </td>
                        </tr>
                       <tr>
                             <td><fieldset><legend>Fecha&nbsp;de&nbsp;orden</legend>
                            <input type="date" name="ord_fecha" id="canPed" min="0" required>
                                </fieldset>
                            </td>
                        </tr> 
                       
                    </table>
                        <button type="submit" style="background-color: #9F150D" name="requisitos" class="btn btn-danger">Ingresar</button>
                    </div>
                </div>
                            </div>      
 </form>
                    </div>
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"><!-- Seccion derecha -->
                        <form method="POST" onsubmit="return vali_nuevoproducto();">                        
                            <span id="titulo"><span class="number">2</span>Alerta productos mínimos</span><br>
                            
                            <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">M&aacute;ximo</th>
                                            <th scope="col">M&iacute;nimo</th>
                                            

                                        </tr>
                                    </thead>
                                    
                                    <jsp:useBean id="interTablaMm" scope="page" class="pw.sap.pojo.Compras.QuerysCompras"/>
                                    
                                    <%
                                    ResultSet rsTablaMm = interTablaMm.tablaProductosMm();
                                    %>
                                    
                                    <tbody>
                                        
                                        <%
                                        while(rsTablaMm.next()){
                                        %>
                                        <tr id="modalInter">
                                            <td><%=rsTablaMm.getString(1)%></td>
                                            <td><%=rsTablaMm.getString(2)%></td>
                                            <td><%=rsTablaMm.getString(3)%></td>
                                            <td><%=rsTablaMm.getString(4)%></td>
                                            
                                        </tr>
                                        
                                        <%
                                            }
                                        %>
                                    </tbody>

                                </table></div> 
                            <hr>
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="number" name="codproducto" placeholder="Código" id="codproducto" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <input type="submit" value="Hecho" style="background-color: #9F150D" name="hecho" class="btn btn-danger"/>
                                </div> 

                            </div>
                        </form>
                    </div>    
                </div>
            </div> 
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>
