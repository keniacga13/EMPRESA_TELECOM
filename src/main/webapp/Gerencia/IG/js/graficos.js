var miPastel = function (canvasId, width, height, valores) {
    this.canvas = document.getElementById(canvasId);
    ;
    this.canvas.width = width;
    this.canvas.height = height;
    this.radio = Math.min(this.canvas.width / 2, this.canvas.height / 2)
    this.context = this.canvas.getContext("2d");
    this.valores = valores;
    this.tamanoDonut = 0;

    /**
     * Dibuja un gráfico de pastel
     */
    this.dibujar = function () {
        this.total = this.getTotal();
        var valor = 0;
        var inicioAngulo = 0;
        var angulo = 0;

        // creamos los quesos del pastel
        for (var i in this.valores)
        {
            valor = valores[i]["valor"];
            color = valores[i]["color"];
            angulo = 2 * Math.PI * valor / this.total;

            this.context.fillStyle = color;
            this.context.beginPath();
            this.context.moveTo(this.canvas.width / 2, this.canvas.height / 2);
            this.context.arc(this.canvas.width / 2, this.canvas.height / 2, this.radio, inicioAngulo, (inicioAngulo + angulo));
            this.context.closePath();
            this.context.fill();
            inicioAngulo += angulo;
        }
    }

    /**
     * Dibuja un gráfico de tecometro
     */
    this.dibujaTaco = function () {
        this.total = this.getTotal();
        var valor = 0;
        var inicioAngulo = 6.3;
        var angulo = 6.3;

        // creamos los quesos del pastel
        for (var i in this.valores)
        {
            valor = valores[i]["valor"];
            color = valores[i]["color"];
            angulo = 2 * Math.PI * valor / this.total;

            this.context.fillStyle = color;
            this.context.beginPath();
            this.context.moveTo(this.canvas.width / 2, this.canvas.height / 2);
            this.context.arc(this.canvas.width / 2, this.canvas.height / 2, this.radio, inicioAngulo / 2, (inicioAngulo + angulo) / 2);
            this.context.closePath();
            this.context.fill();
            inicioAngulo += angulo;
        }
    }

    /**
     * Dibuja un gráfico de pastel con una redonda en medio en modo de donut
     * Tiene que recibir:
     *	el tamaño de la redonda central (0 no hay redonda - 1 es todo)
     *	el color de la redonda
     */
    this.dibujarDonut = function (tamano, color) {
        this.tamanoDonut = tamano;
        this.dibujar();

        // creamos un circulo del color recibido en medio
        this.context.fillStyle = color;
        this.context.beginPath();
        this.context.moveTo(this.canvas.width / 2, this.canvas.height / 2);
        this.context.arc(this.canvas.width / 2, this.canvas.height / 2, this.radio * tamano, 0, 2 * Math.PI);
        this.context.closePath();
        this.context.fill();
    }


    this.dibujarTacometro = function (tamano, color) {
        this.tamanoDonut = tamano;
        this.dibujaTaco();

        // creamos un circulo del color recibido en medio
        this.context.fillStyle = color;
        this.context.beginPath();
        this.context.moveTo(this.canvas.width / 2, this.canvas.height / 2);
        this.context.arc(this.canvas.width / 2, this.canvas.height / 2, this.radio * tamano, 0, 2 * Math.PI);
        this.context.closePath();
        this.context.fill();
    }

    /**
     * Pone el tanto por ciento de cada uno de los valores
     * Tiene que recibir:
     *	el color del texto
     */
    this.ponerPorCiento = function (color) {
        var valor = 0;
        var etiquetaX = 0;
        var etiquetaY = 0;
        var inicioAngulo = 0;
        var angulo = 0;
        var texto = "";
        var incrementar = 0;

        // si hemos dibujado un donut, tenemos que incrementar el valor del radio
        // para que quede centrado
        if (this.tamanoDonut)
            incrementar = (this.radio * this.tamanoDonut) / 2;

        this.context.font = "bold 12pt Calibri";
        this.context.fillStyle = color;
        for (var i in this.valores)
        {
            valor = valores[i]["valor"];
            angulo = 2 * Math.PI * valor / this.total;

            // calculamos la posición del texto
            etiquetaX = this.canvas.width / 2 + (incrementar + this.radio / 2) * Math.cos(inicioAngulo + angulo / 2);
            etiquetaY = this.canvas.height / 2 + (incrementar + this.radio / 2) * Math.sin(inicioAngulo + angulo / 2);

            texto = Math.round(100 * valor / this.total);

            // movemos la posición unos pixels si estamos en la parte izquierda
            // del pastel para que quede mas centrado
            if (etiquetaX < this.canvas.width / 2)
                etiquetaX -= 10;

            // ponemos los valores
            this.context.beginPath();
            this.context.fillText(texto + "%", etiquetaX, etiquetaY);
            this.context.stroke();

            inicioAngulo += angulo;
        }
    }

    /**
     * Pone el tanto por ciento de cada uno de los valores
     * Tiene que recibir:
     *	el color del texto
     */
    this.ponerPorCientoTaco = function (color) {
        var valor = 0;
        var etiquetaX = 0;
        var etiquetaY = 0;
        var inicioAngulo = 3.1;
        var angulo = 3.1;
        var texto = "";
        var incrementar = 0;

        // si hemos dibujado un donut, tenemos que incrementar el valor del radio
        // para que quede centrado
        if (this.tamanoDonut)
            incrementar = ((this.radio * this.tamanoDonut) / 2) / 2;

        this.context.font = "bold 12pt Calibri";
        this.context.fillStyle = color;
        for (var i in this.valores)
        {
            valor = valores[i]["valor"];
            angulo = (2 * Math.PI * valor / this.total) / 2;

            // calculamos la posición del texto
            etiquetaX = this.canvas.width / 2 + (incrementar + this.radio / 2) * Math.cos(inicioAngulo + angulo / 2);
            etiquetaY = this.canvas.height / 2 + (incrementar + this.radio / 2) * Math.sin(inicioAngulo + angulo / 2);

            texto = Math.round(100 * valor / this.total);

            // movemos la posición unos pixels si estamos en la parte izquierda
            // del pastel para que quede mas centrado
            if (etiquetaX < this.canvas.width / 2)
                etiquetaX -= 10;

            // ponemos los valores
            this.context.beginPath();
            this.context.fillText(texto + "%", etiquetaX, etiquetaY);
            this.context.stroke();

            inicioAngulo += angulo;
        }
    }





    /**
     * Function que devuelve la suma del total de los valores recibidos en el array
     */
    this.getTotal = function () {
        var total = 0;
        for (var i in this.valores)
        {
            total += valores[i]["valor"];
        }
        return total;
    }

    /**
     * Función que devuelve una lista (<ul><li>) con la leyenda
     * Tiene que recibir el id donde poner la leyenda
     */
    this.ponerLeyenda = function (leyendaId) {
        var codigoHTML = "<br><ul class='leyenda'>";

        for (var i in this.valores)
        {
            codigoHTML += "<li><span style='background-color:" + valores[i]["color"] + "'></span>" + i + "</li>";
        }
        codigoHTML += "</ul>";
        document.getElementById(leyendaId).innerHTML = codigoHTML;
    }
    
    
    
    
    
    
    
}

// definimos los valores de nuestra gráfica
var valoresInventario = {
    "Compras": {valor: 10, color: "blue"},
    "Ventas": {valor: 23, color: "red"},
    "Contabilidad": {valor: 18, color: "green"},
    "Inventarios": {valor: 12, color: "Orange"},
    "RH": {valor: 30, color: "Cyan"}
}

// definimos los valores de nuestra gráfica
var valoresRH = {
    "Compras": {valor: 15, color: "blue"},
    "Ventas": {valor: 20, color: "red"},
    "Contabilidad": {valor: 5, color: "green"},
    "Inventarios": {valor: 25, color: "Orange"},
    "RH": {valor: 5, color: "Cyan"}
}

// definimos los valores de nuestra gráfica


var valoresContabilidad = {
    "Pasivos": {valor: 60, color: "blue"},
    "Activos": {valor: 40, color: "red"}
}


// generamos el segundo pastel
var pastel = new miPastel("inventarioGrafico", 250, 250, valoresInventario);
pastel.dibujarDonut(0.7, "white");
pastel.ponerPorCiento("black");
pastel.ponerLeyenda("leyendaINV");

// generamos el segundo pastel
var paste2 = new miPastel("rhGrafico", 250, 250, valoresRH);
paste2.dibujarDonut(0.7, "white");
paste2.ponerPorCiento("black");
paste2.ponerLeyenda("leyendaRH");

// generamos el segundo pastel
var paste3 = new miPastel("contabilidadGrafico", 250, 250, valoresContabilidad);
paste3.dibujarTacometro(0.9, "white");
paste3.ponerPorCientoTaco("black");
paste3.ponerLeyenda("leyendaCONT");