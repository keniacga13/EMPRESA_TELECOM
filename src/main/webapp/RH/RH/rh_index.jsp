<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Recursos Humanos")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    <script src="../../Recursos/clndr/underscore.js" type="text/javascript"></script>
    <script src="../../Recursos/clndr/moment.js" type="text/javascript"></script>
    <script src="../../Recursos/clndr/clndr.js" type="text/javascript"></script>
    <link href="../../css/RH/rh_estilos.css" rel="stylesheet" type="text/css"/>
    <script src="../../js/RH/rh_script.js" type="text/javascript"></script>
    <title>Recursos&nbsp;Humanos</title>
  </head>
  <body onload="fecha();">
      <div class="todo">
        <div class="container-fluid">
            <div class="row">
                <br>
            </div>
            <header>
                <div class="row departamento">
                    <nav class="navbar navbar-expand-lg navbar-light">
                      <a href="#" class="navbar-brand text-white">Recursos&nbsp;Humanos</a>
                      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#rh_navbar" aria-controls="rh_navbar" aria-expanded="false" aria-label="Toggle navigation">
                         <span class="navbar-toggler-icon"></span>
                      </button>
                      <div class="collapse navbar-collapse" id="rh_navbar">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item"><a href="#" id="verCalendario" class="nav-link text-white color">&nbsp;Calendario</a></li>
                                
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white color" id="empleado" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Empleado</a>
                                    <div class="dropdown-menu departamento" aria-labelledby="empleado">
                                        <a class="nav-link text-white color" href="#" id="contratar_empleado">Contrataci&oacute;n</a>
                                        <a class="nav-link text-white color" href="#" id="despedir_empleado">Despido</a>
                                        <a class="nav-link text-white color" href="#" id="modificar_empleado">Modificar&nbsp;informaci&oacute;n</a>
                                        <a class="nav-link text-white color" href="#" id="buscar_empleado">Buscar&nbsp;empleado</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white color" id="nomina" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">N&oacute;mina</a>
                                    <div class="dropdown-menu departamento" aria-labelledby="nomina">
                                        <a class="nav-link text-white color" href="#" id="agregarNomina">Agregar&nbsp;N&oacute;mina</a>
                                        <a class="nav-link text-white color" href="#" id="modificarNomina">Modificar&nbsp;N&oacute;mina</a>
                                        <a class="nav-link text-white color" href="#" id="consultarNomina">Consultar&nbsp;N&oacute;mina</a>
                                        <a class="nav-link text-white color" href="#" id="enviarNomina">Enviar&nbsp;N&oacute;mina</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white color" id="Tareas" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Tareas</a>
                                    <div class="dropdown-menu departamento" aria-labelledby="Tareas">
                                        <a href="#" id="agregarTarea" class="nav-link text-white color">Agregar&nbsp;tarea</a>
                                        <a href="#" id="eliminarTarea" class="nav-link text-white color">Eliminar&nbsp;tarea</a>
                                        <a href="#" id="modificarTarea" class="nav-link text-white color">Modificar&nbsp;tarea</a>
                                         <a href="#" id="consultarTarea" class="nav-link text-white color">Consultar&nbsp;tarea</a>
                                       
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle text-white color" id="ayuda" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Ayuda(?)</a>
                                    <div class="dropdown-menu departamento" aria-labelledby="ayuda">
                                        <a class="nav-link text-white color" href="#" id="ayuda_calen">Ver&nbsp;calendario</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_agTarea">Agregar&nbsp;tarea</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_eliTarea">Eliminar&nbsp;tarea</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_modTarea">Modificar&nbsp;tarea</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_nomina">N&oacute;mina</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_consulta">Consulta</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_informacion">Informaci&oacute;n&nbsp;de&nbsp;la&nbsp;sesi&oacute;n</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_modifica">Modificar&nbsp;informaci&oacute;n&nbsp;del&nbsp;empleado</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_contrata">Contrataci&oacute;n</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_despedir">Despido</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_reporte">Generar&nbsp;reporte</a>
                                        <a class="nav-link text-white color" href="#" id="ayuda_imprimir">Imprimir</a>
                                    </div>
                                </li>
                                <li class="nav-item"><a href="../../CerrarSesion" class="nav-link text-white color">Salir</a></li>
                            </ul>
                      </div>
                  </nav>
                </div>
            </header>
            <div id="principal">
              <div class="container-fluid">
                  <div class="row"><br></div>
                  <div class="row">
                      <div style="background-color: #E6E6E6;" class="col-lg-2 col-md-2 col-sm-12 col-xs-12"><!-- Seccion izquierda -->
                          <div>
                              <center>
                                  <br>
                                  <input type="text" id="fecha" size="6" disabled>
                              </center>
                          </div>
                          <div>
                              <center>
                                  <h6>USUARIO:&nbsp;${usuario}</h6><label><img src="../imagen/persona.png" width="50" height="50" alt=''></label><!-- Puesto y foto del administrador en sesion -->
                              </center>
                          </div>
                          <div>
                              <center>
                                  <p>Informaci&oacute;n&nbsp;de&nbsp;la&nbsp;empresa</p><!-- InformaciÃ³n relacionada con la empresa que utiliza el software -->
                              </center>
                          </div>
                          <div>
                              <center>
                                  <button class="btn btn-info text-white boton" data-toggle="modal" data-target="#tipo_reporte" type="button" id="generarReporte">Generar&nbsp;reporte</button>
                              </center>
                          </div>
                      </div>
                      <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12"><!-- Seccion central -->
                            <scroll-container id="tareaActual"></scroll-container>
                      </div>
                      <div id="tipo_reporte" class="modal fade" role="modal-dialog"><!-- Modal para elegir formato del reporte -->
                          <div class="modal-dialog">
                              <div class="modal-content">
                                  <div class="modal-header">
                                      <p class="modal-title">Elige&nbsp;el&nbsp;tipo&nbsp;de&nbsp;documento</p>
                                  </div>
                                  <div class="modal-body">
                                       <form action="../../ReporteRH" method="POST">
                                           
                                              <input type="submit" class="btn text-white boton" id="pdf" name="pdf" value="PDF">
                                               
                                          </form>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div> 
            </div>
          </div>
      </div>
  </body>
</html>
