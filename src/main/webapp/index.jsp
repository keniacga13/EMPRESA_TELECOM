<%-- 
    Document   : index
    Created on : 18/03/2018, 01:40:17 PM
    Author     : fgb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.getSession().invalidate(); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SAPito</title>
        <link rel="stylesheet" href="css/estilos.css"/>
        <link href="Recursos/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/bootstrap/librerias/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="Recursos/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Recursos/bootstrap/librerias/popper.min.js" type="text/javascript"></script>
        <script src="js/index.js" type="text/javascript"></script>
    </head>
    <body>
        <body onload="regreso();">
        <div class="rounded" id="login">
            <form class="rounded" id="form-login" autocomplete="off" method="POST" action="IniciarSesion">
                <fieldset class="rounded" id="campo-login">
                    <legend class="rounded"><h1>Inicio&nbsp;de&nbsp;sesi&oacute;n</h1></legend>
                    <table id="acceso">
                        <tr>
                            <td><label>Usuario:&nbsp;&nbsp;</label></td>
                            <td><input type="number" class="form-control form-control-sm" id="user" name="user" required="required" /></td>
                        </tr>
                        <tr>
                            <td><label>Contrase&ntilde;a:&nbsp;</label></td>
                            <td><input type="password" class="form-control form-control-sm" id="pswd" name="pswd" required="required" /></td>
                        </tr>
                        <tr>
                            <td align="center"><input type="submit" class="btn" id="ingresar" name="ingresar" value="Ingresar" /></td>
                            <td align="center"><input type="reset" class="btn" id="reiniciar" name="reiniciar" value="Reiniciar" /></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </body>
</html>
