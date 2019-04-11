<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete='off' method="POST" id="formAgregarTarea" onsubmit="return agregarTarea();" >
                <table style="margin: 0 auto;">
                    <tr><td align='center' colspan='2'><h1 style='text-align:center;'>AGREGAR&nbsp;UNA&nbsp;TAREA</h1></td></tr>
                    <tr><td align='left'><label>Nombre&nbsp;de&nbsp;la&nbsp;Tarea:&nbsp;</label></td><td><input type='text' id='agregarNombreTarea' name='agregarNombreTarea' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>ID&nbsp;del&nbsp;Empleado:&nbsp;</label></td><td><input type='number' id='agregarResponsable' name='agregarResponsable' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Fecha&nbsp;de&nbsp;Inicio:&nbsp;</label></td><td><input type='date' id='agregarFechaInicio' name='agregarFechaInicio' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='left'><label>Fecha&nbsp;de&nbsp;Fin:&nbsp;</label></td><td><input type='date' id='agregarFechaFin' name='agregarFechaFin' class='form-control form-control-sm' required></td></tr>
                    <tr><td align='center' colspan='2'><input type='submit' class='btn text-white boton' id="agregar_tarea" name='agregar_tarea' value='Agregar'></td></tr>
                </table>
            </form>
    </td></tr>
</table>

