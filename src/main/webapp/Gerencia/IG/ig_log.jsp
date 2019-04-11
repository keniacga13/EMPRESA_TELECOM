<%-- 
    Document   : ig_log
    Created on : 29/05/2018, 01:45:46 AM
    Author     : Windows 10 Pro
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ArrayList lista = (ArrayList) request.getSession().getAttribute("lista"); %>
<%
    if (request.getSession().getAttribute("usuario") == null) {
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    } else {
        if (!request.getSession().getAttribute("area").equals("Gerencia")) {
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Informacion Gerencial</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
    </head>

    <body> 
        <header class="sticky-top">
            <!--barra de navegacion creada con bootstrap-->
            <nav class="navbar navbar-expand-lg navbar-light barra">
                <a class="navbar-brand text-white" href="ig_inicio.jsp">Informaci&oacute;n Gerencial</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                </div>
                <li class="nav-item dropdown" style="list-style:none;">
                    <a id="menu" data-toggle="dropdown" class="nav-link dropdown-toggle" style="color: white;" >Historia</a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item dropdown-submenu">
                            <p href="#" >Fecha</p>
                            <form action="../../Consultalog" name="formulario" method="post" autocomplete="off">
                                <input type="date" name="bday" id="bday" max="3000-12-31"  min="1000-01-01" class="form-control">
                                <br>
                                <label>Intervalo&nbsp;de&nbsp;tiempo</label>
                                <br/>
                                <div id="hora">
                                    <br>
                                    <label>De: <input id="horaInicio" for="example-time-input" type="time" name="horaInicio" class="form-control"></label>
                                    <br>
                                    <label>A:   <input id="horaFin" for="example-time-input" type="time" name="horaFin" max="22:30:00" min="10:00:00" step="1" class="form-control"></label>  
                                </div>
                                 <br>
                                <input type="submit" class="btn btn-danger text-white" value="Consultar">
                            </form>
                        </li>
                    </ul>
                </li>
                <li class="nav-item dropdown" style="list-style:none;">
                    <a id="menu" data-toggle="dropdown" class="nav-link dropdown-toggle" style="color: white;" >Generar&nbsp;CSV</a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item dropdown-submenu">
                            <form action="../../GenerarCSV" id="formularioCSV1" method="POST" autocomplete="off">
                                <input type="text" name="rutaCSV" id="rutaCSV" placeholder="Ingrese la ruta del archivo" class="form-control" required/>
                                <br>
                                <p href="#" >Fecha</p>
                                <input type="date" name="bdayG" id="bdayG" max="3000-12-31"  min="1000-01-01" class="form-control">
                                <br>
                                <div id="hora">
                                    <br>
                                    <label>De: <input id="horaInicioG" for="example-time-input" type="time" name="horaInicioG" class="form-control"></label>
                                    <br>
                                    <label>A:   <input id="horaFinG" for="example-time-input" type="time" name="horaFinG" value="11:45:00" max="22:30:00" min="10:00:00" step="1" class="form-control"></label>  
                                </div>
                                <br>
                                <input type="submit" class="btn btn-danger text-white" value="Generar CSV">
                            </form>
                        </li>
                    </ul>
                </li>
                <li class="nav-item" style="list-style:none">
                    <a>_________</a>
                </li>
                <li class="nav-item" style="list-style:none">
                    <a class="nav-link" href="../../CerrarSesion" style="color: white">Salir</a>
                </li>
            </nav>
        </header>
        <div id="principal">
            <div class="container-fluid" style="background-color: #EDEDED;"><!-- Seccion central (Visualizar tarea) -->
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <table style="margin: 0 auto;width:100%;height:100%;">
                        <tr>
                            <td align="center">DESCRIPCI&Oacute;N</td>
                            <td align="center">ID&nbsp;DEL&nbsp;EMPLEADO</td>
                            <td align="center">&Aacute;REA</td>
                            <td align="center">FECHA</td>
                            <td align="center">HORA</td>
                        </tr>
                        <tr>
                        <%
                            for(int i = 0 ; i < lista.size() ; i++){
                                if(i%5==0 && i!=0){out.print("</tr><tr>");}
                                out.print("<td align='center'>"+lista.get(i)+"</td>");
                            }
                            request.getSession().removeAttribute("lista");
                        %>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>