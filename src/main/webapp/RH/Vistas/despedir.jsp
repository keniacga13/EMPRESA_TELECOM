<table class='tabla'>
    <tr><td align='center' class='form-group'>
            <form autocomplete='off' method="POST" id="formdespedirEmpleado" action="../../Servlet_despedirEmpleado" >
                <table style="margin: 0 auto;" >
                    <tr><td colspan='2' align='center'><h1>DESPIDO</h1></td></tr>
                    <tr><td>ID&nbsp;empleado</td><td><input type='number' id='despedirIdEmpleado' name='despedirIdEmpleado' class='form-control form-control-sm' required></td></tr>
                    <tr><td>Fecha</td><td><input type='date' id='despedirFecha' name='despedirFecha' class='form-control form-control-sm' required></td></tr>
                    <tr><td>Motivo</td><td><textarea rows='5' id='despedirMotivo' name='despedirMotivo' class='form-control form-control-sm' required></textarea></td></tr>
                    <tr><td align='center'><input type='submit' class='btn text-white boton' value='Aceptar'></td><td align='center'><input type='reset' class='btn text-white boton' value='Reiniciar'></td></tr>
                </table>
            </form>
    </td></tr>
</table>
