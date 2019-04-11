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
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>       
        <script src="../js/validaciones.js"></script>
    </head>
    <body>
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
                                            <form method="POST" action="com_listadecom.jsp" onsubmit="return vali_almacen();">
                                                <div id="titulo" class="col-12">
                                <span class="number">1</span>B&uacute;squeda de<br>compra por forma de pago</div>
                                <select id="titulo" name="estado">
                                    <optgroup label="list_pago">
                                        <option value="@">Seleccione una forma de pago</option>
                                    <option value=”Aguascalientes">efectivo</option>
                                    <option value="Baja California">electronico</option>
                                        
                                    </optgroup>
                                    
                                </select>                                
                                                <span style="font-size: 18px">Ordenar&nbsp;por:</span>
                                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="list_folio" id="ord2" value="list_folio">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">folio de compra</label>
                                <input class="form-check-input" type="radio" name="ord_folio" id="ord3" value="ord_folio">
                                <label style="font-size: 18px" class="form-check-label" for="ord3">folio de orden de compra</label>
                                <input class="form-check-input" type="radio" name="id_producto" id="ord4" value="id_producto">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">serial del producto</label>
                                <input class="form-check-input" type="radio" name="prov_rfc" id="ord4" value="prov_rfc">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">RFC de proveedor</label>
                            </div>
                                <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                            <br>
                                            </form>
                                            
                                        </div>
                                        
                    <!-- Seccion central -->                          
                    <div style="background-color: #f4f7f8;" class="col-lg-5 col-md-5 col-sm-5 col-xs-11 form-style-5">  <!-- Seccion tabla resultados de busqueda -->
            
            <span id="titulo"><span class="number">T</span>Lista&nbsp;completa&nbsp;de&nbsp;compras</span>
            
            <div class="row">
                <div class="table-responsive"><table class="table table-striped">
                    
                        <thead>
                            <tr>
                                <th scope="col">folio</th>
                                <th scope="col">forma&nbsp;de&nbsp;pago</th>
                                <th scope="col">ID&nbsp;producto</th>
                                <th scope="col">RFC&nbsp;proveedor</th>
                                <th scope="col">Fecha&nbsp;de&nbsp;compra</th>
                                
                            </tr>
                            
                        </thead>
                        <jsp:useBean id="interTablaLC" scope="page" class="pw.sap.pojo.Compras.QuerysCompras"/>
                                        <%
                                        ResultSet rsTablaLC = interTablaLC.tablaLC();
                                        
                                        %>
                                        
                                        <tbody>
                                         <%
                                                while(rsTablaLC.next()){
                                            %>   
                                            
                                            
                                            <tr id="modalInter">
                                                <td><%=rsTablaLC.getString(1)%></td>
                                                <td><%=rsTablaLC.getString(2)%></td>
                                                <td><%=rsTablaLC.getString(3)%></td>
                                                <td><%=rsTablaLC.getString(4)%></td>
                                                <td><%=rsTablaLC.getString(5)%></td>
                                                
                                                
                                            </tr>
                                            
                                            <%
                                            }
                                            %>
                                        </tbody>
                    </table></div>
                
                
            </div> 

                                        
                  
                </div>
                                        
                                        
            
        </div>
        </div>
        </div>
        

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>
