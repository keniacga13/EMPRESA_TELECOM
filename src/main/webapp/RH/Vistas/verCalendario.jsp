<style>
    #calendar {
        font-family:Arial;
        font-size:12px;
        width: 100%;
        height: 200px;
        
    }
    #calendar caption {
        text-align:left;
        padding:5px 10px;
        background-color:#9F150D;
        color:#fff;
        font-weight:bold;
        font-size:medium;
    }
    #calendar caption div:nth-child(1) {float:left;}
    #calendar caption div:nth-child(2) {float:right;}
    #calendar caption div:nth-child(2) a {cursor:pointer;}
    #calendar th {
        background-color:#9F150D;
        color:#fff;
        width:40px;
    }
    #calendar td {
        text-align:right;
        padding:2px 5px;
        background-color:silver;
    }
    #calendar .hoy {
        background-color:red;
    }
</style>
<div id="calendario" >
    <center><h1>Calendario</h1></center>
    <br>
    <table id="calendar"  border="1">
        <caption></caption>
        <thead>
            <tr>
                <th>Lun</th><th>Mar</th><th>Mie</th><th>Jue</th><th>Vie</th><th>Sab</th><th>Dom</th>
            </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<script>
    var actual = new Date();
    function mostrarCalendario(year, month)
    {
        var now = new Date(year, month - 1, 1);
        var last = new Date(year, month, 0);
        var primerDiaSemana = (now.getDay() == 0) ? 7 : now.getDay();
        var ultimoDiaMes = last.getDate();
        var dia = 0;
        var resultado = "<tr bgcolor='silver'>";
        var diaActual = 0;
        console.log(ultimoDiaMes);

        var last_cell = primerDiaSemana + ultimoDiaMes;

        // hacemos un bucle hasta 42, que es el m�ximo de valores que puede
        // haber... 6 columnas de 7 dias
        for (var i = 1; i <= 42; i++)
        {
            if (i == primerDiaSemana)
            {
                // determinamos en que dia empieza
                dia = 1;
            }
            if (i < primerDiaSemana || i >= last_cell)
            {
                // celda vacia
                resultado += "<td>&nbsp;</td>";
            } else {
                // mostramos el dia
                if (dia == actual.getDate() && month == actual.getMonth() + 1 && year == actual.getFullYear())
                    resultado += "<td class='hoy'>" + dia + "</td>";
                else
                    resultado += "<td>" + dia + "</td>";
                dia++;
            }
            if (i % 7 == 0)
            {
                if (dia > ultimoDiaMes)
                    break;
                resultado += "</tr><tr>\n";
            }
        }
        resultado += "</tr>";

        var meses = Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");

        // Calculamos el siguiente mes y a�o
        nextMonth = month + 1;
        nextYear = year;
        if (month + 1 > 12)
        {
            nextMonth = 1;
            nextYear = year + 1;
        }

        // Calculamos el anterior mes y a�o
        prevMonth = month - 1;
        prevYear = year;
        if (month - 1 < 1)
        {
            prevMonth = 12;
            prevYear = year - 1;
        }

        document.getElementById("calendar").getElementsByTagName("caption")[0].innerHTML = "<div>" + meses[month - 1] + " / " + year + "</div><div><a onclick='mostrarCalendario(" + prevYear + "," + prevMonth + ")'>&lt;</a> <a onclick='mostrarCalendario(" + nextYear + "," + nextMonth + ")'>&gt;</a></div>";
        document.getElementById("calendar").getElementsByTagName("tbody")[0].innerHTML = resultado;
    }

    mostrarCalendario(actual.getFullYear(), actual.getMonth() + 1);
</script>