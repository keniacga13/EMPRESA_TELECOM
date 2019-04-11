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
                            <form onsubmit="return validavacio('clave');" action="ct_prov.html">
                                <span id="titulo"><span class="number">1</span>Ingresa la clave a buscar</span>
                                <div class="row">
                                    <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
                                        <input type="text" id="clave" placeholder="ingresa clave a buscar"/>
                                    </div>
                                    <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
                                        <input type="submit" value="buscar">
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <button id="btn-comp-conf" type="button" class="btn btn-light" onclick="configuraCOMPmodal()">Configurar</button>
                                    </div>
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-4">
                                        <button id="btn-comp-confimp" type="button" class="btn btn-light" onclick="configuraImpuestoCOMPmodal()">Configuraci&oacute;n de Impuestos</button>
                                    </div>
                                </div>
                            </form> 
                        </div> 
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><!-- Seccion central -->
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <th>Selecciona</th>
                                    <th>Clave</th>
                                    <th>RFC</th>
                                    <th>Nombre</th>
                                    <th>Direcci&oacute;n</th>
                                    <th>Contacto</th>
                                    <th>Tel&eacute;fono</th>
                                    <th>Correo</th>
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>
                                    <td>A1087</td>
                                    <td>ARA9405033K0</td>
                                    <td>Abarrotes garras</td>
                                    <td>Calle ejemplo no. 3</td>
                                    <td>Socorro Melchor Ocampo</td>
                                    <td>7131318678</td>
                                    <td>Socorro@gmail.com</td>                            
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>
                                    <td>A1287</td>
                                    <td>ARA9785033J0</td>
                                    <td>Abarrotes ejemplo2</td>
                                    <td>Calle ejemplo no. 4</td>
                                    <td>Carla Melchor Ocampo</td>
                                    <td>7131318679</td>
                                    <td>Carla@gmail.com</td>                            
                                </tr>
                                <tr>
                                    <td class="seleccion"><input type="checkbox"/></td>
                                    <td>A1087</td>
                                    <td>ARA9405033K0</td>
                                    <td>Abarrotes garras</td>
                                    <td>Calle ejemplo no. 3</td>
                                    <td>Socorro Melchor Ocampo</td>
                                    <td>7131318678</td>
                                    <td>Socorro@gmail.com</td>                            
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


                <!-- Modal CONFIGURAR-->
                <div class="modal fade" id="confcomp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Configurar</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="ct_prov.jsp" method="post" onsubmit="return comprasconfig();">
                                        <table>
                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>Proveedor</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input id="procuenta" type="text" placeholder="201.68" />
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Nombre:
                                                </td>
                                                <td>
                                                    <input type="text" id="pronombre" placeholder="abarrotes garras" />
                                                </td>                               
                                            </tr>  
                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>Pago Anticipado</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input type="text" id="pacuenta" placeholder="201.02" />
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Nombre:
                                                </td>
                                                <td>
                                                    <input type="text" id="panombre" placeholder="abarrotes" />
                                                </td>                               
                                            </tr>  
                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>Datos Bancarios</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Nombre de la cuenta:
                                                </td>
                                                <td>
                                                    <input type="text" id="bancocuentanombre" placeholder="Empresarial"/>
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    N&uacute;mero de laCuenta:
                                                </td>
                                                <td>
                                                    <input type="text" id="banconumerocuenta" placeholder="1234567" />
                                                </td>                               
                                            </tr>  
                                            <tr>
                                                <td>
                                                    Banco:
                                                </td>
                                                <td>
                                                    <select id="banco" name="banco">
                                                        <option value="x">Seleccione...</option>
                                                        <option value="12">12-BBVA Bancomer</option>
                                                        <option value="137">137-BanCoppel</option>                                        
                                                    </select>
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Correo electronico:
                                                </td>
                                                <td>
                                                    <input type="email" placeholder="correo@correo.com" />
                                                </td>                               
                                            </tr>  

                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>IEPS</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input type="text" id="iepscuenta" placeholder="201.68" />
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Nombre:
                                                </td>
                                                <td>
                                                    <input type="text" id="iepsnombre" placeholder="abarrotes garras" />
                                                </td>                               
                                            </tr>  

                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>Retenci&oacute;n ISR</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input type="text" id="isrcuenta" placeholder="201.68" />
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Nombre:
                                                </td>
                                                <td>
                                                    <input type="text" id="isrnombre" placeholder="abarrotes garras" />
                                                </td>                               
                                            </tr>  

                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>Retenci&oacute;n de IVA</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input type="text" id="ivacuenta" placeholder="201.68" />
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Nombre:
                                                </td>
                                                <td>
                                                    <input type="text" id="ivanombre" placeholder="abarrotes garras" />
                                                </td>                               
                                            </tr>                                                                                                                                                         
                                        </table>
                                        <input type="submit" value="AGREGAR"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal CONFIGURAR IMPUESTOS-->

                <div class="modal fade" id="confimpcomp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="myModalLabel">Configurar Impuestos</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-style-5">
                                    <form action="ct_prov.jsp" method="post" onsubmit="return comprasconfimpuesto();">
                                        <table>
                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>IVA por Acreditar</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input type="text" id="ivaacreditarcuenta" placeholder="201.68" />
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Tipo cuenta:
                                                </td>
                                                <td>
                                                    <input type="text" id="ivaacreditartipocuenta" placeholder="IVA POR ACREDITAR" />
                                                </td>                               
                                            </tr>  
                                            <tr>
                                                <td></td>
                                                <td colspan="4"><h1>IVA acreditable</h1></td>
                                            </tr>                            
                                            <tr>
                                                <td>
                                                    Cuenta contable:
                                                </td>
                                                <td>
                                                    <input type="text" id="ivaacreditablecuenta" placeholder="201.02"/>
                                                </td>                               
                                                <td>&nbsp;&nbsp;</td>
                                                <td>
                                                    Tipo cuenta:
                                                </td>
                                                <td>
                                                    <input type="text" id="ivaacreditabletipocuenta" placeholder="IVA ACREDITABLE" />
                                                </td>                               
                                            </tr>                                                                                                                         
                                        </table>    
                                        <input type="submit" value="AGREGAR"/>
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
