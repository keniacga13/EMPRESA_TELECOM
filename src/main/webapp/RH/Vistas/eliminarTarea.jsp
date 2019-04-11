<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete="off" method="POST" id="formEliminarTarea"  onsubmit='return eliminarTarea();'>
                <table style="margin: 0 auto;">
                    <tr><td align='center' colspan='2'><h1 style='text-align:center;'>ELIMINAR&nbsp;UNA&nbsp;TAREA</h1></td></tr>
                    <tr><td align='right'><label>Id&nbsp;de&nbsp;la&nbsp;Tarea:&nbsp;</label></td><td><input type='number' id='eliminarIdTarea' name='eliminarIdTarea' class='form-control form-control-sm'></td></tr>
                    <tr><td align='right'><label>Nombre&nbsp;de&nbsp;la&nbsp;Tarea:&nbsp;</label></td><td><input type='text' id='eliminarNombreTarea' name='eliminarNombreTarea' class='form-control form-control-sm'></td></tr>
                    <tr><td align='center' colspan='2'><input type='submit' class='btn text-white boton' name='eliminar' value='Eliminar'></td></tr>
                </table>
            </form>
    </td></tr>
</table>
