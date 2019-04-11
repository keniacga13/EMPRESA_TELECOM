<%-- 
    Document   : errorSesion
    Created on : 24/05/2018, 01:42:24 AM
    Author     : Windows 10 Pro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.getSession().invalidate(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../../Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="../../js/index.js" type="text/javascript"></script>
        <title>ERROR</title>
    </head>
    <body>
        <table style="margin: 0 auto;width: 100%; height: 100%;">
            <tr><td align="center"><h1>ERROR</h1></td></tr>
            <tr><td align="center"><h3>Se&nbsp;debe&nbsp;iniciar&nbsp;sesion&nbsp;para&nbsp;ingresar</h3></td></tr>
            <tr><td align="center"><input type="button" class="btn btn-outline-secondary" onclick="principal();" value="INICIAR SESION"/></td></tr>
        </table>
    </body>
</html>
