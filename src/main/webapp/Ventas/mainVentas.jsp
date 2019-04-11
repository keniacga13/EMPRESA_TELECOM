<%-- 
    Document   : mainVentas
    Created on : 07-may-2018, 1:44:17
    Author     : ricardozaldivar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Ventas")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
%>
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
    <body style="width:100%; height:100%;">

        <!-- BARRA NAV -->
        <header style="z-index: 2"> 
            <nav class="navbar navbar-expand-lg navbar-light menu" style="background-color: #9F150D;">
                <a class="navbar-brand" style="color: white;" href="#">Ventas <span class="sr-only">(current)</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span></button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="clientes.jsp" style="color: white"> Clientes</a>
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
                                <a class="dropdown-item" href="ventaParcialidades.jsp">Venta en parcialidades</a>
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

            <center>
                <div class="col-lg-8 col-md-8 col-sm-5 col-xs-5 jumbotron">


                    <h1 class="display-4">M&oacute;dulo de Ventas</h1>
                    <p class="lead">(Nombre de Empresa)</p>
                    <hr class="my-4">
                    <p>Ventas, Reportes, facturas y administración de clientes.</p>
                    <a class="btn btn-primary btn-lg" href="ventaContado.jsp" style="background-color: #9F150D" role="button">Realiza una venta</a>

                </div>
            </center>


        </div>        

        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenGeneral.js"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>

    </body>
</html>
