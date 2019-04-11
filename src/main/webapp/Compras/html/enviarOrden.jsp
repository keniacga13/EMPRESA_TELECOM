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
                            <a class="nav-link" href="../../CerrarSesion"  style="color: white">Salir</a>
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
                    <div  class="col-lg-3 col-md-3 col-sm-3 col-xs-12 "> <!-- Seccion izquierda -->
                        
                    </div> 
                                            
                    


                    <div style="background-color: #f4f7f8;" class="col-lg-10 col-md-10 col-sm-10 col-xs-11 form-style-5"><!-- Seccion central -->                          
       <%@page import="pw.sap.db.Conexion" %>
<%@page import="java.util.ArrayList" %>
<% 
    Conexion c = new Conexion();
    ArrayList lista = c.pendienteOrden();
%>
<form autocomplete="off" id="formEnviarNomina" name="formEnviarCompra" method="POST" action="../../ServiceCompra">
    <table style="margin: 0 auto;">
        <tr>
            <td>URL</td><td align="center"><input type="text" id="url" name="url" class="form-control form-control-sm"/></td>
        </tr>
        <tr>
            <td>Puerto</td><td align="center"><input type="number" id="puerto" name="puerto" class="form-control form-control-sm"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" id="servicioNomina" name="servicioNomina" class="btn text-white boton" value="Enviar"/>
            </td>
        </tr>
    </table><br>
    <div>
        <table class="table table-striped">
            <tr>
                <td align="center">Seleccionar&nbsp;orden</td>
                <td align="center">Proveedor</td>
                <td align="center">Producto</td>
                <td align="center">Cantidad</td>
                <td align="center">Fecha</td>
                <td align="center">Estatus</td>
                
            </tr>
            <tr>
                <%
                    for(int i = 0 ; i < lista.size() ; i++){
                        if(i%6==0 && i!=0){out.println("</tr><tr>");}
                        if(i%6==0){
                            out.print("<td  align='center'><input type='checkbox' name='compraPendiente' value="+lista.get(i)+" /></td>");
                        }else{
                            out.print("<td  align='center'>"+lista.get(i)+"</td>");
                        }
                    }
                %>
            </tr>
        </table>
    </div>
</form>
                    </div>
                    <div  class="col-lg-3 col-md-3 col-sm-3 col-xs-12 "><!-- Seccion derecha -->
                       
                    </div>    
                </div>
            </div> 
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body> 
</html>
