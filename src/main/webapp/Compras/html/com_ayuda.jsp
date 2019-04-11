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
        <title>Compras/Ayuda</title>
        <meta charset="UTF-8">
	<link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="../css/estilos.css" rel="stylesheet" type="text/CSS">
                      
    </head>
    <body>
        <!-- BARRA NAVEGACIÓN  -->
        <header style="z-index: 2"> 
			<nav class="navbar navbar-expand-lg navbar-light menu" style="background-color: #9F150D;">
                            <a class="navbar-brand" style="color: white;" href="#"><h3>Compras/Ayuda</h3></a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span></button>
		 
			</nav>
        </header>
         
        <embed height="100%" width="100%" src="../documentos/manual_compras.pdf" type="application/pdf">
              
         
     </body>
</html>
