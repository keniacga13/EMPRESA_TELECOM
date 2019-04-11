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
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Principal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>  
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>  
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
        <link href="../css/laterales.css" rel="stylesheet" type="text/CSS">
        <link rel="stylesheet" type="text/css" href="../css/tablacliente.css">
        <script src="../js/general.js"></script>
        <script>
            function fecha() {
                var valor = document.getElementById('fecha');
                var fecha = new Date();
                var dia;
                var mes;
                if (fecha.getDate() < 10) {
                    dia = '0' + fecha.getDate();
                } else {
                    dia = fecha.getDate();
                }
                if (fecha.getMonth() + 1 < 10) {
                    mes = '0' + (fecha.getMonth() + 1);
                } else {
                    mes = fecha.getMonth() + 1;
                }
                valor.value = (dia + '/' + mes + '/' + fecha.getFullYear());
                document.getElementById('fecha').innerHTML = valor.value;
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
                        <center>
                            <h4>Estad&iacute;sticas de inventario</h4>  
                        </center>
                    </div>

                    <div class="form-style-5">
                        <form>
                            <span id="titulo"><span class="number">1</span>Gr&aacute;fica:</span><br><br>
                            <label style="font-size: 18px" class="form-check-label">
                                Total de productos: <input type="text" disabled="disable" placeholder="12500" name="TotalPro" id="TotalPro"> 
                                Porcentaje de Merma: <input type="text" disabled="disable" placeholder="30%" name="PorcenProP" id="PorcenMerm"> 
                                Porcentaje de Devoluciones: <input type="text" disabled="disable" placeholder="20%" name="PorcenProP" id="PorcenDevo"> 
                                Porcentaje de compra de producto: <input type="text" disabled="disable" placeholder="30%" name="PorcenComP" id="PorcenComP"> 
                                Porcentaje de venta de producto: <input type="text" disabled="disable" placeholder="20%" name="PorcenVenP" id="PorcenVenP"> 
                            </label>
                            <br>
                            <center>
                                <button type="button" name="Actualizar" data-toggle="modal" style="background-color: #9F150D" class="btn btn-danger">Actualizar</button><br>
                            </center> 


                        </form>
                    </div>

                </div>


                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"><!-- Seccion central TABLA -->
                    <div class="form-style-5" id="cono">
                      <div style="">
	<canvas id="canvas1"></canvas>
	<div id="leyenda1" class="leyenda"></div>
</div>
 

                      
                      <script>
/**
 * Clase para generar graficos de pastel
 * Tiene que recibir:
 *	el id del canvas
 *	la anchura y altura del canvas
 *	un array con los valores a mostrar del tipo:
 *		var valores={
 *			"Access":	{valor:10,color:"blue"},
 *			"PHP":		{valor:23,color:"red"},
 *			"Python":	{valor:18,color:"green"},
 *			".NET":		{valor:12,color:"Orange"},
 *			"C++":		{valor:30,color:"Cyan"}
 *		}
 */
var miPastel=function(canvasId,width,height,valores) {
	this.canvas=document.getElementById(canvasId);;
	this.canvas.width=width;
	this.canvas.height=height;
	this.radio=Math.min(this.canvas.width/2,this.canvas.height/2)
	this.context=this.canvas.getContext("2d");
	this.valores=valores;
	this.tamanoDonut=0;
 
	/**
	 * Dibuja un gráfico de pastel
	 */
	this.dibujar=function() {
		this.total=this.getTotal();
		var valor=0;
		var inicioAngulo=0;
		var angulo=0;
 
		// creamos los quesos del pastel
		for(var i in this.valores)
		{
			valor=valores[i]["valor"];
			color=valores[i]["color"];
			angulo=2*Math.PI*valor/this.total;
 
			this.context.fillStyle=color;
			this.context.beginPath();
			this.context.moveTo(this.canvas.width/2, this.canvas.height/2);
			this.context.arc(this.canvas.width/2, this.canvas.height/2, this.radio, inicioAngulo, (inicioAngulo+angulo));
			this.context.closePath();
			this.context.fill();
			inicioAngulo+=angulo;
		}
	}
 
	/**
	 * Dibuja un gráfico de pastel con una redonda en medio en modo de donut
	 * Tiene que recibir:
	 *	el tamaño de la redonda central (0 no hay redonda - 1 es todo)
	 *	el color de la redonda
	 */
	this.dibujarDonut=function(tamano,color) {
		this.tamanoDonut=tamano;
		this.dibujar();
 
		// creamos un circulo del color recibido en medio
		this.context.fillStyle=color;
		this.context.beginPath();
		this.context.moveTo(this.canvas.width/2, this.canvas.height/2);
		this.context.arc(this.canvas.width/2, this.canvas.height/2, this.radio*tamano, 0, 2*Math.PI);
		this.context.closePath();
		this.context.fill();
	}
 
	/**
	 * Pone el tanto por ciento de cada uno de los valores
	 * Tiene que recibir:
	 *	el color del texto
	 */
	this.ponerPorCiento=function(color){
		var valor=0;
		var etiquetaX=0;
		var etiquetaY=0;
		var inicioAngulo=0;
		var angulo=0;
		var texto="";
		var incrementar=0;
 
		// si hemos dibujado un donut, tenemos que incrementar el valor del radio
		// para que quede centrado
		if(this.tamanoDonut)
			incrementar=(this.radio*this.tamanoDonut)/2;
 
		this.context.font="bold 12pt Calibri";
		this.context.fillStyle=color;
		for(var i in this.valores)
		{
			valor=valores[i]["valor"];
			angulo=2*Math.PI*valor/this.total;
 
			// calculamos la posición del texto
			etiquetaX=this.canvas.width/2+(incrementar+this.radio/2)*Math.cos(inicioAngulo+angulo/2);
			etiquetaY=this.canvas.height/2+(incrementar+this.radio/2)*Math.sin(inicioAngulo+angulo/2);
 
			texto=Math.round(100*valor/this.total);
 
			// movemos la posición unos pixels si estamos en la parte izquierda
			// del pastel para que quede mas centrado
			if(etiquetaX<this.canvas.width/2)
				etiquetaX-=10;
 
			// ponemos los valores
			this.context.beginPath();
			this.context.fillText(texto+"%", etiquetaX, etiquetaY);
			this.context.stroke();
 
			inicioAngulo+=angulo;
		}
	}
 
	/**
	 * Function que devuelve la suma del total de los valores recibidos en el array
	 */
	this.getTotal=function() {
		var total=0;
		for(var i in this.valores)
		{
			total+=valores[i]["valor"];
		}
		return total;
	}
 
	/**
	 * Función que devuelve una lista (<ul><li>) con la leyenda
	 * Tiene que recibir el id donde poner la leyenda
	 */
	this.ponerLeyenda=function(leyendaId) {
		var codigoHTML="<ul class='leyenda'>";
 
		for(var i in this.valores)
		{
			codigoHTML+="<li><span style='background-color:"+valores[i]["color"]+"'></span>"+i+"</li>";
		}
		codigoHTML+="</ul>";
		document.getElementById(leyendaId).innerHTML=codigoHTML;
	}
}
 
// definimos los valores de nuestra gráfica
var valores={
	"Merma 30%":{valor:30,color:"blue"},
	"Devoluciones 20%":{valor:20,color:"red"},
	"Existencia 50%":{valor:50,color:"green"},
	
}
 
// generamos el primer pastel
var pastel=new miPastel("canvas1",300,300,valores);
pastel.dibujar();
pastel.ponerPorCiento("white");
pastel.ponerLeyenda("leyenda1");
 
// generamos el segundo pastel
var pastel=new miPastel("canvas2",300,300,valores);
pastel.dibujarDonut(0.5,"white");
pastel.ponerPorCiento("white");
pastel.ponerLeyenda("leyenda2");
</script>
                      
                      
                      <br>
                    </div>

                </div>
                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"><!-- Seccion derecha -->
                    <div class="form-style-5">
                        <center>
                            <h4>Informaci&oacute;n de la empresa:</h4> 
                        </center>

                    </div>

                    <div class="form-style-5">

                        <form>
                            <table style="width:100%;height:10%;"><tr><td align="center"><input type="text" id="fecha" size="6" disabled></td></tr></table>
                            <center><label style="font-size: 18px" class="form-check-label">&Aacute;rea: Inventario&nbsp;&nbsp;&nbsp;&nbsp;<img src="../imagenes/persona.png" width="50" height="50" alt=''></label></center>

                        </form>
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
