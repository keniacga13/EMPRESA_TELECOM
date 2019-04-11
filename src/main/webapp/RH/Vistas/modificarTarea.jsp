<div>
    <table class='tabla'>
        <tr>
            <td align='center' class='form-group'>
                <form autocomplete='off' method="POST" id="formModTarea" action="../../Servlet_modBuscaTarea">
                    <h1 style='text-align: center;'>MODIFICAR UNA TAREA</h1>
                    <table style="margin: 0 auto;">
                        <tr>
                            <td>ID&nbsp;de&nbsp;la&nbsp;tarea&nbsp;</td>
                            <td><input type='number' min="1" id='modificarIdTarea' name="modificarIdTarea" class='form-control form-control-sm' required></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center"><input type="submit" class='btn text-white boton' id="modificarBuscarTarea" value="Buscar"/></td>
                            <td></td>
                        </tr>
                    </table>
                </form>
            </td>
        </tr>
    </table>
</div>
<div id="modificaTareaResultado" style="display:none;">
    <form autocomplete="off" method="POST" id="formGuardarModTarea" action="../../Servlet_modificarTarea">
        <table style="margin: 0 auto;">
            <tr>
                <td colspan="2"><input type="number" id="modificarTareaIdResultado" name="modificarTareaIdResultado" class='form-control form-control-sm' required="required"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Nombre&nbsp;de&nbsp;la&nbsp;tarea:&nbsp;</td>
                <td><input type='text' id='modificarNombreTarea' name='modificarNombreTarea' class='form-control form-control-sm' required="required"></td>
            </tr>   
            <tr>
                <td>ID&nbsp;del&nbsp;empleado:&nbsp;</td>
                <td><input type='number' min="1" id='modificarTareaIdEmpleado' name='modificarTareaIdEmpleado' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Fecha&nbsp;de&nbsp;inicio:&nbsp;</td>
                <td><input type='date' id='modificarTareaFechaInicio' name='modificarTareaFechaInicio' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td>Fecha&nbsp;de&nbsp;fin:&nbsp;</td>
                <td><input type='date' id='modificarTareaFechaFin' name='modificarTareaFechaFin' class='form-control form-control-sm' required="required"></td>
            </tr>
            <tr>
                <td colspan='2' align='center'><input type='submit' class='btn text-white boton' value='Guardar'></td>
            </tr>
        </table>
    </form>
</div>
