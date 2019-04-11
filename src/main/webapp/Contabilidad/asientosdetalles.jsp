<%@page import="pw.sap.pojo.Contabilidad.AsientoDetallado"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pw.sap.pojo.Contabilidad.AsientoGeneral"%>
<%@page import="pw.sap.pojo.Contabilidad.Modulos"%>
<%@page import="pw.sap.db.ConsultasGenerales"%>
<%@page import="pw.sap.pojo.Contabilidad.Calen_Contable"%>
<%@page import="java.util.LinkedList"%>
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
                            <form action="../Asientos" method="POST"> 
                                <span id="titulo"><span class="number">1</span>Busqueda por modulo</span>
                                <div class="row">
                                    <div class="col-lg-8 col-md-12 col-sm-8 col-xs-8">
                                        <!--<input type="text" id="clave" name="clave" placeholder="Clave" required="required">-->
                                        <select id="moduAs" name="modu">
                                                <optgroup>
                                                    <option value="x">Seleccione...</option>
                                                    <%
                                                        LinkedList<Modulos> mod =ConsultasGenerales.consultaModulos();
                                                        for (int i=0;i<mod.size();i++)
                                                        {

                                                           out.println("<option value='"+mod.get(i).getId_area()+"'>"+mod.get(i).getNombre_area()+"</option>");                                                                   

                                                        }
                                                    %>                                                                                                                                                                                                                                                
                                                </optgroup>
                                        </select>                                         
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <input id="buscar" name="buscar" type="submit" value="Buscar">
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                        <button id="btn-cc-add" type="button" class="btn btn-light" onclick="agregaAsiento()">Agregar</button>
                                    </div>                                                                    
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-cc-edit" type="button" class="btn btn-light" onclick="editaAsiento()">Editar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-cc-del" type="button" class="btn btn-light" onclick="eliminaAsiento()">Eliminar</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                        <button id="btn-cc-add" type="button" class="btn btn-danger" onclick="location.href='asientos_conta_detallado.jsp'">Continuar Captura</button>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                        <button id="btn-cc-add" type="button" class="btn btn-danger" onclick="location.href='asientosdetalles.jsp'">Consultar Asientos Detallados</button>
                                    </div>                
                                </div>
                            </form> 
                        </div> 
                    </div>
                    <div id="cont-central" class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <h1 class="text-center">Asientos contables detallados</h1>
                            <table class="table table-bordered">
                                <tr>
                                    <th>clave</th>
                                    <th>foliofac</th>
                                    <th>Descripci&oacute;n</th>
                                    <th>uuid</th>
                                    <th>fecha_fac</th>
                                    <th>cuenta</th>
                                    <th>monto</th>
                                </tr>
                                <%
                                        LinkedList<AsientoDetallado> asientod =ConsultasGenerales.consultaAsientoDetallado();
                                        for (int i=0;i<asientod.size();i++)
                                        {
                                           out.println("<tr>");                               
                                           out.println("<td>"+asientod.get(i).getClave()+"</td>");    
                                           out.println("<td>"+asientod.get(i).getFoliofac()+"</td>");
                                           out.println("<td>"+asientod.get(i).getDescripcion()+"</td>");
                                           out.println("<td>"+asientod.get(i).getFolio_fiscal()+"</td>");
                                           out.println("<td>"+asientod.get(i).getFecha_fac()+"</td>");
                                           out.println("<td>"+asientod.get(i).getCuenta()+"</td>");
                                           out.println("<td>"+asientod.get(i).getMonto()+"</td>");
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

                <!-- Modal AGREGAR ASIENTO CONTABLE-->
                <div class="modal fade" id="agregarasiento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Agregar Asiento Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form  autocomplete="off"  method="post" action="../AgregaAsientoGeneral" onsubmit="return AsientoAgr();">
                                        <!--<div class="row form-style-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">Clave: </span><span class="idemp"><input style="width: 250px; text-align: left;" type="text" id="claveAs"  /></span>                                               
                                            </div>    
                                        </div>-->
                                        <div class="row form-style-5">                                                                                        
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">
                                                    clave: 
                                                </span>
                                                <span class="idemp">
                                                    <input style="width: 180px; height: 30px;text-align: center;" type="text" id="claveasiento" name="claveasiento" />
                                                </span>
                                            </div>
                                        </div>
                                        <div class="row form-style-5">                                                                                        
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">Modulo: </span><span class="idemp">
                                                    <select id="moduAs" name="modu">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                            <%
                                                                LinkedList<Modulos> lista =ConsultasGenerales.consultaModulos();
                                                                for (int i=0;i<lista.size();i++)
                                                                {

                                                                   out.println("<option value='"+lista.get(i).getId_area()+"'>"+lista.get(i).getNombre_area()+"</option>");                                                                   

                                                                }
                                                            %>                                                                                                                                                                                                                                                
                                                        </optgroup>
                                                    </select> 
                                                </span>
                                            </div>                                                                                                   
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">                                               
                                                <span style="font-size: 16px">Tipo: </span><span class="idemp">
                                                    <select id="tipoasientoagr" name="tipoasiento">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                            <option value="ajustes">Ajustes</option>
                                                            <option value="compras">Compras</option>
                                                            <option value="diario">Diario</option>
                                                            <option value="egreso">Egreso</option>
                                                            <option value="ingreso">Ingreso</option>
                                                            <option value="ventas">Ventas</option>
                                                        </optgroup>
                                                    </select> 
                                                </span>
                                            </div>                                   
                                        </div>
                                        <div class="row form-style-5">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">Periodo: </span><span class="idemp">
                                                    <select id="periodoAs" name="periodo">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                        <%
                                                            LinkedList<Calen_Contable> perio =ConsultasGenerales.consultaPeriodoGeneral();
                                                            for (int i=0;i<perio.size();i++)
                                                            {
                                                               
                                                               out.println("<option value='"+perio.get(i).getId()+"'>"+perio.get(i).getClave()+"</option>");
                                                               
                                                            }
                                                        %>                                                            
                                                        </optgroup>
                                                    </select> 
                                                </span>                                                
                                            </div>    
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">Fecha de captura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fechacap" name="fechacap" /></span>
                                            </div>
                                            
                                        </div>                                        
                                        <div class="row form-style-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">Concepto: </span><span class="idemp"><textarea style="width: 220px; text-align: left;" id="concepto" name="concepto"></textarea></span>                                               
                                            </div>    
                                        </div>
                                        <div class="modal-footer">
                                            <center>
                                                <input id="guardar" type="submit" value="Guardar" style="background-color: #9F150D"  class="btn btn-danger"><br>
                                            </center>    
                                        </div>                   
                                    </form>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                                        

<!-- Modal continuar capturando detalles del ASIENTO contable-->
                <div class="modal fade" id="continuarasiento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Agregar Asiento Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form autocomplete="off"  method="post" action="asientos_conta.jsp" onsubmit="return AsientoAgr();">
                                        <h4 class="text-center">Detalles</h4>
                                        <div class="row form-style-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Fecha factura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="date" id="fechafac" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Folio factura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="foliofac" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Cuenta Cargo: </span><span class="idemp"><input style="text-align: center" type="checkbox" id="cuentacargo" name='check1[]'/></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Cuenta Abono: </span><span class="idemp"><input style="text-align: center" type="checkbox" id="cuentabono" name='check1[]'/></span>  <br>                                                                                                   
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Cuenta contable: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="cuentaCon" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Monto: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="number" id="monto" /></span>  <br>                                                
                                            </div>  
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="descripAs" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Deducibles: </span><span class="idemp"><input style="text-align: center" type="checkbox" id="deducible" /></span>  <br>                                                                                                   
                                            </div>  
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">Porcentaje: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="porcentajeAs" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">UUID factura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="uuid" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">RFC: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="rfc" /></span>  <br>                                                
                                            </div>    
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <center>
                                                <input id="guardar" type="submit" value="Guardar" style="background-color: #9F150D"  class="btn btn-danger"><br>
                                            </center>    
                                        </div>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                                                        

                                                        


                <!-- Modal EDITAR ASIENTO CONTABLE-->
                
<div class="modal fade" id="editarasiento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Editar Asiento Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form  autocomplete="off" onsubmit="return AsientosConEditar();" method="post" action="asientos_conta.jsp">
                                        <div class="row form-style-5">                                            
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">Modulo: </span><span class="idemp">
                                                    <select id="EditASmodu" name="EditASmodu">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                            <option value="ventas">Ventas</option>
                                                            <option value="compras">Compras</option>
                                                            <option value="porpagar">Por pagar</option>
                                                            <option value="nomina">Nomina</option>
                                                            <option value="inventarios">Inventarios</option>
                                                            <option value="conta">Contabilidad</option>
                                                        </optgroup>
                                                    </select> 
                                                </span>
                                            </div>                                                                                                   
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">                                               
                                                <span style="font-size: 16px">Tipo: </span><span class="idemp">
                                                    <select id="tipoasientoED" name="tipoasientoED">
                                                        <optgroup>
                                                            <option value="y">Seleccione...</option>
                                                            <option value="ajustes">Ajustes</option>
                                                            <option value="compras">Compras</option>
                                                            <option value="diario">Diario</option>
                                                            <option value="egreso">Egreso</option>
                                                            <option value="ingreso">Ingreso</option>
                                                            <option value="ventas">Ventas</option>
                                                        </optgroup>
                                                    </select> 
                                                </span>
                                            </div>                                   
                                        </div>
                                        <div class="row form-style-5">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">Periodo: </span><span class="idemp">
                                                    <select id="periodoED" name="periodo">
                                                        <optgroup>
                                                            <option value="x">Seleccione...</option>
                                                            <option value="2018">2018-01</option>
                                                            <option value="2019">2018-02</option>
                                                            <option value="2020">2018-03</option>
                                                            <option value="2021">2018-04</option>
                                                            <option value="2022">2018-05</option>
                                                            <option value="2023">2018-06</option>                                                            
                                                        </optgroup>
                                                    </select> 
                                                </span>                                                
                                            </div>    
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <span style="font-size: 16px">Fecha de ingreso: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" id="fechaIngE" /></span>
                                            </div>
                                            
                                        </div>                                        
                                        <div class="row form-style-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Concepto: </span><span class="idemp"><textarea style="width: 250px; text-align: left;" id="concepto"></textarea></span>                                               
                                            </div>    
                                        </div>
                                        <h4 class="text-center">Detalles</h4>
                                        <div class="row form-style-5">
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Fecha factura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="date" id="fechafacE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Folio factura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="foliofacE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Cuenta Cargo: </span><span class="idemp"><input style="text-align: center" type="checkbox" id="cuentacargoE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Cuenta Abono: </span><span class="idemp"><input style="text-align: center" type="checkbox" id="cuentabonoE" /></span>  <br>                                                                                                   
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Cuenta contable: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="cuentaConE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Monto: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="number" id="monto" /></span>  <br>                                                
                                            </div>  
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="descripAsE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                    <span style="font-size: 16px">Deducibles: </span><span class="idemp"><input style="text-align: center" type="checkbox" id="deducible" /></span>  <br>                                                                                                   
                                            </div>  
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">Porcentaje: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="porcentajeAsE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">UUID factura: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="uuidE" /></span>  <br>                                                
                                            </div>    
                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">                                             
                                                <span style="font-size: 16px">RFC: </span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center" type="text" id="rfcE" /></span>  <br>                                                
                                            </div>    
                                        </div>
                                        
                                        <div class="modal-footer">
                                            <center>
                                                <input id="editar" type="submit" value="Aplicar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                            </center>    
                                        </div>                   
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                
                
                
                
                <!-- Modal ELIMINAR ASIENTO CONTABLE-->

               
                <div class="modal fade" id="eliminarasiento" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Eliminar Asiento Contable</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form onsubmit="return validanumero('nclave');" action="" method="POST">
                                        <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nclave" id="nclave" placeholder="001"/></span><br>
                                        <center><input id="eliminar" type="submit" value="Eliminar" style="background-color: #9F150D" class="btn btn-danger"><br>
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

