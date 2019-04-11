<div>
    <table class="tabla">
        <tr>
            <td align="center" class="form-group">
                <form autocomplete='off' id="formModEmpleado" method="POST" action="../../Servlet_modBuscarEmp">
                    <table style="margin: 0 auto;">
                        <tr><td colspan='2' align='center'><h2>MODIFICAR&nbsp;INFORMACI&Oacute;N</h2></td></tr>
                        <tr>
                            <td align="center">ID&nbsp;empleado</td>
                            <td align="left"><input type='number' min="1" id='modificarIdEmpleado' name='modificarIdEmpleado' class='form-control form-control-sm' required></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" id="modificarBuscaEmp" class='btn text-white boton' name="modificarBuscaEmp" value="Buscar"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
<div id="resultado" style="display: none;">
    <form autocomplete="off" method="POST" id="formGuardarModEmpleado" action="../../Servlet_modificarEmpleado">
        <table style="margin: 0 auto;">
            <tr>
                <td colspan="2"><input type="text" id="modificarIdResultado" name="modificarIdResultado" class='form-control form-control-sm' required="required"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre</td>
                <td><input type='text' id='modificarNombreEmpleado' name='modificarNombreEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Apellido</td>
                <td><input type='text' id='modificarApellidoEmpleado' name='modificarApellidoEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Direcci&oacute;n</td>
                <td><input type='text' id='modificarDireccionEmpleado' name='modificarDireccionEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>RFC</td>
                <td><input type='text' id='modificarRFC' name='modificarRFC' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Tel&eacute;fono</td>
                <td><input type='number' min="1" id='modificarTelefonoEmpleado' name='modificarTelefonoEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Estado&nbsp;civil</td>
                <td>
                    <select name='modificarEdocivilEmpleado' id='modificarEdocivilEmpleado' class='form-control form-control-sm' required="required">
                        <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                        <option value='Casado(a)'>Casado(a)</option>
                        <option value='Viudo(a)'>Viudo(a)</option>
                        <option value='Soltero(a)'>Soltero(a)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Licencia&nbsp;m&eacute;dica</td>
                <td><input type='text' id='modificarLicEmpleado' name='modificarLicEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Sueldo</td>
                <td><input type='number' min="88.90" id='modificarSueldoEmpleado' name='modificarSueldoEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>&Aacute;rea</td>
                <td>
                    <select name='modificarAreaEmpleado' id='modificarAreaEmpleado' class='form-control form-control-sm' required="required">
                        <option value='' selected='selected'>Selecciona&nbsp;un&nbsp;&aacute;rea...</option>
                    <option value='Recursos Humanos'>Recursos Humanos</option>
                    <option value='Contabilidad'>Contabilidad</option>
                    <option value='Gerencia'>Gerencia</option>
                    <option value='Inventarios'>Inventarios</option>
                    <option value='Compras'>Compras</option>
                    <option value='Ventas'>Ventas</option>
                    </select>
                </td>
            </tr>                           
            <tr>
                <td>Cargo</td>
                <td>
                    <select name='modificarCargoEmpleado' id='modificarCargoEmpleado' class='form-control form-control-sm' required="required">
                        <option value='' selected='selected'>Selecciona&nbsp;un&nbsp;cargo...</option>
                        <option value='Administrador'>Administrador</option>
                        <option value='Empleado'>Empleado</option>
                        <option value='Jefe'>Jefe</option>
                        <option value='Gerente'>Gerente</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Cuenta</td>
                <td><input type="number" id="modificarCuentaEmpleado" name="modificarCuentaEmpleado" class='form-control form-control-sm' required="required"/></td>
            </tr>
            <tr>
                <td>Status</td>
                <td><input type='text' id='modificarStatusEmpleado' name='modificarStatusEmpleado' class='form-control form-control-sm' disabled="disabled"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" class='btn text-white boton' id="modificacionesEmpleado" value="Guardar"/></td><td></td>
            </tr>
        </table>
    </form>
</div>