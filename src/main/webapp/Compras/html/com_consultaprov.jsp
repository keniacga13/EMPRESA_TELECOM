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
                            <a class="nav-link" href="../../index.jsp"  style="color: white">Salir</a>
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
                        <form method="POST" action="com_consultaprov.jsp" onsubmit="return vali_almacen();">
                            <div id="titulo" class="col-12">
                                <span class="number">1</span>B&uacute;squeda de<br>proveedor por estado</div>
                            <select id="zona" name="estado">
                                 <optgroup label="Estado">
                                    <option value="@">Seleccione una estado</option>
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
                                    <option value="Estado De Mexico">Estado de Mexico</option>
                                    <option value="Guanajuato">Guanajuato </option>
                                    <option value="Guerrero">Guerrero </option>
                                    <option value="Hidalgo">Hidalgo </option>
                                    <option value="Jalisco">Jalisco </option>
                                    <option value="Michoacan">Michoacán </option>
                                    <option value="Morelos">Morelos </option>
                                    <option value="Nayarit">Nayarit </option>
                                    <option value="Nuevo Leon">Nuevo León </option>
                                    <option value="Oaxaca">Oaxaca </option>
                                    <option value="Puebla">Puebla </option>
                                    <option value="Queretaro">Querétaro </option>
                                    <option value="Quintana Roo">Quintana Roo </option>
                                    <option value="San Luis Potosi;">San Luis Potosí </option>
                                    <option value="Sinaloa">Sinaloa </option>
                                    <option value="Sonora">Sonora </option>
                                    <option value="Tabasco">Tabasco </option>
                                    <option value="Tamaulipas">Tamaulipas </option>
                                    <option value="Tlaxcala">Tlaxcala </option>
                                    <option value="Veracruz">Veracruz </option>
                                    <option value="Yucatan">Yucatán </option>
                                    <option value="Zacatecas">Zacatecas</option>
                                </optgroup>
                            </select>
                            <span style="font-size: 18px">Ordenar&nbsp;por:</span>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="busprov" id="ord2" value="prov_nom_emp">
                                <label style="font-size: 18px" class="form-check-label" for="ord2">Nombre de la empresa</label>
                                <input class="form-check-input" type="radio" name="busprov" id="ord3" value="prov_rfc">
                                <label style="font-size: 18px" class="form-check-label" for="ord3">RFC</label>
                                <input class="form-check-input" type="radio" name="busprov" id="ord4" value="prov_nom_cont">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">Nomdre del contacto</label>
                                <input class="form-check-input" type="radio" name="busprov" id="ord4" value="prov_muni">
                                <label style="font-size: 18px" class="form-check-label" for="ord4">Municipio</label>
                            </div>
                            <!--<span style="font-size: 18px">Solo&nbsp;mostrar:</span>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord5" value="empresa">
                                <label style="font-size: 18px" class="form-check-label" for="ord5">Nombre de la empresa</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord6" value="RFC">
                                <label style="font-size: 18px" class="form-check-label" for="ord6">RFC</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord7" value="producto">
                                <label style="font-size: 18px" class="form-check-label" for="ord7">Producto</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord8" value="correo">
                                <label style="font-size: 18px" class="form-check-label" for="ord8">Correo</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord9" value="telefono">
                                <label style="font-size: 18px" class="form-check-label" for="ord9">Teléfono</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord9" value="estado">
                                <label style="font-size: 18px" class="form-check-label" for="ord9">Estado</label>
                            </div>-->
                            <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                            <br>
                        </form>
                        <form method="POST" action="com_consultaprovesp.jsp" onsubmit="return vali_rfc();">
                            <span id="titulo"><span class="number">2</span>B&uacute;squeda&nbsp;por<br>RFC del proveedor</span>
                            <br><br>
                            <input type="text" name="frc" placeholder="RFC" id="rfc" required>

                            <!--<span style="font-size: 18px">Solo&nbsp;mostrar:</span>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord5" value="proveedor">
                                <label style="font-size: 18px" class="form-check-label" for="ord5">Nombre de la empresa</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord6" value="estado">
                                <label style="font-size: 18px" class="form-check-label" for="ord6">Estado</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord7" value="producto">
                                <label style="font-size: 18px" class="form-check-label" for="ord7">Producto</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord8" value="correo">
                                <label style="font-size: 18px" class="form-check-label" for="ord8">Correo</label>
                                <input class="form-check-input" type="checkbox" name="busprov" id="ord9" value="telefono">
                                <label style="font-size: 18px" class="form-check-label" for="ord9">Teléfono</label>
                            </div>-->
                            <center><input type="submit" value="Consultar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                            
                        </form>
                        <br>
                        <form method="POST" action="../../eliminarprov">
                            <span id="titulo"><span class="number">3</span>Eliminar por<br>RFC del proveedor</span>
                            <br><br>
                            <input type="text" name="rfc" placeholder="RFC" id="rfc" required>
                        <br> <center><input type="submit" value="Eliminar" style="background-color: #9F150D" name="Buscar" class="btn btn-danger"></center>
                        </form>
                    </div>



                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->  
                              <form method="POST" action="../../reporteProveedores" target="_blank">
                            <div class="table-responsive"><table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">RFC</th>
                                            <th scope="col">Nombre empresa</th>
                                            <th scope="col">Nombre contacto</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Teléfono</th>
                                            <th scope="col">Estado</th>
                                            <th scope="col">Municipio</th>
                                            <th scope="col">CP</th>
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Compras.QuerysCompras"/>
                                    <%
                                        String ordenar = request.getParameter("busprov");
                                        String buscar = request.getParameter("estado");
                                        ResultSet rsTabla = interTabla.consultaProvOrdenby(ordenar,buscar);

                                    %> 
                                    <tbody>
                                        <%
                                            while (rsTabla.next()) {
                                        %>
                                        <tr id="modalInter">
                                            <td><%=rsTabla.getString(1)%></td>
                                            <td><%=rsTabla.getString(2)%></td>
                                            <td><%=rsTabla.getString(3)%></td>
                                            <td><%=rsTabla.getString(4)%></td>
                                            <td><%=rsTabla.getString(5)%></td>
                                            <td><%=rsTabla.getString(6)%></td>
                                            <td><%=rsTabla.getString(7)%></td>
                                            <td><%=rsTabla.getString(8)%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table></div> 
                                    <br>
                            <center><input type="submit" value="Generar PDF" style="background-color: #9F150D" name="imprimir" class="btn btn-danger">
                                <input type="submit" value="Generar Excel" style="background-color: #9F150D" name="imprimir" class="btn btn-danger"></center>

                        </form>  
                    </div>

                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 form-style-5"><!-- Seccion derecha -->
                        <form method="POST" action="../../proveedor" onsubmit="return vali_nuevoproveedor();">

                            <span id="titulo"><span class="number">4</span>Agregar<br>nuevo proveedor</span><br>
                            <br>
                            <input  type="text" name="nuevo_rfc" placeholder="RFC" id="nuevo_rfc" required>                             
                            <input  type="text" name="nuevo_nomemp" placeholder="Nombre de la empresa" id="nuevo_nomemp" required>
                            <input  type="text" name="nuevo_nomenc" placeholder="Nombre encargado" id="nuevo_nomenc" required>
                            <input  type="text" name="nuevo_correo" placeholder="Correo" id="nuevo_correo" required>
                            <input  type="number" name="nuevo_tel" placeholder="Teléfono" id="nuevo_tel" required>
                            <select id="nuevo_estado" name="nuevo_estado">
                                  <optgroup label="Estado">
                                    <option value="@">Seleccione una estado</option>
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
                                    <option value="Estado De Mexico">Estado de Mexico</option>
                                    <option value="Guanajuato">Guanajuato </option>
                                    <option value="Guerrero">Guerrero </option>
                                    <option value="Hidalgo">Hidalgo </option>
                                    <option value="Jalisco">Jalisco </option>
                                    <option value="Michoacan">Michoacán </option>
                                    <option value="Morelos">Morelos </option>
                                    <option value="Nayarit">Nayarit </option>
                                    <option value="Nuevo Leon">Nuevo León </option>
                                    <option value="Oaxaca">Oaxaca </option>
                                    <option value="Puebla">Puebla </option>
                                    <option value="Queretaro">Querétaro </option>
                                    <option value="Quintana Roo">Quintana Roo </option>
                                    <option value="San Luis Potosi;">San Luis Potosí </option>
                                    <option value="Sinaloa">Sinaloa </option>
                                    <option value="Sonora">Sonora </option>
                                    <option value="Tabasco">Tabasco </option>
                                    <option value="Tamaulipas">Tamaulipas </option>
                                    <option value="Tlaxcala">Tlaxcala </option>
                                    <option value="Veracruz">Veracruz </option>
                                    <option value="Yucatan">Yucatán </option>
                                    <option value="Zacatecas">Zacatecas</option>
                                </optgroup>
                            </select>
                            <input  type="text" name="minicipio_prov" placeholder="Municipio" id="minicipio_prov" required>
                            <input  type="number" name="nuevo_cp" placeholder="Código Postal" id="nuevo_cp" required>
                            <center><input type="submit" value="Agregar" style="background-color: #9F150D" name="nuevo" class="btn btn-danger"></center>                       

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
