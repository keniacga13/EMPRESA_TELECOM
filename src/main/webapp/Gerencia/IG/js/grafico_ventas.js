var miGrafica = function dibujarGrafica(canvasId , val, tipo) {

    canvas = document.getElementById(canvasId);
    contenido = canvas.getContext("2d");
    valores = val;

    this.dibujar = function () {
        //Cargo la imagen en la posición
         
            //Indicar el grosor de la línea
            contenido.lineWidth = 5;
            //Dibujo las líneas para simular la gráfica
            contenido.beginPath();
            contenido.moveTo(16,240);
            for (var i in valores){
                y = valores[i]["y"];
                x = valores[i]["x"];
                contenido.lineTo(x, y);
            }

            contenido.strokeStyle = "hsla(333, 71%, 53%, 1)";
            contenido.stroke();
            contenido.closePath();
            
        
    }
    
    this.ponerLeyenda = function (leyendaId) {
        var codigoHTML = "<br><ul class='leyenda'>";

        
            codigoHTML += "<li><span style='background-color: red;'></span>" + tipo + " mensuales</li>";
        
        codigoHTML += "</ul>";
        document.getElementById(leyendaId).innerHTML = codigoHTML;
    }

}

var valoresVentas = {
    "1": {x: 80, y: 100},
    "2": {x: 140, y: 150},
    "3": {x: 200, y: 170},
    "4": {x: 260, y: 190},
    "5": {x: 320, y: 150},
    "6": {x: 380, y: 100}
}

var graficaVentas = new miGrafica("ventasGrafico", valoresVentas, "Ventas");
graficaVentas.dibujar();
graficaVentas.ponerLeyenda("leyendaVENT");

