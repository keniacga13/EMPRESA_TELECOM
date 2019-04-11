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
        <title>Merma</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script>
            function fecha(){
            var valor = document.getElementById('fecha_mer');
            var fecha = new Date();
            var dia;
            var mes;
            if (fecha.getDate() < 10){dia = '0' + fecha.getDate(); } else{dia = fecha.getDate(); }
            if (fecha.getMonth() + 1 < 10){mes = '0' + (fecha.getMonth() + 1); } else{mes = fecha.getMonth() + 1; }
            valor.value = (dia + '/' + mes + '/' + fecha.getFullYear());
            document.getElementById('fecha_mer').innerHTML = valor.value;
            }
            function InsertarMe(){
            alert("Se han insertado los datos correctamente");
            }
            function EliminarMe(){
            alert("Se han eliminado los datos correctamente");    
            }
        </script>

    </head>
    <body onload="fecha();">
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
                    <form> 
                    <span id="titulo"><span class="number">1</span>Nuevo Producto Merma</span><br><br> 
                            <center>
                            <button type="button" name="agregaProd" data-toggle="modal" data-target="#agregaProductos" style="background-color: #9F150D" class="btn btn-danger">Agregar producto</button><br>
                            </center>        
                    </form>
                </div> 
                <div class="form-style-5">
                    <form action="../../eliminarMerma" method="POST" onsubmit="return EliminarMe()">
                           
                           <span id="titulo"><span class="number">2</span>Eliminar producto merma</span><br><br>
                            <span class="idemp"><input type="text" name="id_merma"  id="id_merma" placeholder="ID de Merma" maxlength="7" pattern="[0-9]{7}" title="El id de orden de merma debe ser de 7 digitos (n&uacute;meros)" required="required"></span> <input type="submit" name="EliminaM" style="background-color: #9F150D" class="btn btn-danger" value="Eliminar" /><br><br>                
                            <span id="titulo"><span class="number">3</span>Modificar</span><br><br>
                            <center>
                                <button type="button" name="ModificaProd" data-toggle="modal" data-target="#ModificaProductos" style="background-color: #9F150D" class="btn btn-danger" onsubmit="return EliminarMe()">Modificar</button><br>
                            </center>
                                

                    </form>
                </div>

            </div>


            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"><!-- Seccion central Imagenes -->
                <center>    
                    <div class="form-style-5" id="cono">
                        <img src="../imagenes/Mermas.jpg" class="img-thumbnail" alt="Merma conocida" width="300" height="320" onclick="location.href='merma_con.jsp'"> <br><br>
                 <button type="button" style="background-color: #9F150D" class="btn btn-danger" onclick="location.href='merma_con.jsp'">Merma conocida</button>
           </div>
                    <div class="form-style-5" id="desc" >
                <img src="../imagenes/Tyco-Storefront-Visibility.jpg" class="img-thumbnail" alt="Merma desconocida" width="300" height="320" onclick="location.href='merma_desc.jsp'"><br><br> 
                 <button type="button" style="background-color: #9F150D" class="btn btn-danger" onclick="location.href='merma_desc.jsp'">Merma desconocida</button>
                    </div>
                </center>  
        </div>
            </div>
         <!-- Modal AGREGAR PRODUCTOS-->
        <div class="modal fade" id="agregaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Agregar producto</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
		<form method="POST" action="../../insertar_merma" onsubmit="return InsertarMe()">
               
                         <span id="titulo"><span class="number">1</span>Inserte el Id del producto (Nota: el id debe existir)</span>
                         <br><span>Id de producto:&nbsp;&nbsp;</span><span ><input type="text" name="id_producto" id="id_producto" placeholder="##########" maxlength="13" pattern="[0-9]{13}" title="El id de producto debe ser de 13 digitos (n&uacute;meros)" required="required"/></span>
                            <span id="titulo"><span class="number">2</span>Inserte Datos</span>
                            <br><br><span >Fecha de merma:&nbsp;&nbsp;</span><span><input type="text" name="fecha_mer" id="fecha_mer" disabled/></span>
                            <label>Tipo de merma:</label>
                            <select id="tipo_merma" name="tipo_merma" required="required">
                            <optgroup label="Merma">
                                <option value="MermaConocida">Merma Conocida </option>
                                <option value="MermaDesconocida">Merma Desconocida </option>
                            </optgroup>
                            </select>
                                <span>Cantidad merma:&nbsp;&nbsp;</span><span><input type="number" id="cant_mer" name="cant_mer" placeholder="1" min="1" max="999999999" pattern="[0-9]{1,999999999}" title="La cantidad merma debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/></span>
                                <span >Observaciones:&nbsp;&nbsp;</span><span><input type="text" id="motivo_mer" name="motivo_mer"  placeholder="Comentarios" maxlength="150" pattern="[A-Za-z0-9]{1,150}" title="El motivo debe contener de 1 a 150 car&aacute;cteres (n&uacute;meros y letras))" required="required"/></span><br><br>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Ingresar" id="IngresarM" onsubmit="return InsertarMe() location.href='merma.jsp'"><br>
                    </form>
                </div>
              </div>
             
            </div>
          </div>
        </div>
          <!-- Modal MODIFICAR PRODUCTOS-->
        <div class="modal fade" id="ModificaProductos" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Modificar Producto</h4>
              </div>
              <div class="modal-body">
                <div class="form-style-5">
                    <form method="POST" action="../../Modificar_Merma" onsubmit="return formularioModifica()">
                            <span id="titulo"><span class="number">1</span>Inserte el id del merma a modificar (Nota: el id debe existir)</span>
                            <br><br><span>ID de merma:&nbsp;&nbsp;</span><span ><input type="text" name="id_merma" id="id_merma" placeholder="##########" maxlength="7" pattern="[0-9]{7}" title="El id de merma debe ser de 7 digitos (n&uacute;meros)"/></span>
                            <span id="titulo"><span class="number">2</span>Inserte Datos a modificar</span>
                            <br><label>Tipo de merma:</label>
                            <select id="tipo_merma" name="tipo_merma" required="required">
                            <optgroup label="Merma">
                                <option value="MermaConocida">Merma Conocida </option>
                                <option value="MermaDesconocida">Merma Desconocida </option>
                            </optgroup>
                            </select>
                                <br><span>Cantidad de merma:&nbsp;&nbsp;</span><span><input type="number" id="cant_mer" name="cant_mer" placeholder="1" min="1" max="999999999" pattern="[0-9]{1,999999999}" title="La cantidad merma debe contener almenos 1 producto (campo n&uacute;merico)" required="required"/></span>
                                <span >Observaciones:&nbsp;&nbsp;</span><span><input type="text" id="motivo_mer" name="motivo_mer" pattern="[A-Za-z0-9]{1,150}" title="Debe contener de 1 a 150 car&aacute;cteres" placeholder="Comentarios" required="required" /></span><br><br>
                                <br><br><button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" style="background-color: #9F150D" class="btn btn-danger" value="Modificar" id="ModificarM" onclick="return formularioModifica() location.href='merma.jsp'"><br>
                    
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
