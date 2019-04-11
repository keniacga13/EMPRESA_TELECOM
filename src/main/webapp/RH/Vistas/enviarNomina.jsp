<%@page import="pw.sap.db.Conexion" %>
<%@page import="java.util.ArrayList" %>
<% 
    Conexion c = new Conexion();
    ArrayList lista = c.pendienteNomina();
%>
<form autocomplete="off" id="formEnviarNomina" name="formEnviarNomina" method="POST" action="../../ServiceNomina">
    <table style="margin: 0 auto;">
        <tr>
            <td>URL</td><td align="center"><input type="text" id="url" name="url" class="form-control form-control-sm"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" id="servicioNomina" name="servicioNomina" class="btn text-white boton" value="Enviar"/>
            </td>
        </tr>
    </table>
    <div>
        <table class="tabla table-bordered">
            <tr>
                <td align="center">Seleccionar&nbsp;n&oacute;mina</td>
                <td align="center">Empleado</td>
                <td align="center">Cuenta</td>
                <td align="center">Monto</td>
                <td align="center">Estado</td>
            </tr>
            <tr>
                <%
                    for(int i = 0 ; i < lista.size() ; i++){
                        if(i%5==0 && i!=0){out.println("</tr><tr>");}
                        if(i%5==0){
                            out.print("<td  align='center'><input type='checkbox' name='nominasPendiente' value="+lista.get(i)+" /></td>");
                        }else{
                            out.print("<td  align='center'>"+lista.get(i)+"</td>");
                        }
                    }
                %>
            </tr>
        </table>
    </div>
</form>