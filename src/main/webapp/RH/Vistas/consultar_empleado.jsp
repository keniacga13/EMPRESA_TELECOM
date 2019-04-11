<%-- 
    Document   : consultar_empleado
    Created on : 5/05/2018, 12:24:36 PM
    Author     : Josafat Rosas Ortiz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<form autocomplete='off' method="POST" id="formConsultarEmpleado" action="../../Servlet_consultarEmpleado">
    <table style="margin: 0 auto;">
        <tr><td align="center">
                <select name="area" id="area" class="form-control form-control-sm"><!-- Lista para seleccion de area -->
                    <option value="" selected="selected">Selecciona&nbsp;un&nbsp;&aacute;rea...</option>
                    <option value="Recursos Humanos">Recursos&nbsp;Humanos</option>
                    <option value="Ventas">Ventas</option>
                    <option value="Compras">Compras</option>
                    <option value="Inventarios">Inventario</option>
                    <option value="Contabilidad">Contabilidad</option>
                    <option value="Gerencia">Gerencia</option>
                </select>
       </td></tr>
    </table>
    <table style="margin: 0 auto;">
        <tr><td align="center">ID&nbsp;empleado:<input type="text" id="id_empleado" name="id_empleado" class="form-control form-control-sm"></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center">Mostrar</td></tr></table>
    <table style="margin: 0 auto;"><!-- Diferentes filtros para mostrar datos -->
        <tr><td><input type="checkbox" id="direccion" name="mostrar[]" value="direccion_emp"></td><td><label class="form-check-label" for="direccion">&nbsp;Direcci&oacute;n</label></td></tr>
        <tr><td><input type="checkbox" id="rfc" name="mostrar[]" value="rfc_emp"></td><td><label class="form-check-label" for="rfc">RFC</label></td></tr>
        <tr><td><input type="checkbox" id="telefono" name="mostrar[]" value="telefono_emp"></td><td><label class="form-check-label" for="telefono">Tel&eacute;fono</label></td></tr>
        <tr><td><input type="checkbox" id="licencia" name="mostrar[]" value="licencia_medica"></td><td><label class="form-check-label" for="licencia">Licencia&nbsp;m&eacute;dica</label></td></tr>
        <tr><td><input type="checkbox" id="edo_civil" name="mostrar[]" value="edo_civil_emp"></td><td><label class="form-check-label" for="edo_civil">Estado&nbsp;civil</label></td></tr>
        <tr><td><input type="checkbox" id="sueldo" name="mostrar[]" value="sueldo_emp"></td><td><label class="form-check-label" for="sueldo">Sueldo</label></td></tr>
        <tr><td><input type="checkbox" id="cargo" name="mostrar[]" value="cargo_emp"></td><td><label class="form-check-label" for="cargo">Cargo</label></td></tr>
        <tr><td><input type="checkbox" id="area_emp" name="mostrar[]" value="area_emp"></td><td><label class="form-check-label" for="area_emp">&Aacute;rea</label></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center">Ordenar&nbsp;por...</td></tr></table>
    <table style="margin: 0 auto;">
        <tr><td><input type="radio" id="orden_alfabeto" name="ordenar" value="alfabeto"></td><td><label class="form-check-label" for="orden_alfabeto">&nbsp;Orden&nbsp;alfab&eacute;tico</label></td></tr>
        <tr><td><input type="radio" id="orden_area" name="ordenar" value="area"></td><td><label class="form-check-label" for="orden_area">&nbsp;Orden&nbsp;por&nbsp;&aacute;rea</label></td></tr>
    </table>
    <table style="margin: 0 auto;"><tr><td align="center"><input type="submit" id="consulta" class="btn text-white boton" value="Consultar"></td></tr></table>
</form>

