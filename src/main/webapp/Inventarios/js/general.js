function soloLetras(e){//Se utiliza para que el campo de texto solo acepte letras
       key = e.keyCode || e.which;
       tecla = String.fromCharCode(key).toLowerCase();
       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";//Se define todo el abecedario que se quiere que se muestre
       especiales = "8-37-39-46";

       tecla_especial = false
       for(var i in especiales){
            if(key == especiales[i]){
                tecla_especial = true;
                break;
            }
        }

        if(letras.indexOf(tecla)==-1 && !tecla_especial){
            return false;
        }
    }


    //Se utiliza para que el campo de texto solo acepte numeros
function SoloNumeros(evt){
 if(window.event){//asignamos el valor de la tecla a keynum
  keynum = evt.keyCode; //IE
 }
 else{
  keynum = evt.which; //FF
 } 
 
 //comprobamos si se encuentra en el rango numérico y que teclas no recibirá.
 if((keynum > 47 && keynum < 58) || keynum == 8 || keynum == 13 || keynum == 6 ){
  return true;
 }
 else{
  return false;
 }
}

function cod_barr(){
     var codigo = document.getElementById("codibar").value;
     if (codigo==''){
         alert("Ingrese codigo de barras ");
         return false;
     }
    
   
    
}

function agre_prod(){
  var uni = document.getElementById("uni").value;  

 
      alert("Debe tener precio mayor a 1");
      return false;
  

}


function VerificacionU(){
                
                var txtusuario= document.getElementById('usuario').value;
                var txtcontraseña = document.getElementById('contraseña').value;
               
            
                if(txtusuario == null || txtusuario.length == 0 || /^\s+$/.test(txtcontraseña)){
                    window.alert('Campos no deben estar vacios');
                    return false;
                }
                if (txtusuario =='Usuario1' || txtcontraseña =='Usuario1') { 
                    window.location="merma.html";
                    return false;
                }else{
                    alert("Porfavor ingrese, nombre de usuario y contraseña correctos.");
                    return false;
                }
            }
            function formularioIzq1(){
                
                var txtbusca = document.getElementById('IDPro').value;
                
                 if(txtbusca == null || txtbusca.length == 0){
                    window.alert('Agrega el ID del producto a consultar');
                    return false;
                }
                
            }
             function formularioIzq2(){
                var txtelimina = document.getElementById('IDPro2').value;
            
              
                 if(txtelimina == null || txtelimina.length == 0){
                    window.alert('Agrega el ID del producto a eliminar');
                    return false;
            }
        }
        function FormulaInserta(){
            var CB = document.getElementById('CB').value;
            var IP = document.getElementById('IP').value;
            var TP = document.getElementById('TP').value;
            var cantidad = document.getElementById('cantidad').value;
            var proveedor = document.getElementById('proveedor').value;
            var PU = document.getElementById('PU').value;
            var PT = document.getElementById('PT').value;
            var motivo = document.getElementById('motivo').value;
            
            if(IP == null || IP.length == 0){
                    window.alert('Agrega el ID del producto');cuando lo meto en consultas aun no me queda 
                    return false;
                } else
            if(TP == null || TP.length == 0){
                    window.alert('Agrega el Tipo de producto');
                    return false;
                } else
            if(proveedor == null || proveedor.length == 0){
                    window.alert('Agrega el proveedor');
                    return false;
                } else
            if(motivo == null || motivo.length == 0){
                    window.alert('Agrega el motivo de la devolución de producto');
                    return false;
                } else
            if( isNaN(CB) ) {
                    window.alert('Agrega el código de barras')
                    return false;
                } else
            if( isNaN(cantidad) ) {
                    window.alert('Agrega la cantidad')
                    return false;
                } else
            if( isNaN(PU) ) {
                    window.alert('Agrega precio unitario')
                    return false;
                } else
            if( isNaN(PT) ) {
                    window.alert('Agrega el precio total')
                    return false;
                } else{
                    window.alert('Correcto insertado de datos')
                }
            
            
        }
            
