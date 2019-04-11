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
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"> <!-- Seccion izquierda -->
                        <div class="form-style-5">
                            <span id="titulo"><span class="number">1</span>Grupo plan de cuantas</span>
                            <div class="row">
                                <div class="col-lg-4 col-md-12 col-sm-4 col-xs-12">
                                    <button id="btn-gpc-add" type="button" class="btn btn-light" onclick="agregaGPCmodal()">Agregar</button>
                                </div>
                                <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                    <button id="btn-gpc-edit" type="button" class="btn btn-light" onclick="editaGPCmodal()">Editar</button>
                                </div>
                                <div class="col-lg-4 col-md-12 col-sm-4 col-xs-4">
                                    <button id="btn-gpc-del" type="button" class="btn btn-light" onclick="eliminaGPCmodal()">Eliminar</button>
                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>                            
                                    <th>Clave</th>                            
                                    <th>Descripcion</th>                           
                                </tr>
                                <tr>                            
                                    <td>VTA</td>
                                    <td>Ventas</td>
                                </tr>                        
                                <tr>                            
                                    <td>COST</td>
                                    <td>Costos</td>
                                </tr>         
                                <tr>                            
                                    <td>Gtonom</td>
                                    <td>Gastos N&oacute;mina</td>
                                </tr>                   
                                <tr>                            
                                    <td>Gtoope</td>
                                    <td>Gastos operaciones</td>
                                </tr>
                            </table>    
                        </div>  
                    </div>
                    <div style="background-color: #f4f7f8;" class="col-lg-3 col-md-3 col-sm-3 col-xs-12"><!-- Seccion derecha -->
                        <table style="width:100%;height:100%;">                                        
                            <tr><td colspan="2">Informaci&oacute;n de la empresa</td></tr>
                            <tr><td colspan="2"><img src="" alt="logo de la empresa"></td></tr>
                        </table>
                    </div>    
                </div>
            </div> 
        </div>

        <!-- Modal AGREGAR GRUPO CALENDARIO CONTABLE-->
        <div class="modal fade" id="agregagpc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Agregar Grupo Plan de Cunetas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="grupo_plan_cuentas.jsp" method="post" onsubmit="return GrupoPlanCuentasAgregar();">

                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="claveg"/></span><br>

                                <span style="font-size: 18px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="AgrGPDes"/></span><br>

                                <span style="font-size: 18px">Tipo: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="AgrGPTipo"/></span><br>


                                <center><input id="guardar" type="submit" value="Agregar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                    <br></center>                   
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal EDITAR GRUPO PLAN DE CUENTAS-->

        <div class="modal fade" id="editagpc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Editar Grupo Plan de Cuentas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="grupo_plan_cuentas.jsp" method="post"  onsubmit="return GrupoPlanCuentasEditar();">

                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001"  id="Edtclaveg"/></span><br>

                                <span style="font-size: 18px">Descripci&oacute;n: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="EditGPDes"/></span><br>

                                <span style="font-size: 18px">Tipo: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="EditGPTipo"/></span><br>


                                <center><input id="guardar" type="submit" value="Guardar" style="background-color: #9F150D" class="btn btn-danger"><br>
                                    <br></center>                   
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal ELIMINAR GRUPO PLAN ED CUENTAS-->

        <div class="modal fade" id="eliminagpc" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Eliminar Grupo Plan de Cuentas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-style-5">
                            <form action="grupo_plan_cuentas.jsp" method="post" onsubmit="return GrupoPlanCuentasEliminar();">
                                <span style="font-size: 18px">Clave: </span><span class="idemp"><input style="width: 110px; height: 30px;text-align: center;" type="text" name="nocot" placeholder="001" id="GpEliminar"/></span><br>
                                <center><input id="eliminar" type="submit" value="Eliminar" style="background-color: #9F150D" class="btn btn-danger" ><br>
                                    <br></center>                   
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
