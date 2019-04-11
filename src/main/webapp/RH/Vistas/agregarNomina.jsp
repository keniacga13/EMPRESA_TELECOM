<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete='off' method="POST" id="formAgregarNomina" onsubmit="return agregarNomina();" action="../../Servlet_agregarNomina">
                <table style="margin: 0 auto;">
                    <tr><td align='center' colspan='2'><h1 style='text-align:center;'>AGREGAR&nbsp;UNA&nbsp;N&Oacute;MINA</h1></td></tr>
                    <tr><td align='left'><label>Empresa: &nbsp; </label></td><td><input type='text' id='empresa' name='empresa' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Fecha&nbsp;de&nbsp;Creaci&oacute;n:&nbsp;</label></td><td><input type='date' id='fechaCreacion' name='fechaCreacion' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Fecha&nbsp;L&iacute;mite&nbsp;de&nbsp;cobro:&nbsp;</label></td><td><input type='date' id='fechaLimite' name='fechaLimite' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>ID&nbsp;de&nbsp;Empleado:&nbsp;</label></td><td><input type='number' id='idEmpleado' name='idEmpleado' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Percepciones:&nbsp; </label></td><td><input type='number' id='percepciones' name='percepciones' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Deducciones:&nbsp; </label></td><td><input type='number' id='deducciones' name='deducciones' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>D&iacute;as&nbsp;Pagados:&nbsp; </label></td><td><input type='number' id='diasPagados' name='diasPagados' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Sueldo por d&iacute;a</label></td><td><input type='number' id='contratarSueldoDiario' name='contratarSueldoDiario' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Forma&nbsp;de&nbsp;Pago:&nbsp;</label></td><td><input type='text' id='formaPago' name='formaPago' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='center'><input type='submit' class='btn text-white boton' value='Aceptar'></td><td align='center'><input type='reset' class='btn text-white boton' value='Reiniciar'></td></tr>
                </table>
            </form>
    </td></tr>
</table>
