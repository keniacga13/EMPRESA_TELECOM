function fecha(){
    var valor = document.getElementById('fecha');
    var fecha = new Date();
    var dia;
    var mes;
    if(fecha.getDate() < 10){dia ='0'+fecha.getDate();}else{dia = fecha.getDate();}
    if(fecha.getMonth()+1 < 10){mes ='0'+(fecha.getMonth()+1);}else{mes = fecha.getMonth()+1;}
    valor.value = (dia+'/'+mes+'/'+fecha.getFullYear());
    document.getElementById('fecha').innerHTML = valor.value;
}

function cargaFiltrosEmp(){
    $.post("../Vistas/consultar_empleado.jsp",function(carga){$("#tareaActual").html(carga);});
}

function cargaFiltrosTarea(){
    $.post("../Vistas/consultar_tareas.jsp",function(carga){$("#tareaActual").html(carga);});
}

function cargaFiltrosNomina(){
    $.post("../Vistas/consultar_nomina.jsp",function(carga){$("#tareaActual").html(carga);});
}

function agregarNomina(){
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    var empresa = document.getElementById('empresa').value;
    if (numeros.test(empresa)) {
        alert('Modifique el nombre de la empresa,no es numerico');
        return false;
    }
    var fechaCreacion = document.getElementById('fechaCreacion').value;
    var fechaLimite = document.getElementById('fechaLimite').value;
    var now = moment();
    var fechac = new Date(fechaCreacion);
    var fechal = new Date(fechaLimite);
    if (fechac > now) {
        alert('la fecha de creacion  no puede ser mayor a la fecha actual');
        return false;
    }
    if (fechal < fechac) {
        alert('la fecha limite  no puede ser menor a la fecha de creacion');
        return false;
    }
    if (fechal === fechac) {
        alert('la fecha limite  no puede ser igual a la fecha de creacion');
        return false;
    }
    var idEmpleado = document.getElementById('idEmpleado').value;       
    var percepciones = document.getElementById('percepciones').value;
    if (percepciones < 0) {
        alert('Modifique las percepciones, no deben ser negativas');
        return false;
    }
    var deducciones = document.getElementById('deducciones').value;
    if (deducciones < 0) {
        alert('Modifique las deducciones, no deben ser negativas');
        return false;
    }
    var diasPagados = document.getElementById('diasPagados').value;
    if (diasPagados < 0) {
        alert('Modifique los días pagados, no deben ser negativos');
        return false;
    }
    var sueldo_dia = document.getElementById('SueldoDiario').value;
    if (sueldo_dia < 0) {
        alert('Modifique el sueldo por dia, no deben ser negativo');
        return false;
    }
     
    var formaPago = document.getElementById('formaPago').value;
    if (numeros.test(formaPago)) {
        alert('Modifique la forma de pago, no es numerico');
        return false;
    }
    $.get('../Vistas/agregarNomina.jsp', function (carga) {$('#tareaActual').html(carga);});
}

function agregarTarea(){
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    var tarea = document.getElementById('agregarNombreTarea').value;
    if (numeros.test(tarea)) {
        alert('Modifique el nombre de la tarea, no es numerico');
        return false;
    }
    var responsable = document.getElementById('agregarResponsable').value;
    if (letras.test(responsable)) {
        alert('Modifique el ID del empleado, es numerico');
        return false;
    }
    var inicio = document.getElementById('agregarFechaInicio').value;
    var fin = document.getElementById('agregarFechaFin').value;
    var now = moment();
    var fechai = new Date(inicio);
    var fechaf = new Date(fin);
    if (fechai < now) {
        alert('la fecha de inicio  no puede ser menor a la fecha actual');
        return false;
    }
    if (fechaf < fechai) {
        alert('la fecha de fin  no puede ser menor a la fecha de inicio');
        return false;
    }
    if (fechai === fechaf) {
        alert('la fecha de fin  no puede ser igual a la fecha de inicio');
        return false;
    }
    alert('Tarea creada:\n\ ID del Responsable: '+responsable+'\n\ Tarea: '+tarea+'\n\ Fecha de Inicio: '+inicio+'\n\ Fecha de termino: '+fin);
       document.forms[0].action="../../Servlet_agregarTarea";
    $.get('../Vistas/agregarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
  }

function eliminarTarea(){
    var numeros = /[0-9]/;
   
        var nombre = document.getElementById('eliminarNombreTarea').value;
        if(numeros.test(nombre)){alert('Modifique el nombre, no es numerico');return false;}
        
        var id = document.getElementById('eliminarIdTarea').value;
//    if(!(/^[a-zA-z0-9]{8}$/.test(id))){
//                alert('Favor de ingresar el ID de empleado con los 8 digitos');                
//                return false;
//            }
    if(nombre==="" && id===""){
        alert('Debe agregar el nombre o ID de la tarea a eliminar.');
    }
               document.forms[0].action="../../Servlet_eliminarTarea";
}
   
function validarContratar(){
    var numeros = /[0-9]/;
    var letras = /[A-Za-z]/;
    var nombre = document.getElementById('contratarNombre').value;
    if (numeros.test(nombre)) {
        alert('Nombre no valido');
        return false;
    }
    var apellido = document.getElementById('contratarApellido').value;
    if (numeros.test(apellido)) {
        alert('Modifique el apellido del empleado, no es numerico');
        return false;
    }
    var direccion = document.getElementById('contratarDireccion').value;
    var RFC = document.getElementById('contratarRfc').value;
    if(!(/^[a-zA-z0-9]{13}$/.test(RFC))){
                alert('Favor de ingresar el RFC con los 13 caracteres');                
                return false;
            }   
    var telefono = document.getElementById('contratarTelefono').value;
    if (telefono.length !== 10 || letras.test(telefono)) {
        alert('Modifique el numero telefonico del empleado, es de 10 digitos');
        return false;
    }
    var edocivil = document.getElementById('contratarEdocivil').value;
    var licencia = document.getElementById('contratarlicenciaMedica').value;
    var sueldo = document.getElementById('contratarSueldo').value;
    if (sueldo < 88.50) {
        alert('El sueldo debe ser mayor a $88.50');
        return false;
    }
  
    var area = document.getElementById('contratarArea').value;
    var cargo = document.getElementById('contratarCargo').value;
   document.forms[0].action="../../Servlet_contratarEmpleado";
       //alert(document.forms[0]);
   //document.forms[0].submit();
    $.get('../Vistas/contratar.jsp',function(carga){$('#tareaActual').html(carga);});
}
        
//function despedirEmpleado(){
  //  var despedirIdEmpleado = document.getElementById('despedirIdEmpleado').value;
    //var fechadespedir = document.getElementById('despedirFecha').value;
    //var despedirMotivo = document.getElementById('despedirMotivo').value;

    //var now = moment();
      //              var fechad = new Date(fechadespedir);
        //            if (fechad < now) {
          //      alert('Modifique la fecha de despido no debe ser la actual');
            //         return false;
              //   }  
                
    //alert('El empleado con ID '+despedirIdEmpleado+' '+' \n\ ha sido retirado debido a: '+despedirMotivo);
      // document.forms[0].action="../../Servlet_despedirEmpleado";

    //$.get('../Vistas/despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    
    //}
    

$(document).ready(function(){
    $('#verCalendario').click(function(){
        $.post('../Vistas/verCalendario.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#agregarTarea').click(function(){
        $.post('../Vistas/agregarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#modificarTarea').click(function(){
        $.post('../Vistas/modificarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
   
    $('#consultarTarea').click(function(){
        $.post('../Vistas/consultasTareas.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#eliminarTarea').click(function(){
        $.post('../Vistas/eliminarTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
     $('#agregarNomina').click(function(){
        $.post('../Vistas/agregarNomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
     $('#modificarNomina').click(function(){
        $.post('../Vistas/modificarNomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#consultarNomina').click(function(){
        $.post('../Vistas/consultasNomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#enviarNomina').click(function(){
        $.post('../Vistas/enviarNomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
        
    $('#contratar_empleado').click(function(){
        $.post('../Vistas/contratar.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#despedir_empleado').click(function(){
        $.post('../Vistas/despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#modificar_empleado').click(function(){
        $.post('../Vistas/modificar.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#buscar_empleado').click(function(){
        $.post('../Vistas/consultas.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_calen').click(function(){
        $.post('../Vistas/ayuda_calen.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_agTarea').click(function(){
        $.post('../Vistas/ayuda_agTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_eliTarea').click(function(){
        $.post('../Vistas/ayuda_eliTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_modTarea').click(function(){
        $.post('../Vistas/ayuda_modTarea.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_nomina').click(function(){
        $.post('../Vistas/ayuda_nomina.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_consulta').click(function(){
        $.post('../Vistas/ayuda_consulta.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_informacion').click(function(){
        $.post('../Vistas/ayuda_informacion.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_modifica').click(function(){
        $.post('../Vistas/ayuda_modifica.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_contrata').click(function(){
        $.post('../Vistas/ayuda_contrata.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_despedir').click(function(){
        $.post('../Vistas/ayuda_despedir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_reporte').click(function(){
        $.post('../Vistas/ayuda_reporte.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $('#ayuda_imprimir').click(function(){
        $.post('../Vistas/ayuda_imprimir.jsp',function(carga){$('#tareaActual').html(carga);});
    });
    
    $(document).on("submit","#formEnviarNomina",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            alert(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formEmpleadoD",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });

    $(document).on("submit","#formEmpleadoG",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formConsultarEmpleado",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formTareaG",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formConsultarTarea",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formNominaG",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formConsultarNomina",function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            $('#tareaActual').html(responseText);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formModTarea", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseJson){
            $("#modificaTareaResultado").css("display","block");
            $("#modificarIdTarea").prop("disabled",true);
            $("#modificarBuscarTarea").css("display","none");
            $("#modificarTareaIdResultado").css("display","none");
            $("#modificarTareaIdResultado").val(responseJson[0]);
            $('#modificarNombreTarea').val(responseJson[1]);
            $('#modificarTareaIdEmpleado').val(responseJson[2]);
            $('#modificarTareaFechaInicio').val(responseJson[3]);
            $('#modificarTareaFechaFin').val(responseJson[4]);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formGuardarModTarea", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            if(responseText === "1"){
                alert("Registro actualizado.");
                $("#modificaTareaResultado").css("display","none");
                $("#modificarIdTarea").prop("disabled",false);
                $("#modificarBuscarTarea").css("display","block");
                $("#modificarIdTarea").val("");
                $("#modificarTareaIdResultado").val("");
                $('#modificarNombreTarea').val("");
                $('#modificarTareaIdEmpleado').val("");
                $('#modificarTareaFechaInicio').val("");
                $('#modificarTareaFechaFin').val("");
            }else{
                alert("ERROR. Verificar datos.");
            }
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formModEmpleado", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseJson){
            $("#resultado").css("display","block");
            $("#modificarIdEmpleado").prop("disabled",true);
            $("#modificarBuscaEmp").css("display","none");
            $("#modificarIdResultado").css("display","none");
            $("#modificarIdResultado").val(responseJson[0]);
            $("#modificarNombreEmpleado").val(responseJson[1]);
            $("#modificarApellidoEmpleado").val(responseJson[2]);
            $("#modificarDireccionEmpleado").val(responseJson[3]);
            $("#modificarRFC").val(responseJson[4]);
            $("#modificarTelefonoEmpleado").val(responseJson[5]);
            $("#modificarEdocivilEmpleado").val(responseJson[6]);
            $("#modificarLicEmpleado").val(responseJson[7]);
            $("#modificarSueldoEmpleado").val(responseJson[8]);
            $("#modificarAreaEmpleado").val(responseJson[9]);
            $("#modificarCargoEmpleado").val(responseJson[10]);
            $("#modificarStatusEmpleado").val(responseJson[11]);
            $("#modificarCuentaEmpleado").val(responseJson[12]);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formGuardarModEmpleado", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            if(responseText === "1"){
                alert("Registro actualizado.");
                $("#modificarBuscaEmp").css("display","block");
                $("#modificarIdEmpleado").prop("disabled",false);
                $("#modificarIdEmpleado").val("");
                $("#resultado").css("display","none");
                $("#modificarNombreEmpleado").val("");
                $("#modificarApellidoEmpleado").val("");
                $("#modificarDireccionEmpleado").val("");
                $("#modificarRFC").val("");
                $("#modificarTelefonoEmpleado").val("");
                $("#modificarEdocivilEmpleado").val("");
                $("#modificarLicenciaEmpleado").val("");
                $("#modificarSueldoEmpleado").val("");
                $("#modificarAreaEmpleado").val("");
                $("#modificarCargoEmpleado").val("");
                $("#modificarStatusEmpleado").val("");
                $("#modificarCuentaEmpleado").val("");
            }else{
                alert("ERROR. Verificar datos.");
            }
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formModNomina", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseJson){
            $("#modNominaResultado").css("display","block");
            $("#modificarIdNomina").prop("disabled",true);
            $("#modificarBuscaNomina").css("display","none");
            $("#modificarNominaIdResultado").css("display","none");
            $("#modificarNominaIdResultado").val(responseJson[0]);
            $("#modificarNominaEmpresa").val(responseJson[1]);
            $("#modificarNominaFechaCreacion").val(responseJson[2]);
            $("#modificarNominaFechaLimite").val(responseJson[3]);
            $("#modificarNominaIdEmpleado").val(responseJson[4]);
            $("#modificarNominaPercepciones").val(responseJson[5]);
            $("#modificarNominaDeducciones").val(responseJson[6]);
            $("#modificarNominaDias").val(responseJson[7]);
            $("#modificarNominaPagoDias").val(responseJson[8]);
            $("#modificarNominaTotal").val(responseJson[9]);
            $("#modificarNominaPago").val(responseJson[10]);
        });
        event.preventDefault();
    });
    
    $(document).on("submit","#formGuardarModNomina", function(event){
        var $form = $(this);
        $.post($form.attr("action"), $form.serialize(), function(responseText){
            if(responseText === "1"){
                alert("Registro actualizado.");
                $("#modNominaResultado").css("display","none");
                $("#modificarIdNomina").prop("disabled",false);
                $("#modificarIdNomina").val("");
                $("#modificarBuscaNomina").css("display","block");
                $("#modificarNominaIdResultado").val("");
                $("#modificarNominaEmpresa").val("");
                $("#modificarNominaFechaCreacion").val("");
                $("#modificarNominaFechaLimite").val("");
                $("#modificarNominaIdEmpleado").val("");
                $("#modificarNominaPercepciones").val("");
                $("#modificarNominaDeducciones").val("");
                $("#modificarNominaDias").val("");
                $("#modificarNominaPagoDias").val("");
                $("#modificarNominaTotal").val("");
                $("#modificarNominaPago").val("");
            }else{
                alert("ERROR. Verificar datos.");
            }
        });
        event.preventDefault();
    });
});