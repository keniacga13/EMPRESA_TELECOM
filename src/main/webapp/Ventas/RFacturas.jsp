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
        <link rel="stylesheet" type="text/css" href="../css/VenTablareporteventas1.css">

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
                                <a class="dropdown-item" href="#">Facturas <span class="sr-only">(current)</span></a>
                                <a class="dropdown-item" href="verCotizaciones.jsp">Cotizaciones archivadas</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Cobros.jsp" style="color: white">Cobros</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" id="busc" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-outline-dark" onclick="buscar()" style="color: white" type="submit">Buscar</button>

                    </form>

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
                        <form>
                            <span id="titulo"><span class="number">1</span>Facturas</span><br><br>

                            <span style="font-size: 18px">Fecha de inicio</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" min="2017-01-01" type="date" id="fecha1" name="fechaIn" /></span><br>

                            <span style="font-size: 18px">Fecha de termino</span><br><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fecha2" name="fechaTerm" /></span><br><br>

                            <script>
                            document.getElementById('fecha2').value = new Date().toISOString().substring(0, 10);
                            </script>                               

                            <center>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportFacturas" id="report1" value="todasFactura" checked >
                                    <label style="font-size: 18px" class="form-check-label" for="report1">
                                        Todas las facturas
                                    </label>
                                </div>     
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="reportFacturas" id="report2" value="clientesFac">
                                    <label style="font-size: 18px" class="form-check-label" for="report2">
                                        Facturas por clientes
                                    </label>
                                </div> <br>

                                <button type="button" name="cargaFacturas" style="background-color: #9F150D" onclick="validaFechasReportes()" class="btn btn-danger">Cargar reporte</button>
                            </center>
                        </form>
                    </div>

                </div>


                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Folio de factura</th>
                                    <th scope="col">Fecha de expedici&oacute;n</th>
                                    <th scope="col">Cliente</th>
                                    <th scope="col">RFC de cliente</th>
                                    <th scope="col">Domicilio</th>
                                    <th scope="col">Forma de pago</th>
                                    <th scope="col">Subtotal</th>
                                    <th scope="col">IVA</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr onclick="window.location = 'EjemploFactura.pdf'">
                                    <td>fac42576</td>
                                    <td>22/Marzo/2018</td>
                                    <td>ITTOL</td>
                                    <td>ITTOL7507241H0</td>
                                    <td>Av. Tecnol&oacute;gico, S/N</td>
                                    <td>Pago en una sola exhibici&oacute;n</td>
                                    <td>$290,500.00</td>
                                    <td>$8,360.00</td>
                                    <td>$298,860.00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div> 

                </div>

            </div>

        </div>                

        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Ventas/VenValidaciones.js"></script>

    </body>
</html>
