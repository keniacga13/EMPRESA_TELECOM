$(document).ready(function e(){
    
    $('#btnModal').click(function(){
        
        var nomEmpresa = document.getElementById("nomEmp").selectedIndex;
      
        var nomIntermediario = document.getElementById("nomInter").selectedIndex;
            
            if( nomEmpresa == null || nomEmpresa==0 || nomEmpresa=="Empresa") {
  
                alert("seleccione una empresa");
                return false;
                
                }else if(nomIntermediario == null || nomIntermediario==0 || nomIntermediario=="Intermediario"){
                                    alert("seleccione intermediario");
                                    return false;
                }else{


                        $('#agregaProductos').modal('show');
                      
                }
    });
});


$(document).ready(function e(){
    
    
    $('#modalInter').click(function(){

        $.post('modales/detalleInter.jsp',function(xx){
                      
            $('#tmpModal').html(xx);

            $('#detalleInterme').modal('show');
        });    

    });
});

$(document).ready(function e(){
    
    $('#btnImprimir').click(function(){

        $.post('modales/eligeImprimir.jsp',function(xx){
                      
            $('#tmpModal').html(xx);

            $('#formatoImprime').modal('show');
        });    

    });
});

$(document).ready(function e(){
    
    $('#btnMail').click(function(){

        $.post('modales/mandaMail.jsp',function(xx){
                      
            $('#tmpModal').html(xx);

            $('#mandaMail').modal('show');
        });    

    });
});

$(document).ready(function e(){
    
    $('#btnReporte').click(function(){
        
        if (document.getElementById("report4").checked || document.getElementById("report2") || document.getElementById("report3") || document.getElementById("report7")) {
            $.post('modales/eligeTipoReporte.jsp',function(xx){

                $('#tmpModal').html(xx);

                $('#eligeReporte').modal('show');
            }); 
        }

   

    });
});

function valAgrega(){
    var Max_codigo = 13;
    var lengthcodigo = document.getElementById("codprod").value.length;
    var codigo=document.getElementById("codprod").value;
    var canti=document.getElementById("cant").value;
    
   if(codigo == "" || codigo == null || codigo.length == 0 || /^\s+$/.test(codigo)){
       
        alert("ingrese un codigo");
        return false;
        
    } else if (lengthcodigo != Max_codigo) {
        
        alert("el numero de caracteres para el codigo del producto debe ser de 13");
        return false;
        
    }else if( !(/^\d{1,4}$/.test(canti)) ) {
        
        alert("ingrese una cantidad de productos");
        return false;       
    }else{
        
        var codprodVar = $('#codprod').val();
        var cantVar=$('#cant').val();
        var nomprodVar=$('#nomprod').val();
        var precioprodVar=$('#precioprod').val();
        var ivaprodVar=$('#ivaprod').val();
        var subtotalVar=$('#subtotal').val();


			$.post('../ListaProductos', {
				codprod : codprodVar,
				cant: cantVar,
				nomprod: nomprodVar,
                                precioprod : precioprodVar,
                                ivaprod : ivaprodVar,
                                subtotal : subtotalVar
			}, function(responseText) {
				$('#tablaProductos').html(responseText);
			});

                $.ajax({
                    type:'POST',
                    url: '../MandaOrdenVenta',
                    datatype: 'json',
                    success: function (result) {
                        var ov = $.parseJSON(result);
                        $('#subtotalOV').val(ov.subtotal_pago);
                        $('#totalIvaOV').val(ov.total_iva);
                        $('#totalOV').val(ov.total_pago);
                    }
                });
                
                $('#codprod').val("");
                $('#cant').val("");
                $('#nomprod').val("");
                $('#precioprod').val("");
                $('#ivaprod').val("");
                $('#subtotal').val("");
                $('#agregaProductos').modal('hide');
                
    } 

 
}


function validaTabla(){
   
      var nFilas = $("#listaProductos tr").length;

      if(nFilas==0){
        alert("No se han aÃ±adido productos");
        
        return false;
      }else{
        validaFechas();
      }

}
  
 
function validaFechas(){
           
           

      var primeraFecha = document.getElementById("fecha1").value;
      

      var segundaFecha = document.getElementById("fecha2").value;
    var dosdiez = new Date('2010-01-01');
      var anioPF = primeraFecha.substr(0,4);
      var diaPF = primeraFecha.substr(8,10);
      var m = primeraFecha.substr(5,6);
      var mesPF = m.substr(0,2);

      var anioSF = segundaFecha.substr(0,4);
      var diaSF = segundaFecha.substr(8,10);
      var mS = segundaFecha.substr(5,6);
      var mesSF = mS.substr(0,2);
      

     var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      var f11 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

       var limite= f1.setFullYear(f1.getFullYear()+1);
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else if(f2>limite){
          alert("La fecha de entrega máxima es de un año, apartir de su compra");
      }else{
            if(f11>f2){
                alert("Fecha de venta es mayor a fecha de entrega");
            }else{
                validaCantidadPago();
            }
      }
}

  
function validaCantidadPago() {

      var anticipoPago = document.getElementById("anticipo").value;

      if( !/^([0-9])*$/.test(anticipoPago)||anticipoPago==null||anticipoPago==0)  {
   
        alert("Ingrese cantidad de anticipo.");
   
        return false;
      }else{
        validaTipoPago();
      }

}


function validaTablaCONTADO(){
           
      var nFilas = $("#listaProductos tr").length;

      if(nFilas==0){
                
          alert("No se han añadido productos");
            
          return false;
      }else{
            
        validaFechasCONTADO();
      }

}


function validaFechasCONTADO(){
      
      var primeraFecha = document.getElementById("fecha1").value;
      

      var segundaFecha = document.getElementById("fecha2").value;

      var anioPF = primeraFecha.substr(0,4);
      var diaPF = primeraFecha.substr(8,10);
      var m = primeraFecha.substr(5,6);
      var mesPF = m.substr(0,2);

      var anioSF = segundaFecha.substr(0,4);
      var diaSF = segundaFecha.substr(8,10);
      var mS = segundaFecha.substr(5,6);
      var mesSF = mS.substr(0,2);

      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      var f11 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

       var limite= f1.setFullYear(f1.getFullYear()+1);
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else if(f2>limite){
          alert("La fecha de entrega máxima es de un año, apartir de su compra");
      }else{
            if(f11>f2){
                alert("Fecha de venta es mayor a fecha de entrega");
            }else{
                validaTipoPago();
            }
      }
}


function validaTablaPARCIAL(){
 
      var nFilas = $("#listaProductos tr").length;

    
      if(nFilas==0){
              
          alert("No se han aÃ±adido productos");
      
          return false;
      }else{
     
          validaFechasPARCIAL();
      }
}

   


     function validaFechasPARCIAL(){
      
      var primeraFecha = document.getElementById("fecha1").value;
      

      var segundaFecha = document.getElementById("fecha2").value;

      var anioPF = primeraFecha.substr(0,4);
      var diaPF = primeraFecha.substr(8,10);
      var m = primeraFecha.substr(5,6);
      var mesPF = m.substr(0,2);

      var anioSF = segundaFecha.substr(0,4);
      var diaSF = segundaFecha.substr(8,10);
      var mS = segundaFecha.substr(5,6);
      var mesSF = mS.substr(0,2);

      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      var f11 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

       var limite= f1.setFullYear(f1.getFullYear()+1);
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else if(f2>limite){
          alert("La fecha de entrega máxima es de un año, apartir de su compra");
      }else{
            if(f11>f2){
                alert("Fecha de venta es mayor a fecha de entrega");
            }else{
                validaPARCIALIDAD();
            }
      }
      
          if( !(/^\d{1,9}$/.test(anticipo1)) ) {
            alert("falta anticipo");
          return false;
        }else if(anticipo1=="" || anticipo1 == null || anticipo1.length == 0 || /^\s+$/.test(anticipo1)|| res>(2*anticipo1)){
           alert("el anticipo debe ser mayor al 30% del total"); 
        }
}

function validaPARCIALIDAD(){

      var parcialidad = document.getElementById("tipoParcial").value;

      if( parcialidad=="selectPar")  {

          alert("Ingrese tipo de parcialidad");
           
          return false;
      }else{
            
        validaTipoPago();
  
      }
}

function validaTablaCOT(){
          
    var nFilas = $("#listaProductos tr").length;

     
    if(nFilas==0){
              
      alert("No se han aÃ±adido productos");
             
      return false;

    }else{
            
      validaFechasCOT();
    }
}

function validaFechasCOT(){
         
      var primeraFecha = document.getElementById("fecha1").value;
      

      var segundaFecha = document.getElementById("fecha2").value;

      var anioPF = primeraFecha.substr(0,4);
      var diaPF = primeraFecha.substr(8,10);
      var m = primeraFecha.substr(5,6);
      var mesPF = m.substr(0,2);

      var anioSF = segundaFecha.substr(0,4);
      var diaSF = segundaFecha.substr(8,10);
      var mS = segundaFecha.substr(5,6);
      var mesSF = mS.substr(0,2);

      var f1 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      var f11 = new Date(anioPF, mesPF, diaPF); //31 de diciembre de 2015
      
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

       var limite= f1.setFullYear(f1.getFullYear()+1);
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else if(f2>limite){
          alert("La fecha de entrega máxima es de un año, apartir de su compra");
      }else{
            if(f11>f2){
                alert("Fecha de venta es mayor a fecha de entrega");
            }else{
                alert("CARGANDO...");
            }
      }
}

function validaTablaReportes(){
         
    var nFilas = $("#listaProductos tr").length;

       
    if(nFilas==0){
              
        alert("No se ha cargado reporte");
        
        return false;
    }else{
    
        validaFechasReportes();
    }
}

function validaSelectVenta(){

        
    var venta = document.getElementById("ventasInter").value;

  
    if(venta=="venta"){
               
      alert("Selecciona una venta");
    }else{
   
        validaTipoPago();
    }
}


function validaTipoPago(){


      var tipoDePago = document.getElementById("tipoPago").value;

      if(tipoDePago=="select") {
                 
          alert("Seleccione un tipo de pago.");
              
          return false;
      }else{
                 
          if(tipoDePago=="Efectivo"){
              
              var id_interVar=$("#nomInter option:selected").val();
              var fecha_ovVar=$('#fecha1').val();
              var total_ivaVar=$('#totalIvaOV').val();
              var subtotalVar=$('#subtotalOV').val();
              var total_ovVar=$('#totalOV').val();
              var fecha_entregaVar=$('#fecha2').val();
              var id_empVar=$('#idVendedor').val();
              var tipo_ventaVar = $('#tipo_venta').text();
              var forma_pagoVar=$("#tipoPago option:selected").val();
              
              if(tipo_ventaVar=="Apartado de producto"){
                  
                  
                  var anticipoVar=$('#anticipo').val();
                  var restanteVar=$('#restante').val();
                  
                $.ajax({
                    type:'POST',
                    url: '../ApartaProd',
                    datatype: 'json',
                    data: {
                        abono_apart:anticipoVar,
                        cargo_apart:restanteVar
                    },
                    success: function (result) {
                        alert("APARTADO REGISTRADO, RESTANTE: "+result);
                    }
                });
                  
              }
            
                $.ajax({
                    type:'POST',
                    url: '../CreaOrdenVenta',
                    datatype: 'json',
                    data: {
                        id_intermC:id_interVar,
                        fecha_ordv:fecha_ovVar,
                        total_iva:total_ivaVar,
                        subtotal_pago:subtotalVar,
                        total_pago:total_ovVar,
                        fecha_entrega:fecha_entregaVar,
                        id_emp:id_empVar,
                        tipo_venta:tipo_ventaVar
                    },
                    success: function (result) {
                        alert("ORDEN DE VENTA CREADA, PAGO: "+result)
                    }
                });
                
                $.ajax({
                    type:'POST',
                    url: '../generaFactura',
                    datatype: 'json',
                    data: {
                        id_intermC:id_interVar,
                        total_iva:total_ivaVar,
                        subtotal_pago:subtotalVar,
                        total_pago:total_ovVar,
                        tipo_venta:tipo_ventaVar,
                        forma_pago:forma_pagoVar
                    },
                    success: function (result) {
                        alert("FACTURA CREADA, PAGO: "+result);
                    }
                });
                  
            $.post('modales/pagoEfectivo.jsp',function(xx){

                $('#tmpModal').html(xx);

                $('#pagoEfectivo').modal('show');
            }); 

          }else{
              
              var id_interVar=$("#nomInter option:selected").val();
              var fecha_ovVar=$('#fecha1').val();
              var total_ivaVar=$('#totalIvaOV').val();
              var subtotalVar=$('#subtotalOV').val();
              var total_ovVar=$('#totalOV').val();
              var fecha_entregaVar=$('#fecha2').val();
              var id_empVar=$('#idVendedor').val();
              var tipo_ventaVar = $('#tipo_venta').text();
              var forma_pagoVar=$("#tipoPago option:selected").val();
              
               if(tipo_ventaVar=="Apartado de producto"){
                  
                  
                  var anticipoVar=$('#anticipo').val();
                  var restanteVar=$('#restante').val();
                  
                $.ajax({
                    type:'POST',
                    url: '../ApartaProd',
                    datatype: 'json',
                    data: {
                        abono_apart:anticipoVar,
                        cargo_apart:restanteVar
                    },
                    success: function (result) {
                        alert("APARTADO REGISTRADO, RESTANTE: "+result);
                    }
                });
                  
              }
            
                $.ajax({
                    type:'POST',
                    url: '../CreaOrdenVenta',
                    datatype: 'json',
                    data: {
                        id_intermC:id_interVar,
                        fecha_ordv:fecha_ovVar,
                        total_iva:total_ivaVar,
                        subtotal_pago:subtotalVar,
                        total_pago:total_ovVar,
                        fecha_entrega:fecha_entregaVar,
                        id_emp:id_empVar,
                        tipo_venta:tipo_ventaVar
                    },
                    success: function (result) {
                        alert("ORDEN DE VENTA CREADA, PAGO: "+result)
                    }
                });
                
                $.ajax({
                    type:'POST',
                    url: '../generaFactura',
                    datatype: 'json',
                    data: {
                        id_intermC:id_interVar,
                        total_iva:total_ivaVar,
                        subtotal_pago:subtotalVar,
                        total_pago:total_ovVar,
                        tipo_venta:tipo_ventaVar,
                        forma_pago:forma_pagoVar
                    },
                    success: function (result) {
                        alert("FACTURA CREADA, PAGO: "+result);
                    }
                });
                  
            $.post('modales/pagoTarjeta.jsp',function(xx){

                $('#tmpModal').html(xx);

                $('#pagoTarjeta').modal('show');
            }); 

          }

      }            

}

  function validamodalapagoEfectivo(){
       var moneda = document.getElementById("job").selectedIndex;
       
       var efec=document.getElementById("efectivo").value;
        var tota=document.getElementById("total").value;

            //select group lista

 if( (moneda == null )) {
  
              alert("seleccione una moneda");
  
 
             return false;
  }
if(efec == "" || efec == null || efec.length == 0 || /^\s+$/.test(efec)){
            alert("Ingrese cantidad con la que se pagará")
            return false;
        }
  
  }
  
  function validaRegistraCliente(){
             var Max_nomEmp = 30;
        var lengthnomEmp = document.getElementById("nombreEmp").value.length;
        var nomEmp=document.getElementById("nombreEmp").value;
              var Max_rfcEmp = 13;
        var lengthrfcEmp = document.getElementById("rfcEmp").value.length;
        var rfcEmp=document.getElementById("rfcEmp").value;
        var indice = document.getElementById("estado").selectedIndex;
        
            var Max_municipio = 40;
        var lengthmunicipio = document.getElementById("municipioEmp").value.length;
        var municipioEmp=document.getElementById("municipioEmp").value;
        
        var Max_calleEmp = 40;
        var lengthcalleEmp = document.getElementById("calleEmp").value.length;
        var calleEmp = document.getElementById("calleEmp").value;
        
        var codpostal = document.getElementById("codpostal").value;

         var Max_nominter = 40;
//        var lengthnominter = document.getElementById("nombreintermediario").value.length;
//        var nombrecliente=document.getElementById("nombreintermediario").value;
//         var Max_apeinter = 60;
//        var lengthapeinter = document.getElementById("apellidointermediario").value.length;
//        var apellidocliente=document.getElementById("apellidointermediario").value;
//
//        var numeroTelefono=document.getElementById('telefonointermediario').value;
//
//        var correo=document.getElementById("correointermediario").value;
 

//nombre de la empresa obligatorio
        if(nomEmp == "" || nomEmp == null || nomEmp.length == 0 || /^\s+$/.test(nomEmp)){
            alert("ingrese un nombre de la empresa porfavor")
            return false;
        } else if (lengthnomEmp > Max_nomEmp) {
  alert("el maximo de caracteres para el nombe de la empresa es 30");
  return false;
}
           
        
//rfc obligatorio
         if(rfcEmp == "" || rfcEmp == null || rfcEmp.length == 0 || /^\s+$/.test(rfcEmp)){
            alert("ingrese un RFC de la empresa");
            return false;
        }else if (lengthrfcEmp != Max_rfcEmp) {
  alert("el numero de caracteres para el rfc de la empresa debe ser de 13");
  return false;
}
          //select group lista
          if( indice == null || indice==0 ) {
              alert("seleccione una opccion de Estado");
            return false;
          }

//nombre del municipio obligatorio
        if (municipioEmp=="" || municipioEmp == null || municipioEmp.length == 0 || /^\s+$/.test(municipioEmp)) {
            alert("ingrese el municipio donde se ubica");
        } else if (lengthmunicipio > Max_municipio) {
  alert("el maximo de caracteres para el nombre del municipio es 40");
  return false;
}

//nombre de la calle obligatorio
        if (calleEmp=="" || calleEmp == null || calleEmp.length == 0 || /^\s+$/.test(calleEmp) || !(/\w+[0-9 ]/.test(calleEmp))) {
            alert("ingrese la calle donde se ubica Ejemplo: Francisco I. Madero 20");
        } else if (lengthcalleEmp > Max_calleEmp) {
        alert("el maximo de caracteres para la calle de la empresa es 40");
        return false;
        }
/*else if( !(/\w+\|.+[A-Za-z0-9 ]/.test(calleEmp)) ) {
             
          alert("Ingrese una calle y numero como en el siguente, Ejemplo: Francisco |. Madero 20");
       
          return false;
      }*/

        if( !(/^\d{5}$/.test(codpostal)) ) {
            alert("ingrese un codigo postal de 5 numeros ejemplo:12345");
          return false;
        }
////nombre del cliente obligatorio
//        if (nombrecliente=="" || nombrecliente == null || nombrecliente.length == 0 || /^\s+$/.test(nombrecliente)) {
//            alert("ingrese un nombre de intermediario");
//        }else if (lengthnominter > Max_nominter) {
//  alert("el maximo de caracteres para el nombre del intermediario es 40");
//  return false;
//}
////apellido del cliente obligatorio
//        if (apellidocliente=="" || apellidocliente == null || apellidocliente.length == 0 || /^\s+$/.test(apellidocliente)) {
//            alert("ingrese un apellido de intermediario");
//        }else if (lengthapeinter > Max_apeinter) {
//  alert("el maximo de caracteres para los apellidos del intermediario es 60");
//  return false;
//}
//
//        if(!(/^\+52\s\d{10}$/.test(numeroTelefono))) {
//            alert("escribe un telefono valido ejemplo:+52 7225653154");
//            return false;
//        }
//
//        if(!(/\S+@\S+\.\S+/.test(correo))){
//            alert('ERROR: Debe escribir un correo vÃ¡lido ejemplo:geovanni.ayalapea@gmail.com');
//            return false;
//        }
    }