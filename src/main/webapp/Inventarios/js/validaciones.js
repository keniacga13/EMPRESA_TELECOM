        function validaTabla(){
   
         var nFilas = $("#listaProductos tr").length;

   
        if(nFilas==0){
         
       alert("No se han añadido productos");
    
            return false;
            }
else{
  
              validaFechas();
            }
        }

  

     
function validaFechas(){
           
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
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

      
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else{
            if(f1>f2){
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
            }
else{
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
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

      
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else{
            if(f1>f2){
                alert("Fecha de venta es mayor a fecha de entrega");
            }else{
                validaTipoPago();
            }
      }
        }




 


  
     function validaTablaPARCIAL(){
 
           var nFilas = $("#listaProductos tr").length;

    
        if(nFilas==0){
              
  alert("No se han añadido productos");
      
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
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

      
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else{
            if(f1>f2){
                alert("Fecha de venta es mayor a fecha de entrega");
            }else{
                validaPARCIALIDAD();
            }
      }
   }

 

 

      function validaPARCIALIDAD(){

           
 var parcialidad = document.getElementById("tipoParcial").value;

    
        if( parcialidad=="selectPar")  {

              
  alert("Ingrese tipo de parcialidad");
           
   return false;
            }
else{
            
    validaTipoPago();
  
          }
        }




    

    
function validaTablaCOT(){
          
  var nFilas = $("#listaProductos tr").length;

     
       if(nFilas==0){
              
  alert("No se han añadido productos");
             
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
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

      
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else{
            if(f1>f2){
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


     

   function validaFechasReportes(){
           
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
      var f2 = new Date(anioSF, mesSF, diaSF); //30 de noviembre de 2014

      
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else{
            if(f1>f2){
                alert("Fecha de inicio es mayor a fecha de termino");
            }else{
                alert("CARGANDO...");
            }
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
                 
   if(tipoDePago=="efectivo"){
                  
      $('#pagoEfectivo').modal({
            
                show:true
                        });
                
    }
else{
                  
      $('#pagoTarjeta').modal({
        
                    show:true
                        });
     
               }

                }            

        }

        





 


      
 


function agregaVal(){

         
   var nomEmpresa = document.getElementById("nomEmp").selectedIndex;
      
      var nomIntermediario = document.getElementById("nomInter").selectedIndex;

            //select group lista

 if( (nomEmpresa == null || nomEmpresa==0 || nomEmpresa=="Nombre de empresa")||(nomIntermediario == null || nomIntermediario==0 || nomIntermediario=="Intermediario")) {
  
              alert("seleccione una empresa");
  
              alert("seleccione intermediario");
 
             return false;
            }
else{
                $('#agregaProductos').modal({
       show:true
                });
 

           }
        }

    


function validacionRegistraCliente(){
        
        var nomEmp=document.getElementById("nombreEmp").value;
        var rfcEmp=document.getElementById("rfcEmp").value;
        var indice = document.getElementById("estado").selectedIndex;
        var municipioEmp=document.getElementById("municipioEmp").value;
        var calleEmp = document.getElementById("calleEmp").value;
        var codpostal = document.getElementById("codpostal").value;

//        var nombrecliente=document.getElementById("nombreintermediario").value;
//        var apellidocliente=document.getElementById("apellidointermediario").value;
//
//        var numeroTelefono=document.getElementById('telefonointermediario').value;
//
//        var correo=document.getElementById("correointermediario").value;

//nombre de la empresa obligatorio
        if(nomEmp == "" || nomEmp == null || nomEmp.length == 0 || /^\s+$/.test(nomEmp)){
            alert("ingrese un nombre de la empresa porfavor")
            return false;
        }
//rfc obligatorio
         if(rfcEmp == "" || rfcEmp == null || rfcEmp.length == 0 || /^\s+$/.test(rfcEmp)){
            alert("ingrese un RFC de la empresa");
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
        }

//nombre de la calle obligatorio
        if (calleEmp=="" || calleEmp == null || calleEmp.length == 0 || /^\s+$/.test(calleEmp)) {
            alert("ingrese la calle donde se ubica");
        }

if( !(/^\d{5}$/.test(codpostal)) ) {
    alert("ingrese un codigo postal de 5 numeros ejemplo:12345");
  return false;
}
////nombre del cliente obligatorio
//        if (nombrecliente=="" || nombrecliente == null || nombrecliente.length == 0 || /^\s+$/.test(nombrecliente)) {
//            alert("ingrese un nombre de intermediario");
//        }
////apellido del cliente obligatorio
//        if (apellidocliente=="" || apellidocliente == null || apellidocliente.length == 0 || /^\s+$/.test(apellidocliente)) {
//            alert("ingrese un apellido de intermediario");
//        }
//
//    if(!(/^\+\d{2,3}\s\d{10}$/.test(numeroTelefono))) {
//        alert("escribe un telefono valido ejemplo:+34 900900900");
//  return false;
//}
//
//        if(!(/\S+@\S+\.\S+/.test(correo))){
//            alert('ERROR: Debe escribir un correo válido ejemplo:geovanni.ayalapea@gmail.com');
//            return false;
//        }

          //  if(!isNaN(txtFecha)){
            //alert('ERROR: Debe elegir una fecha');
           // return false;
        //}
    }
 

function validaRegistroInterm(){

  
       
   var nombreprov=document.getElementById("nombreInter2").value;
     
    var idprod=document.getElementById("idprodInter2").value;
  
    var nombreprod=document.getElementById('tipoInter2').value;
  
    var cantidad=document.getElementById("cantidadInter2").value;
          
    var cdo=document.getElementById("cdoInter2").value;
    
    var entrada=document.getElementById("entradaInter2").value;
      
    var salida=document.getElementById("salidaInter2").value;
          

            //nombre del cliente obligatorio
            
        if (cdo=="" || cdo == null || cdo.length == 0 || /^\s+$/.test(cdo)) {
  
              alert("ingrese el codigo de barras");
       
         return false;
            }               
 
 
      if (idprod=="" || idprod == null || idprod.length == 0 || /^\s+$/.test(idprod)) {
       
         alert("ingrese el id del producto");
                return false;
            }
            
        if(nombreprod=="" || nombreprod == null || nombreprod.length == 0 || /^\s+$/.test(nombreprod)) {
        
        alert("Escribe que tipo de Producto es");
   
             return false;
            }  
            
        if(cantidad=="" || cantidad == null || cantidad.length == 0 || /^\s+$/.test(cantidad)) {
        
        alert("Escribe una cantidad numerica");
   
             return false;
            }  
   
      
     if (nombreprov=="" || nombreprov == null || nombreprov.length == 0 || /^\s+$/.test(nombreprov)) {
  
              alert("ingrese un nombre de proveedor");
       
         return false;
            }
            
    if (entrada=="" || entrada == null || entrada.length == 0 || /^\s+$/.test(entrada)) {
  
              alert("ingrese una fecha valida");
       
         return false;
            }
    
        
    if (salida=="" || salida == null || salida.length == 0 || /^\s+$/.test(salida)) {
  
              alert("ingrese una fecha valida");
       
         return false;
            } 


        alert("Campos Correctos Preciona la tecla Continuar");

    
        }


function validaEliminacion(){


          
    var cdo1=document.getElementById("cdoInter3").value;
    
  

            //nombre del cliente obligatorio
            
        if (cdo1=="" || cdo1 == null || cdo1.length == 0 || /^\s+$/.test(cdo1)) {
  
              alert("ingrese el codigo de barras");
       
         return false;
            }               
 
            if (cdo1=="454545" || /^\s+$/.test(cdo1)) {
  
              alert("No existe");
       
         return false;
            }      
     


        alert("Producto eliminado correctamente, Preciona la tecla Continuar");

    
        }
