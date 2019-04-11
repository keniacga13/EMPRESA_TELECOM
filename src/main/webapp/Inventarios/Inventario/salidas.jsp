<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getSession().getAttribute("usuario") == null){
        response.sendRedirect("../../archivos/sesion/errorSesion.jsp");
    }else{
        if(!request.getSession().getAttribute("area").equals("Inventarios")&&!request.getSession().getAttribute("area").equals("Gerencia")){
            response.sendRedirect("../../archivos/errorSesion.jsp");
        }
    }
%>
<html>
    <head>
        <title>Historial de salidas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/validaciones.js"></script>
 <script>
            function fecha(){
            var valor = document.getElementById('fechaSal');
            var fecha = new Date();
            var dia;
            var mes;
            if (fecha.getDate() < 10){dia = '0' + fecha.getDate(); } else{dia = fecha.getDate(); }
            if (fecha.getMonth() + 1 < 10){mes = '0' + (fecha.getMonth() + 1); } else{mes = fecha.getMonth() + 1; }
            valor.value = (dia + '/' + mes + '/' + fecha.getFullYear());
            document.getElementById('fechaSal').innerHTML = valor.value;
            }
            
            function InsertarSal(){
            alert("Se han insertado los datos correctamente");
            }
        
        </script>


    </head>
    <body>
        <header style="z-index: 2">
            <nav class="navbar navbar-expand-lg navbar-light menu" style="background-color: #9F150D;">
                <a class="navbar-brand" style="color: white;" href="#">Inventario</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="principal.jsp" style="color: white"> Principal</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="inventario_g.jsp" style="color: white"> Inventario</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Problemas de Producto
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">

                                <a class="dropdown-item" href="merma.jsp">Merma</a><span class="sr-only"></span>
                                <a class="dropdown-item" href="Producto_Re.jsp">Devoluciones</a><span class="sr-only">(current)</span>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" style="color: white" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Recepci&oacute;n de productos
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="entradas.jsp" >Historial de Entradas</a>
                                <a class="dropdown-item" href="salidas.jsp" >Historial de Salidas</a>
                                </di>
                                <li class="nav-item">
                                    <a class="nav-link" href="ayuda.jsp" style="color: white">Ayuda(?)</a>
                                </li>
                    </ul>
                    <li class="nav-item">
                        <a id="btn_gerencia" class="nav-link" href="../../Gerencia/IG/ig_inicio.jsp" style="color: white">Gerencia</a>                                
                        <script src="../../js/gerencia.js"></script>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../../CerrarSesion" style="color: white">Salir</a>                                
                    </li>
                </div>
            </nav>
        </header>
       <!-- CONTENIDO-->
        <div class="container-fluid contenido">
            <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion izquierda -->

                <div class="form-style-5">
                    <center>
                       <h4>Salidas</h4>  
                    </center>
                   
                </div>

                <div class="form-style-5">
                    <form action="../Inventario/SalidasporOrd.jsp" method="GET">
                        
                           <span id="titulo"><span class="number">1</span> Consultar registro por id de producto</span><br><br>
                           <span class="idemp"><input type="text" name="id_producto" id="id_producto" placeholder="Id de producto" required="required" pattern="[0-9]{13}" maxlength="13" title="El id de producto debe ser de 13 digitos (n&uacute;meros)"/></span> <input type="submit" name="BuscaM" id="BuscaM" style="background-color: #9F150D" class="btn btn-danger" value="Consultar"/><br><br>
                    </form>
                    <form action="../Inventario/SalidasporOrd.jsp" method="GET">
                           <span id="titulo"><span class="number">2</span> Consulta registro por orden de venta</span><br><br>
                           <span class="idemp"><input type="text" name="id_venta" id="id_venta" placeholder="Orden de venta" maxlength="7" pattern="[0-9]{7}" title="El id de orden de venta debe ser de 7 digitos (n&uacute;meros)" required/></span><input type="submit" name="Busca" id="BuscaM" style="background-color: #9F150D" class="btn btn-danger" value="Consultar"/><br><br>
                            
                            </form>
                     <form action="../Inventario/salidas.jsp" method="POST">
                            <span id="titulo"><span class="number">3</span> Consulta General</span><br><br>
                            <input type="submit" name="ConsultaInG" style="background-color: #9F150D" class="btn btn-danger" value="Consultar">
                           </form>
                    </div>
                 <div class="form-style-5">
                    <form method="POST" action="../../reporte_salidas">

                            <span id="titulo"><span class="number">4</span> Reporte</span><br><br>
                            
                                
                             <input type="submit" value="Generar PDF" name="GP" style="background-color: #9F150D; width: 180px;" class="btn btn-danger"><br><br>
                             
                            </form>
                
                    </div>

            </div>

                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
           <div class="table-responsive">
                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID Producto</th>
                                            <th scope="col">ID Orden de venta</th>
                                            <th scope="col">Cantidad vendida</th>
                                            <th scope="col">Monto total</th>
                                            <th scope="col">Fecha de salida</th>
                                            
                                            </tr>
                                    </thead>
                                    <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                    <%
                                      
                                        ResultSet rsTabla = interTabla.Consultasalidas();

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
                                            
                                      
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                               
                        </div> 

            </div>
            
            </div>
            </div>
               
       <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
