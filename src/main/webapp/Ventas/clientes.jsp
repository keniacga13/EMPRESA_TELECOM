
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
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
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Ventas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/VenEstilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/VenLaterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/VenTablacliente.css">





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
                            <a class="nav-link" href="#" style="color: white"> Clientes <span class="sr-only">(current)</span></a>
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
                    <form class="form-inline my-2 my-lg-0">
                        <select class="form-control" id="tipoBusqueda">
                            <optgroup label="Elige tipo">
                                <option value="select">Selecciona</option>
                                <option value="id">Por ID</option>
                                <option value="nombre">Por nombre</option>
                                <option value="rfc">Por RFC</option>
                                <option value="estado">Por Estado</option>
                                <option value="municipio">Por Municipio</option>  
                            </optgroup>
                        </select>&nbsp;&nbsp;
                        <input class="form-control mr-sm-2" type="search" id="busc" placeholder="Buscar" aria-label="Search">
                        <button class="btn btn-outline-dark" style="color: white" onclick="buscar()" type="submit">Buscar</button>

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
                <!-- Seccion izquierda -->	    
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">


                    <div class="form-style-5">
                        <form onsubmit="return validaRegistraCliente();" action="../Clientes" method="POST">

                            <span id="titulo"><span class="number">1</span>Registra cliente</span><br>
                            <br><input type="text" onkeypress="return soloLetras(event)" id="nombreEmp" name="nomEmp" placeholder="Nombre de la empresa">
                            <input type="text" id="rfcEmp" name="rfcEmp" placeholder="RFC de la empresa">
                            <center><h4>Domicilio</h4></center><br>
                            <select id="estado" name="estadoDom">
                                <optgroup label="Estados">
                                    <option value="select">Selecciona</option>
                                    <option value=”Aguascalientes">Aguascalientes</option>
                                    <option value="Baja California">Baja California </option>
                                    <option value="Baja California Sur">Baja California Sur </option>
                                    <option value="Campeche">Campeche </option>
                                    <option value="Chiapas">Chiapas </option>
                                    <option value="Chihuahua">Chihuahua </option>
                                    <option value="Coahuila">Coahuila </option>
                                    <option value="Colima">Colima </option>
                                    <option value="Distrito Federal">Distrito Federal</option>
                                    <option value="Durango">Durango </option>
                                    <option value="Estado de M&eacute;xico">Estado de México </option>
                                    <option value="Guanajuato">Guanajuato </option>
                                    <option value="Guerrero">Guerrero </option>
                                    <option value="Hidalgo">Hidalgo </option>
                                    <option value="Jalisco">Jalisco </option>
                                    <option value="Michoac&aacute;n">Michoacán </option>
                                    <option value="Morelos">Morelos </option>
                                    <option value="Nayarit">Nayarit </option>
                                    <option value="Nuevo Le&oacute;n">Nuevo León </option>
                                    <option value="Oaxaca">Oaxaca </option>
                                    <option value="Puebla">Puebla </option>
                                    <option value="Quer&eacute;taro">Querétaro </option>
                                    <option value="Quintana Roo">Quintana Roo </option>
                                    <option value="San Luis Potos&iacute;">San Luis Potosí </option>
                                    <option value="Sinaloa">Sinaloa </option>
                                    <option value="Sonora">Sonora </option>
                                    <option value="Tabasco">Tabasco </option>
                                    <option value="Tamaulipas">Tamaulipas </option>
                                    <option value="Tlaxcala">Tlaxcala </option>
                                    <option value="Veracruz">Veracruz </option>
                                    <option value="Yucat&aacute;n">Yucatán </option>
                                    <option value="Zacatecas">Zacatecas</option>
                                </optgroup>
                            </select> 
                            <input type="text" onkeypress="return soloLetras(event)" id="municipioEmp" name="municipioDom" placeholder="Municipio">
                            <input type="text" id="calleEmp" name="calleDom" placeholder="Calle y n&uacute;mero">
                            <input type="text" onkeypress="return SoloNumeros(event)" id="codpostal" name="postalDom" placeholder="C&oacute;digo postal">
                            <!--<center><h4>Intermediario</h4></center><br>
                            <input type="text" onkeypress="return soloLetras(event)" id="nombreintermediario" name="nombreInt" placeholder="Nombre">
                            <input type="text" onkeypress="return soloLetras(event)" id="apellidointermediario" name="apellInt" placeholder="Apellidos">
                            <input type="text" id="telefonointermediario" name="telInt" placeholder="N&uacute;mero de tel&eacute;fono">
                            <input type="text" id="correointermediario" name="correoInt" placeholder="Correo electr&oacute;nico">-->
                            <center><button type="submit" style="background-color: #9F150D" name="registrar" class="btn btn-danger">Registrar</button></center>

                        </form>
                    </div>

                </div>


                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID_Cliente</th>
                                    <th scope="col">Empresa</th>
                                    <th scope="col">RFC</th>
                                    <th scope="col">Nom. Intermediario</th>
                                    <th scope="col">Apellidos Intermediario</th>
                                    <th scope="col">Teléfono</th>
                                    <th scope="col">Correo electrónico</th>
                                </tr>
                            </thead>
                            <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <%
                                ResultSet rsTabla = interTabla.tablaCliente(); 

                            %> 
                            <tbody>
                                    <%
                                        while(rsTabla.next()){
                                    %>
                                <tr id="modalInter">
                                    <td><%=rsTabla.getString(1)%></td>
                                    <td><%=rsTabla.getString(2)%></td>
                                    <td><%=rsTabla.getString(3)%></td>
                                    <td><%=rsTabla.getString(4)%></td>
                                    <td><%=rsTabla.getString(5)%></td>
                                    <td><%=rsTabla.getString(6)%></td>
                                    <td><%=rsTabla.getString(7)%></td>
                                </tr>
                                    <%
                                        }
                                    %>
                            </tbody>
                        </table>
                    </div> 

                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->
                    <div class="form-style-5">

                        
                        <form method="POST">
                            <jsp:useBean id="idClient" scope="page" class="pw.sap.pojo.Ventas.QuerysVentas"/>
                            <%
                                ResultSet rs = idClient.consultarIDEMP(); 

                            %>    
                            <span id="titulo"><span class="number">2</span>Registra intermediario</span><br>
                            <br><span class="idemp"><input type="text" name="IDEmpre" placeholder="ID Empresa" id="IDCliente"></span>
                            <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><button type="submit" onclick="validaIDCliente(); this.form.action = '../ClienteID'" name="cargar" style="background-color: #9F150D" class="btn btn-danger">Cargar</button><br>
                            <br><select id="eligeEmpre" name="nombreEmp">
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
 
                        
                            <input type="text" onkeypress="return soloLetras(event)" id="nombreInter2" name="nombreInt" placeholder="Nombre">
                            <input type="text" onkeypress="return soloLetras(event)" id="apellidoInter2" name="apellInt" placeholder="Apellidos">
                            <input type="text" id="telefonoInter2" name="telInt" placeholder="N&uacute;mero de tel&eacute;fono">
                            <input type="text" id="correoInter2" name="correoInt" placeholder="Correo electr&oacute;nico">
                            <center><button type="submit" name="registrar2" onclick="validaRegistraInterm(); this.form.action = '../Interm'" style="background-color: #9F150D" class="btn btn-danger">Registrar</button></center>                       


                        </form>
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

    </body>
</html>
