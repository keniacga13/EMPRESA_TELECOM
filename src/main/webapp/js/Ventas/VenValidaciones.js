
function validaFechasReportes(){
var hoy= new Date();           
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
   
     var limit= f1.setMonth(f1.getMonth()-12);
     var fechafin=new Date(document.getElementById('fecha2').value);    
  
      if(!isNaN(primeraFecha)||!isNaN(segundaFecha)){
                
            alert("Alguna fecha no ha sido ingresada");
               
            return false;
      }else if(f1<limit){
          alert("la fecha de inicio no debe ser menor a un año");
          return false;
      }else if (fechafin>hoy){
        alert('la fecha final no puede ser mayor a la actual');
//        document.getElementById('fecha2').value="";
        return false;
    }else{
            if(f11>f2){
                alert("Fecha de inicio es mayor a fecha de termino");
            }else{
                alert("CARGANDO...");
            }
      }
}



function validaIDCliente(){

            
      var idClient=document.getElementById("IDCliente").value;

   
         //id de la empresa obligatorio
            if( !(/^[A-Za-z]{3}[0-9]{4}$/.test(idClient)) ) {
             
          alert("Ingrese un id correto como, Ejemplo: cli1234");
       
          return false;
      }
     


}


function valmodalmail(){
    var mail=document.getElementById("correo").value;
    var formato=document.getElementById("formatoImp").selectedIndex;
    if(!(/\S+@\S+\.\S+/.test(mail))){
            alert('ERROR: Debe escribir un correo valido ejemplo:geovanni.ayalapea@gmail.com');
            return false;
        }
         if( formato == null || formato==0 ) {
              alert("seleccione un formato en el que desea enviar");
            return false;
          }
}

function valmodalimprimir(){

    var formato=document.getElementById("formatoImp").selectedIndex;
         if( formato == null || formato==0 ) {
              alert("seleccione un formato en el que desea imprimir");
            return false;
          }
     
}
  function validamodaldetalleCliente(){
 
       var id = document.getElementById("idEmpresa").value;
                var Max_nomEmp = 30;
        var lengthnomEmp = document.getElementById("nombreEmp").value.length;
       var efec=document.getElementById("nombreEmp").value;
                    var Max_rfcEmp = 13;
        var lengthrfcEmp = document.getElementById("rfcEmp").value.length;
        var tota=document.getElementById("rfcEmp").value;

            //select group lista

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
  
  }
 
function buscar(){
    var buscar=document.getElementById("busc").value;
     var tipo=document.getElementById("tipoBusqueda").selectedIndex;
    tipoBusqueda
     if(buscar == "" || buscar == null || buscar.length == 0 || /^\s+$/.test(buscar)){
            alert("ingrese lo que desea buscar")
            return false;
        }
         if( tipo == null || tipo==0 ) {
              alert("seleccione un Tipo para su reporte");
            return false;
          }
}

function validaRegistraInterm(){

  
       var Max_nominter = 40;
        var lengthnominter = document.getElementById("nombreInter2").value.length;
   var nombrecliente=document.getElementById("nombreInter2").value;
   
   var Max_apeinter = 60;
        var lengthapeinter = document.getElementById("apellidoInter2").value.length;
     
       var apellidosCliente=document.getElementById("apellidoInter2").value;
  
          var numeroTelefono=document.getElementById('telefonoInter2').value;
  
          var correo=document.getElementById("correoInter2").value;
                  var nomEmpresa = document.getElementById("eligeEmpre").selectedIndex;
            
            if( nomEmpresa == null || nomEmpresa==0 || nomEmpresa=="Empresa") {
  
                alert("seleccione una empresa");
                return false;
                
                }
            //nombre del cliente obligatorio
  
      
     if (nombrecliente=="" || nombrecliente == null || nombrecliente.length == 0 || /^\s+$/.test(nombrecliente)) {
  
              alert("ingrese un nombre de intermediario");
       
         return false;
            }else if (lengthnominter > Max_nominter) {
  alert("el maximo de caracteres para el nombre del intermediario es 40");
  return false;
}
       
    
        if (apellidosCliente=="" || apellidosCliente == null || apellidosCliente.length == 0 || /^\s+$/.test(apellidosCliente)) {
       
         alert("ingrese apellido del intermediario");
                return false;
            }else if (lengthapeinter > Max_apeinter) {
  alert("el maximo de caracteres para los apellidos del intermediario es 60");
  return false;
}
        
   
    if(!(/^\d{10}$/.test(numeroTelefono))) {
               
        alert("escribe un telefono valido ejemplo: 7223490089");
         
       return false;
            }
 
      
  if(!(/\S+@\S+\.\S+/.test(correo))){

 alert('ERROR: Debe escribir un correo vÃ¡lido ejemplo:geovanni.ayalapea@gmail.com');

       return false;
        }
        }
        
                