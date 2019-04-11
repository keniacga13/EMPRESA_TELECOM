<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete='off' method="POST" id="formContratarEmpleado" onsubmit="return validarContratar();">
            <table style="margin: 0 auto;">
                <tr><td colspan='2' align='center'><h1>CONTRATACI&Oacute;N</h1></td></tr>
                
                <tr><td>Nombre</td><td><input type='text' id='contratarNombre' name='contratarNombre' class='form-control form-control-sm' required></td></tr>
                <tr><td>Apellido</td><td><input type='text' id='contratarApellido' name='contratarApellido' class='form-control form-control-sm' required></td></tr>
                <tr><td>Direcci&oacute;n</td><td><input type='text' id='contratarDireccion' name='contratarDireccion' class='form-control form-control-sm' required></td></tr>
                <tr><td>RFC</td><td><input type='text' id='contratarRfc' name='contratarRfc' class='form-control form-control-sm' required></td></tr>
                <tr><td>Tel&eacute;fono</td><td><input type='number' id='contratarTelefono' name='contratarTelefono' class='form-control form-control-sm' required></td></tr>
                <tr><td>Estado&nbsp;civil</td>
                    <td><select id='contratarEdocivil' name="contratarEdocivil" class='form-control form-control-sm' required>
                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                            <option value='Casado(a)'>Casado(a)</option>
                            <option value='Viudo(a)'>Viudo(a)</option>
                            <option value='Soltero(a)'>Soltero(a)</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Licencia M&eacute;dica</td><td><input type='text' id='contratarlicenciaMedica' name='contratarlicenciaMedica' class='form-control form-control-sm' required></td></tr>

                <tr><td>Sueldo</td><td><input type='number' id='contratarSueldo' name='contratarSueldo' class='form-control form-control-sm' required></td></tr>
                <tr><td>Cuenta</td><td><input type='text' id='cuenta' name='cuenta' class='form-control form-control-sm' required></td></tr>               
                <tr><td>&Aacute;rea</td>
                    <td><select id='contratarArea' name="contratarArea" class='form-control form-control-sm' required>
                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;opci&oacute;n...</option>
                            <option value='Recursos Humanos'>Recursos Humanos</option>
                            <option value='Contabilidad'>Contabilidad</option>
                            <option value='Gerencia'>Gerencia</option>
                            <option value='Inventarios'>Inventarios</option>
                            <option value='Compras'>Compras</option>
                            <option value='Ventas'>Ventas</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Cargo</td>
                    <td><select id='contratarCargo' name="contratarCargo" class='form-control form-control-sm' required>
                            <option value='' selected='selected'>Selecciona&nbsp;una&nbsp;cargo...</option>
                            <option value='Administrador'>Administrador</option>
                            <option value='Empleado'>Empleado</option>
                            <option value='Jefe'>Jefe</option>
                            <option value='Gerente'>Gerente</option>
                        </select>
                    </td>
                </tr>
                <tr><td align='center'><input type='submit' value='Finalizar' class='btn text-white boton'></td><td align='center'><input type='reset' value='Reiniciar' class='btn text-white boton'></td></tr>
            </table>
        </form>
    </td></tr>
</table>
