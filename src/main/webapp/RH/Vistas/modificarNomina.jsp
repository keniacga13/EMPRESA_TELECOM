<div>
    <table class='tabla'>
        <tr>
            <td align='center' class='form-group'>
                <form autocomplete='off' id="formModNomina" method="POST" action="../../Servlet_modBuscaNomina">
                    <h1 style='text-align: center;'>MODIFICAR&nbsp;N&Oacute;MINA</h1>
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>ID&nbsp;de&nbsp;N&oacute;mina: &nbsp;</td>
                            <td><input type='number' min="1" name="modificarIdNomina" id='modificarIdNomina' class='form-control form-control-sm' required="required"></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" id="modificarBuscaNomina" class='btn text-white boton' value="Buscar"/></td>
                            <td></td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
<div id="modNominaResultado" style="display: none;">
    <form autocomplete="off" method="POST" id="formGuardarModNomina" action="../../Servlet_modificarNomina">
        <table style="margin: 0 auto;">
            <tr>
                <td colspan="2"><input type="text" id="modificarNominaIdResultado" name="modificarNominaIdResultado" class='form-control form-control-sm' required="required"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre&nbsp;de&nbsp;la&nbsp;empresa:&nbsp;</td>
                <td><input type='text' id='modificarNominaEmpresa' name='modificarNominaEmpresa' class='form-control form-control-sm' required="required"></td></tr>
            <tr>
                <td>Fecha&nbsp;de&nbsp;Creaci&oacute;n:&nbsp;</td>
                <td><input type='date' id='modificarNominaFechaCreacion' name='modificarNominaFechaCreacion' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Fecha&nbsp;l&iacute;mite&nbsp;de&nbsp;pago:&nbsp;</td>
                <td><input type='date' id='modificarNominaFechaLimite' name='modificarNominaFechaLimite' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Id&nbsp;de&nbsp;Empleado:&nbsp;</td>
                <td><input type='number' min="1" id='modificarNominaIdEmpleado' name='modificarNominaIdEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>                    
            <tr>
                <td>Percepciones:&nbsp;</td>
                <td><input type='number' min="88.90" id='modificarNominaPercepciones' name='modificarNominaPercepciones' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Deducciones:&nbsp;</td>
                <td><input type='number' min="0.00" id='modificarNominaDeducciones' name='modificarNominaDeducciones' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>D&iacute;as&nbsp;pagados:&nbsp;</td>
                <td><input type='number' min="1" id='modificarNominaDias' name='modificarNominaDias' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Sueldo&nbsp;diario</td>
                <td><input type='number' min="88.90" id='modificarNominaPagoDias' name='modificarNominaPagoDias' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Pago&nbsp;total:&nbsp;</td>
                <td><input type='number' min="88.90" id='modificarNominaTotal' name='modificarNominaTotal' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Forma&nbsp;de&nbsp;pago:&nbsp;</td>
                <td><input type='text' id='modificarNominaPago' name='modificarNominaPago' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td colspan='2' align='center'><input type='submit' id="modificacionesNomina" class='btn text-white boton' value='Guardar'></td>
            </tr>
        </table>
    </form>
</div>