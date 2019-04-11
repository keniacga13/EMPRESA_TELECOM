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
        <title>Merma conocida</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
         
        
        <script>
function EspecificaMC(){
            var coba = document.getElementById('CoBa');
            var IDMerma = document.getElementById('IDMerma');
            if (coba.length===0 && IDMerma.length===0){
            alert("Consulta vacia");
            }else{
            alert("Consultando"); 
        }
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
                       <h2>Merma conocida</h2>  
                    </center>
                   
                </div>
                <div class="form-style-5">
                    <form action="../Inventario/merma_con.jsp" method="GET">  
                            <span id="titulo"><span class="number">1</span> Consulta</span><br><br>
                            <span class="idemp"><input type="text" name="id_merma" id="id_merma" placeholder="Id de Merma"  maxlength="7" title="El id debe ser de 7 digitos (n&uacute;meros )" required ></span> <input type="submit" name="BuscaMID"  style="background-color: #9F150D" class="btn btn-danger" value="Consultar" onclick="return fomCon()"/><br><br>
                            <span id="titulo"><span class="number">2</span> Consulta especifica</span><br><br>
                            <center>
                            <button type="button" name="ConMC" data-toggle="modal" data-target="#ConsultaMC" style="background-color: #9F150D" class="btn btn-danger">Consulta Especifica</button><br>
                            </center>
                    </form>
                            <form action="../Inventario/merma1.jsp" method="POST">
                            <span id="titulo"><span class="number">3</span> Consulta General</span><br><br>
                            <input type="submit" name="ConsultaInG" style="background-color: #9F150D" class="btn btn-danger" value="Consultar">
                           </form>
                            
                    
                </div>
                <div class="form-style-5">
                   
                             <form method="POST" action="../../reporte_mermac">

                            <span id="titulo"><span class="number">4</span> Reporte</span><br><br>
                            
                                
                             <input type="submit" value="Generar PDF" name="GP" style="background-color: #9F150D; width: 180px;" class="btn btn-danger"><br><br>
                             
                            </form>
                            
                            
                            
                            <span id="titulo"><span class="number">5</span>Regresar</span><br><br>
                            <button type="button" name="Regresa" style="background-color: #9F150D" class="btn btn-danger" onclick="location.href='merma.jsp'">Regresar</button><br><br>
                    
                    </form>
                </div>

            </div>
                

            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"> <!-- Seccion central TABLA -->
                   <div class="table-responsive">
                            <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID Producto</th>
                                            <th scope="col">ID de merma</th>
                                            <th scope="col">Fecha de registro</th>
                                            <th scope="col">Tipo</th>
                                            <th scope="col">Cantidad</th>
                                            <th scope="col">Observaciones</th>
                                            
                                        </tr>
                                    </thead>
                                    <jsp:useBean id="interTabla" scope="page" class="pw.sap.pojo.Inventarios.QuerysInventarios"/>
                                    <%
                                        String id_merma=request.getParameter("id_merma");
                                        String producto=request.getParameter("CoBa");
                                        String fecha=request.getParameter("fecha_mer");
                                        
                                        ResultSet rsTabla = interTabla.consultaGeneralMC(id_merma, producto, fecha);

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
                                            <td><%=rsTabla.getString(6)%></td>
                                            
                                      
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
                                    <!-- Modal Consulta especifica-->
        <div class="modal fade" id="ConsultaMC" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                  <h4 class="modal-title" id="myModalLabel">Consulta Espec&iacute;fica</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                     <form method="GET" action="../Inventarios/merma_con.jsp" onsubmit="return EspecificaMC()"> 
                            <span id="titulo"><span class="number">1</span>Ingrese los Datos a consultar</span>
                            
                            
                            <br><br><span>Id de producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 190px; height: 30px;text-align: center;" type="text" name="CoBa" id="CoBa" maxlength="13" placeholder="#######" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)" required/></span>
                            <br><span>Fecha de merma:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="idemp"><input style="width: 180px; height: 30px;text-align: center;" type="date" placeholder="dd/mm/aaaa" name="fecha_mer"  id="fecha_mer"  title="El formato de fecha debe ser 'dd/mm/aaaa'" required/></span><br><br>
                                
                             <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Continuar" id="BuscaEs" onsubmit="return EspecificaMC()"><br>
                    </form>
                </div>
              </div>
            </div>
          </div>
        </div>
               
 <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
           <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
