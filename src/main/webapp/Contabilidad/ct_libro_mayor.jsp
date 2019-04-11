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
                            <div class="row">
                                <span id="titulo"><span class="number">1</span>Libro Mayor</span>
                                <form onsubmit="return validavacio('clave');" action="ct_libro_mayor.jsp">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                            <input type="text" id="clave" placeholder="ingresa cuenta a buscar"/>
                                        </div>
                                        <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                            <input type="submit" value="buscar">
                                        </div>    
                                    </div>

                                </form>     
                            </div>
                            <div class="row">
                                <form onsubmit="return libromayor();" action="" method="POST">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        Tipo de reporte Mayores mensual:
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <select name="reportemayor" id="reportemayor">
                                            <option value="x">Selecciona ...</option>
                                            <option value="1">consolidado sintetico</option>
                                            <option value="2">consolidado detallado</option>
                                            <option value="3">consolidado detallado plano</option>
                                        </select>
                                    </div> 
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        Ejercicio
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <select id="ejercicio" name="ejercicio">
                                            <option value="x">Selecciona...</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                        </select>
                                    </div> 
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <input type="submit" value="EXPORTAR"/>
                                    </div>               
                                </form>
                            </div>   
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>selecci&oacute;n</th>
                                    <th>Cuenta</th>                            
                                    <th>Descripcion</th>
                                    <th>Tipo de cuenta</th>
                                    <th>Clase cuenta</th>                            
                                    <th>Tipo Naturaleza</th>
                                </tr>
                                <tr>                     
                                    <td><input type="checkbox"/></td>                            
                                    <td>100</td>                            
                                    <td>Activo</td>
                                    <td>titulo</td>
                                    <td>Sintetica</td>                            
                                    <td>DEUDORA</td>
                                </tr>
                                <tr>                            
                                    <td><input type="checkbox"/></td>                            
                                    <td>100.1</td>                            
                                    <td>Activo a corto plazo</td>
                                    <td>Mayor</td>
                                    <td>Sintetica</td>                            
                                    <td>DEUDORA</td>
                                </tr>
                                <tr>                  
                                    <td><input type="checkbox"/></td>                            
                                    <td>100.2</td>                            
                                    <td>Activo a largo plazo</td>
                                    <td>mayor</td>
                                    <td>Sintetica</td>                            
                                    <td>DEUDORA</td>
                                </tr>
                                <tr>                  
                                    <td><input type="checkbox"/></td>                            
                                    <td>101</td>                            
                                    <td>Caja</td>
                                    <td>Auxiliar</td>
                                    <td>Sintetica</td>                            
                                    <td>DEUDORA</td>
                                </tr>
                            </table> 
                            <br/>
                            <form action="../Reporte_conta_LM" method="POST">
                                <input type="submit" class="btn btn-danger text-white" value="Exportar PDF" style="background-color: #9F150D">
                            </form>
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
    </body>
</html>
