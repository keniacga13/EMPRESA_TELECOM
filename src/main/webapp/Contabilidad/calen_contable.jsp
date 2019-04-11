<%@page import="pw.sap.db.ConsultasGenerales"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="pw.sap.db.Conexion"%>
<%@page import="pw.sap.pojo.Contabilidad.Calen_Contable"%>
<%@page import="java.util.ArrayList"%>

<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Contabilidad")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../archivos/errorSesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Contabilidad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/estilos.css" type="text/css">
        <link href="../css/laterales.css" rel="stylesheet" type="text/css"/>
        <link href="../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../js/Contabilidad/validacion.js" type="text/javascript"></script>
        <script src="../js/Contabilidad/modales.js"    type="text/javascript"></script>
    </head>
    <body>
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">
                <a class="navbar-brand text-white" href="ct_index.jsp">Contabilidad</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white color" href="#" id="catalogos" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Cat&aacute;logos
                            </a>
                            <div class="dropdown-menu" id="submenu" >
                                <a class="nav-link text-white color" id="calenContable" href="calen_contable.jsp">Calendario contable</a>
                                <a class="nav-link text-white color" id="planCuentas" href="plan_cuentas.jsp">Plan de cuentas</a>                    
                                <a class="nav-link text-white color" id="grupoPlanCuentas" href="grupo_plan_cuentas.jsp">Grupo plan de cuentas</a>
                            </div>
                        </li>              
                        <li class="nav-item">
                            <a class="nav-link text-white color" id="impuestos" href="ct_impuestos.jsp">Impuestos</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Libros
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_libro_diario.jsp">Libro Diario<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_libro_mayor.jsp">Libro Mayor</a>
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Movimientos
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="asientos_conta.jsp">Asientos Contables<span class="sr-only">(current)</span></a>                        
                            </div>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle color" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Consultas
                            </a>
                            <div class="dropdown-menu" id="submenu">
                                <a class="nav-link text-white color" href="ct_con_plan_cuentas.jsp">Plan de cuentas<span class="sr-only">(current)</span></a>
                                <a class="nav-link text-white color" href="ct_resultados.jsp">Estado de resultados</a>
                            </div>
                        </li>
                        <li class="nav-item">                            
                             <a id="btn_gerencia" class="nav-link color" href="../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                             <script src="../js/gerencia.js"></script>
                        </li>
                    </ul>
                  
                    <form class="form-inline my-2 my-lg-0" action="../CerrarSesion" method="POST">                
                        <button class="btn barra text-white my-2 my-sm-0" id="cerrarSesion" type="submit">Cerrar Sesi&oacute;n</button>
                    </form>
                </div>
            </nav>
        </header>
        <div id="principal">
            <div class="container-fluid">
                <div class="row">
                    <br>
                </div>
                <div class="row">
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-12 col-xs-12"> <!-- Seccion izquierda -->
                        <div class="form-style-5">
                            <form onsubmit="return validanumero('clave');" action="../CalenContable" method="POST"> 
                                <span id="titulo"><span class="number">1</span>Ingresa la clave a buscar</span>                            
                                <div class="row">
                                    <div class="col-lg-8 col-md-12 col-sm-8 col-xs-8">
                                        <input type="text" id="clave" name="clave" placeholder="Clave">    
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <input id="buscar" name="buscar" type="submit" value="Buscar">
                                    </div>                             
                                </div>
                            </form>
                            <form action="calen_contable.jsp" method="POST">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <input id="buscar" name="general" type="submit" value="Consulta General">
                                    </div> 
                            </form>
                            <br>
                            <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                        <button id="btn-cc-add" type="button" class="btn btn-light" onclick="agregaCCmodal()">Agregar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-cc-edit" type="button" class="btn btn-light" onclick="location.href='calen_contable_edita.jsp'">Editar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-cc-del" type="button" class="btn btn-light" onclick="eliminaCCmodal()">Eliminar</button>
                                    </div>
                            </div>                            
                        </div> 
                    </div>
                    <div id="cont-central" class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive" id="cambios">
                            <table class="table table-bordered table-responsive">
                                <tr>                                    
                                    <th>Clave</th>
                                    <th>Periodo</th>
                                    <th>Fecha inicio</th>
                                    <th>Fecha final</th>
                                    <th>Status</th>
                                </tr>                                
                                    <%
                                        LinkedList<Calen_Contable> lista =ConsultasGenerales.consultaGeneral();
                                        for (int i=0;i<lista.size();i++)
                                        {
                                           out.println("<tr>");                               
                                           out.println("<td>"+lista.get(i).getClave()+"</td>");
                                           out.println("<td>"+lista.get(i).getPeriodo()+"</td>");
                                           out.println("<td>"+lista.get(i).getFechaini()+"</td>");
                                           out.println("<td>"+lista.get(i).getFechafin()+"</td>");
                                           out.println("<td>"+lista.get(i).getStatus()+"</td>");
                                           out.println("</tr>");
                                        }
                                    %>
                                                                        
                            </table>    
                        </div>
                    </div>
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->
                        <table style="width:100%;height:100%;">                                        
                            <tr><td colspan="2">Informaci&oacute;n de la empresa</td></tr>
                            <tr><td colspan="2"><img src="" alt="logo de la empresa"></td></tr>
                        </table>
                    </div>    
                </div>



                <!-- Modal AGREGAR CALENDARIO CONTABLE-->
                <div class="modal fade" id="agregacc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Agregar Calendario Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form  autocomplete="off" onsubmit="return calencontaagregar();" method="post" action="../AgregaCalen">
                                        <div class="row form-style-5">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 100%; height: 30px;text-align: center;" type="text" id="nagregaclave" name="nclave" placeholder="001" /></span>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 18px">Periodo: </span><span class="idemp">
                                                    <select id="periodo" name="periodo">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                            <option value="2018">2018</option>
                                                            <option value="2019">2019</option>
                                                            <option value="2020">2020</option>
                                                            <option value="2021">2021</option>
                                                            <option value="2022">2022</option>
                                                            <option value="2023">2023</option>
                                                            <option value="2024">2024</option>
                                                            <option value="2025">2025</option>
                                                        </optgroup>
                                                    </select> 
                                                </span>
                                            </div>    
                                        </div>
                                        <div class="row form-style-5">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 18px">Fecha Inicial: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fechaini" name="fechaini"/></span>  <br>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 18px">Fecha Final: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fechafin" name="fechafin" /></span>  <br>
                                            </div>    
                                        </div>
                                        <div class="row form-style-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <span style="font-size: 18px">Estatus: </span><span class="idemp">
                                                    <select id="estado" name="estado">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                            <option value="abierto">Abierto</option>
                                                            <option value="bloqueado">Bloqueado</option>
                                                            <option value="cerrado">Cerrado</option>
                                                            <option value="transportado">Transportado</option>
                                                        </optgroup>
                                                    </select> 
                                                </span>
                                            </div>    
                                        </div>
                                        <div class="modal-footer">
                                            <center>
                                                <input id="guardar" type="submit" value="Guardar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                            </center>    
                                        </div>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal EDITAR CALENDARIO CONTABLE-->

                <div class="modal fade" id="editacc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Editar Calendario Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form method="post" onsubmit="return calencontaeditar();" action="../EditaCalen">

                                        <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" id="neditaclave" placeholder="001"/></span><br>

                                        <span style="font-size: 18px">Periodo: </span><span class="idemp">
                                            <select id="CalEditperiodo" name="periodo">
                                                <optgroup>
                                                    <option value="x">Seleccione...</option>
                                                    <option value="2018">2018</option>
                                                    <option value="2019">2019</option>
                                                    <option value="2020">2020</option>
                                                    <option value="2021">2021</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2024">2024</option>
                                                    <option value="2025">2025</option>
                                                </optgroup>
                                            </select> 
                                        </span><br>

                                        <span style="font-size: 18px">Fecha Inicial: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="Editfechaini" /></span>  <br>

                                        <span style="font-size: 18px">Fecha Final: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="Editfechafin" /></span>  <br>

                                        <span style="font-size: 18px">Estatus: </span><span class="idemp">
                                            <select id="Editestado">
                                                <optgroup>
                                                    <option value="x">Seleccione...</option>
                                                    <option value="abierto">Abierto</option>
                                                    <option value="bloqueado">Bloqueado</option>
                                                    <option value="cerrado">Cerrado</option>
                                                    <option value="transportado">Transportado</option>
                                                </optgroup>
                                            </select> 
                                        </span><br>

                                        <center>
                                            <input id="guardar" type="submit" value="Aplicar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                        </center>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal ELIMINAR CALENDARIO CONTABLE-->

                <div class="modal fade" id="eliminacc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Eliminar Calendario Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form onsubmit="return calencontEliminar();" action="../CalenElimina" method="POST">
                                        <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nclave" id="neliminaclave" placeholder="001"/></span><br>
                                        <center><input id="eliminarCal" type="submit" value="Eliminar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                            <br></center>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div> 
        </div>
    </body>
</html>
