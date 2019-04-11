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
                        <form method="POST" action="com_consultacompras.jsp" onsubmit="return vali_fecha();">
                            <div id="titulo" class="col-12">    
                                <span class="number">1</span>B&uacute;squeda de<br>compras por fecha</div>

                            <input style="text-align: center;" type="date" name="fechaC" id="fecha_com"/>
                            <span style="font-size: 18px">Ordenar&nbsp;por:</span>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="busprod" id="ord3" value="folio">
                                <label style="font-size: 18px" class="form-check-label" for="ord3">Folio</label>
                                <input class="form-check-input" type="radio" name="busprod" id="ord2" value="proveedor">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">Proveedor</label>                                
                                <input class="form-check-input" type="radio" name="busprod" id="ord4" value="pago">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">Pago Total</label>
                            </div>
                            <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                            <br>
                        </form>
                        <form method="POST" action="com_consultacompras.jsp" onsubmit="return vali_folio();">
                            <span id="titulo"><span class="number">2</span>B&uacute;squeda<br>por folio de compra</span>
                            <br><br>
                            <input type="number" name="codprod" placeholder="Folio" id="folio_com" required>
                            <span style="font-size: 18px">Mostrar:</span>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="busprod" id="ord1" value="fecha">
                                <label style="font-size: 18px" class="form-check-label" for="ord1">Fecha</label>
                                <input class="form-check-input" type="checkbox" name="cod_factura" id="ord2" value="factura">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">Código factura</label>
                                <input class="form-check-input" type="checkbox" name="busprod" id="ord2" value="proveedor">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">Proveedor</label>
                                <input class="form-check-input" type="checkbox" name="cantcom" id="ord2" value="cantidad">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">Cantidad</label>
                                <input class="form-check-input" type="checkbox" name="busprod" id="ord4" value="pago">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">Pago Total</label>
                            </div>
                            <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                        </form>
                    </div> 
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12"><!-- Seccion central -->   
                        <form method="POST" action="com_imprimir.jsp" target="_blank">
                            <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Folio</th>
                                            <th scope="col">C&oacute;digo factura</th>
                                            <th scope="col">Fecha</th>
                                            <th scope="col">Producto</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Proveedor</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">9843</th>
                                            <td>50789</td>
                                            <td>dd/mm/aa</td>
                                            <td>producto 2</td>
                                            <td>12</td>
                                            <td>Empresa1</td>
                                            <td>$345</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">9876</th>
                                            <td>12345</td>
                                            <td>dd/mm/aa</td>
                                            <td>producto 3</td>
                                            <td>2</td>
                                            <td>Empresa6</td>
                                            <td>$76</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2064</th>
                                            <td>98765</td>
                                            <td>dd/mm/aa</td>
                                            <td>producto 1</td>
                                            <td>25</td>
                                            <td>Empresa6</td>
                                            <td>$769</td>
                                        </tr>
                                    </tbody>
                                </table></div>             
                            <center><input type="submit" value="Generar PDF" style="background-color: #9F150D" name="imprimir" class="btn btn-danger">
                                <input type="submit" value="Generar Excel" style="background-color: #9F150D" name="imprimir" class="btn btn-danger"></center>
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
