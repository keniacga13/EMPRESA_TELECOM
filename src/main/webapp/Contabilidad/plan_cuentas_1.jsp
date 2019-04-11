<%@page import="pw.sap.obj.Contabilidad.ObjCuentaSat"%>
<%@page import="pw.sap.obj.Contabilidad.ObjPlanDeCuentas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="pw.sap.pojo.Contabilidad.PlanCuentas"%>

<%
    if (request.getSession().getAttribute("usuario") == null) {
        response.sendRedirect("../archivos/sesion/errorSesion.jsp");
    } else {
        if (!request.getSession().getAttribute("area").equals("Contabilidad") && !request.getSession().getAttribute("area").equals("Gerencia")) {
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
        <link href="../Recursos/bootstrap/css/bootstrap.min.css"rel="stylesheet" type="text/css"/>
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
                            <form onsubmit="return busqueda(clave, desc);" action="../PlanDeCuentas" method="POST">
                                <span id="titulo"><span class="number">1</span>Buscar plan de cuenta</span>
                                <div class="row">
                                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                        <input type="text" name="clave" id="clave" placeholder="Cuenta">    
                                    </div>
                                    <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                        <input type="text" name="desc" id="desc" placeholder="Descripci&oacute;n">
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input id="buscar" name="buscar" type="submit" value="Buscar">
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                        <button id="btn-pc-add" type="button" class="btn btn-light" onclick="agregaPCmodal()">Agregar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-pc-edit" type="button" class="btn btn-light" onclick="editaPCmodal()">Editar</button>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                        <button id="btn-pc-del" type="button" class="btn btn-light" onclick="eliminaPCmodal()">Eliminar</button>
                                    </div>
                                </div>
                            </form> 
                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                <form action="plan_cuentas.jsp" method="POST">
                                    <input id="buscar" name="general" type="submit" value="Consulta General">
                                </form>
                            </div>
                        </div> 
                    </div>
                    <div id="cont-central" class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Cuenta</th>
                                    <th>Descripcion</th>
                                    <th>Tipo de cuenta</th>
                                    <th>Clase cuenta</th>
                                    <th>Clase SAT</th>
                                    <th>Tipo Naturaleza</th>
                                </tr>
                                <tr>
                                    <td><%=request.getSession().getAttribute("cuenta")%></td>
                                    <td><%=request.getSession().getAttribute("descripcion")%></td>
                                    <td><%=request.getSession().getAttribute("tipo_cuenta")%></td>
                                    <td><%=request.getSession().getAttribute("clase_cuenta")%></td>
                                    <td><%=request.getSession().getAttribute("clase_sat")%></td>  
                                    <td><%=request.getSession().getAttribute("naturaleza")%></td>    
                                </tr>
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
                <div class="modal fade" id="agregapc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Agregar Plan de Cunetas</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="../PlanDeCuentasAdd" onsubmit="return seleccion();" method="post">
                                        <div class="table-responsive" style="overflow:scroll; height:200px; width:100%;">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Id</th>
                                                    <th>Cuenta</th>
                                                    <th>Descripcion</th>
                                                </tr>
                                                <tr>
                                                    <%
                                                        LinkedList<ObjCuentaSat> listaSat = PlanCuentas.consultaTodoSat();
                                                        for (int i = 0; i < listaSat.size(); i++) {
                                                            out.println("<tr>");
                                                            out.println("<td><input type='radio' id='idsat' name='idsat' value=" + listaSat.get(i).getId() + "></td>");
                                                            out.println("<td>" + listaSat.get(i).getCuenta() + "</td>");
                                                            out.println("<td>" + listaSat.get(i).getDescripcion() + "</td>");
                                                            out.println("<tr>");
                                                        }
                                                    %>
                                                </tr>                        
                                            </table>    
                                        </div>
                                        <div class="row">
                                            <br>
                                            <span id="titulo">Colocar los datos</span>   
                                            <br>
                                        </div>        
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                                <input type="text" name="tipocuenta" id="tipocuenta" placeholder="Tipo de cuenta">    
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                                <input type="text" name="clasecuenta" id="clasecuenta" placeholder="Clase de cuenta">    
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                                <input type="text" name="naturaleza" id="naturaleza" placeholder="Naturaleza">    
                                            </div>
                                        </div>
                                        <div class="row">
                                            <input type="submit" value="AGREGAR"/>    
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal EDITAR PLAN DE CUENTAS-->

                <div class="modal fade" id="editapc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Editar Plan de Cuentas</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="../PlanDeCuentasEditar" onsubmit="return plancuentaseditar();" method="post">

                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Selecciona</th>
                                                    <th>Cuenta</th>
                                                    <th>Descripcion</th>
                                                    <th>Tipo de cuenta</th>
                                                    <th>Clase cuenta</th>
                                                    <th>Clase SAT</th>
                                                    <th>Tipo Naturaleza</th>
                                                </tr>
                                                <tr>
                                                    <%
                                                        LinkedList<ObjPlanDeCuentas> listaEdita = PlanCuentas.consultaTodoPlan();
                                                        for (int i = 0; i < listaEdita.size(); i++) {
                                                            out.println("<tr>");
                                                            out.println("<td><input type='radio' id='neliminapcclave' name='neliminapcclave' value=" + listaEdita.get(i).getId() + "></td>");
                                                            out.println("<td>" + listaEdita.get(i).getId_cuenta() + "</td>");
                                                            out.println("<td>" + listaEdita.get(i).getDescripcion() + "</td>");
                                                            out.println("<td>" + listaEdita.get(i).getTipo_cuenta() + "</td>");
                                                            out.println("<td>" + listaEdita.get(i).getClase_cuenta() + "</td>");
                                                            out.println("<td>" + listaEdita.get(i).getClase_sat() + "</td>");
                                                            out.println("<td>" + listaEdita.get(i).getNaturaleza() + "</td>");
                                                            out.println("<tr>");
                                                        }
                                                    %>
                                                </tr>
                                            </table>    
                                        </div>
                                        <div class="row">
                                            <br>
                                            <span id="titulo">Colocar los datos</span>   
                                            <br>
                                        </div>        
                                        <div class="row">
                                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                                <input type="text" name="tipocuenta" id="tipocuenta" placeholder="Tipo de cuenta">    
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                                <input type="text" name="clasecuenta" id="clasecuenta" placeholder="Clase de cuenta">    
                                            </div>
                                            <div class="col-lg-6 col-md-12 col-sm-6 col-xs-6">
                                                <input type="text" name="naturaleza" id="naturaleza" placeholder="Naturaleza">    
                                            </div>
                                        </div>
                                        <div class="row">
                                            <input type="submit" value="AGREGAR"/>    
                                        </div>                
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal ELIMINAR PLAN ED CUENTAS-->

                <div class="modal fade" id="eliminapc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Eliminar Plan de Cuentas</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="../PlanDeCuentasEliminar" onsubmit="return validanumero('neliminapcclave');" method="post">
                                        <div class="table-responsive">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th>Selecciona</th>
                                                    <th>Cuenta</th>
                                                    <th>Descripcion</th>
                                                    <th>Tipo de cuenta</th>
                                                    <th>Clase cuenta</th>
                                                    <th>Clase SAT</th>
                                                    <th>Tipo Naturaleza</th>
                                                </tr>
                                                <tr>
                                                    <%
                                                        LinkedList<ObjPlanDeCuentas> listaEliminar = PlanCuentas.consultaTodoPlan();
                                                        for (int i = 0; i < listaEliminar.size(); i++) {
                                                            out.println("<tr>");
                                                            out.println("<td><input type='radio' id='neliminapcclave' name='neliminapcclave' value=" + listaEliminar.get(i).getId() + "></td>");
                                                            out.println("<td>" + listaEliminar.get(i).getId_cuenta() + "</td>");
                                                            out.println("<td>" + listaEliminar.get(i).getDescripcion() + "</td>");
                                                            out.println("<td>" + listaEliminar.get(i).getTipo_cuenta() + "</td>");
                                                            out.println("<td>" + listaEliminar.get(i).getClase_cuenta() + "</td>");
                                                            out.println("<td>" + listaEliminar.get(i).getClase_sat() + "</td>");
                                                            out.println("<td>" + listaEliminar.get(i).getNaturaleza() + "</td>");
                                                            out.println("<tr>");
                                                        }
                                                    %>
                                                </tr>
                                            </table>    
                                        </div>
                                        <center>
                                            <input id="eliminar" type="submit" value="Eliminar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                            <br>
                                        </center>                   
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