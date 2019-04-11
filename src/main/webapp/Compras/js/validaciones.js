        function validaFormBusqEsp(){

            var foliorequisicion = document.getElementById("foliorequisicion").value;
                 

            if( !(/^\d{4}$/.test(foliorequisicion)) ) {
                alert("Coloque un Folio valido, que contenga 4 digitos");
                return false;
            }
        }

        function validaFechaBusqueda(){

            var req_fecha = document.getElementById("req_fecha").selectedIndex;
            if( req_fecha == null || req_fecha==0 || req_fecha=="Fechas") {
                alert("Seleccione una Fecha");
              return false;
            }
        }
        
        function vali_rfc(){
       
       var rfc= document.getElementById('rfc').value;
            
            if(!(/^[a-zA-z0-9]{13}$/.test(rfc))){
                alert("Favor de ingresar el RFC con los 13 caractéres");                
                return false;
            }
            
}

    function vali_zona(){
       
       var valor= document.getElementById('zona').value;
            
            if(valor =='@'){
                alert("Favor de elegir una zona");
                
                return false;
            }
        }


function vali_almacen(){
       
    var valor= document.getElementById('almacen').value;
            
        if(valor =='@'){
            alert("Favor de elegir una almacen");    
            return false;
        }
}

function vali_folioRequi(){
       
    var foliorequisicion= document.getElementById('foliorequisi').value;
            
        if( !(/^\d{5}$/.test(foliorequisicion)) ) {
            alert("Coloque un Folio valido, que contenga 5 digitos");
            return false;
        }
}

function vali_nueva_requi(){
    
    var requi_codigo_barras= document.getElementById('requi_codigo_barras').value;
            
        if(!(/^\d{13}$/.test(requi_codigo_barras))){
            alert("Favor de ingresar el codigo de barras con 13");                
            return false;
        }
    
    var unidad= document.getElementById('unidad').value;
            
        if(unidad =='@'){
            alert("Favor de elegir una unidad");                
            return false;
        }
    
    var foliorequisicion= document.getElementById('foliorequisi').value;
            
        if( !(/^\d{5}$/.test(foliorequisicion)) ) {
            alert("Coloque un Folio valido, que contenga 5 digitos");
            return false;
        }
    
    var requi_cantidad= document.getElementById('requi_cantidad').value;          
            
        if(requi_cantidad < 1 || requi_cantidad > 999){
            alert("Favor de ingresar una cantidad entre un rango de 1 a 999"); 
            return false;
        }
}

function vali_agregar_orden_com(){
       
    var cod_producto= document.getElementById('cod_producto').value;          
            
    if(!(/^\d{13}$/.test(cod_producto))){
        alert("Favor de ingresar el código de barras de 13 números");                
        return false;
    }
    
    var orden_proveedor= document.getElementById('orden_proveedor').value;          
            
        if(!(/^[a-zA-Z]+\s?[a-zA-Z]*\s?[a-zA-Z]*\s?[a-zA-Z]*$/.test(orden_proveedor))){
            alert("Favor de ingresar el nombre del proveedor de manera correcta");
            return false;
        }
        
    var orden_canatidadprod= document.getElementById('orden_canatidadprod').value;          
            
        if(orden_canatidadprod < 1 || orden_canatidadprod > 999){
            alert("Favor de ingresar una cantidad entre un rango de 1 a 999"); 
            return false;
        }
    alert("Se agrego satisfactoriamente la Orden de Compra");  
}

function vali_alerta_prod_min(){
       
    var alerta_cod_producto_min= document.getElementById('alerta_cod_producto_min').value;          
            
    if(!(/^\d{13}$/.test(alerta_cod_producto_min))){
        alert("Favor de ingresar el código de barras de 13 números");                
        return false;
    }
}
        
function vali_codigo(){
       
    var valor= document.getElementById('codigo').value;
            
        if(!(/^\d{4}$/.test(valor))){
            alert("Favor de ingresar el código con los 4 números");
             
            return false;
        }       
}
        
    function vali_nuevoproducto(){
       
       var ord_folio= document.getElementById('ord_folio').value;          
            
            if(!(/^\d{7}$/.test(cod_prod))){
                alert("Favor de ingresar el código de barras de 7 números");
                
                return false;
            }
            
       var req_folio= document.getElementById('req_folio').value;
            
            if(!(/^\d{13}$/.test(cod_prod))){
                alert("Favor de ingresar el código de barras de 13 números");
                
                return false;
            }
        
        var prov_rfc= document.getElementById('prov_rfc').value;          
            
            if(!(/^[a-zA-Z]+\s?[a-zA-Z]*\s?[a-zA-Z]*\s?[a-zA-Z]*$/.test(nom_producto))){
                    alert("Favor de ingresar el RFC de manera correcta");

                    return false;
            }
        
        var ord_pagotot= document.getElementById('ord_pagotot').value;
            
            if(unidad =='@'){
                alert("Favor de elegir una unidad");
                
                return false;
            }
        
        var costo= document.getElementById('costo').value;          
            
            if(!(/^[0-9]*[.|,]?[0-9]*$/.test(costo))){
                alert("Favor de ingresar costo correcto");
                
                return false;
            }
        
        var proveedor= document.getElementById('proveedor').value;          
            
            if(!(/^[a-zA-Z]+\s?[a-zA-Z]*\s?[a-zA-Z]*\s?[a-zA-Z]*$/.test(proveedor))){
                    alert("Favor de ingresar el nombre del proveedor de manera correcta");

                    return false;
            }
        
        var max_inventario= document.getElementById('max_inventario').value;          
            
            if(max_inventario < 1 || max_inventario > 9999){
                alert("Favor de ingresar el maximo inventario entre un rango de 1 a 9999");
                
                return false;
            }
        
        var min_inventario= document.getElementById('min_inventario').value;          
            
            if(min_inventario < 1 || min_inventario > 9999){
                alert("Favor de ingresar el minimo inventario entre un rango de 1 a 9999");
                
                return false;
            }
            
            if(min_inventario>=max_inventario){
                alert("Favor de ingresar un minimo en inventario menor al maximo en inventario");
                
                return false;
            }
           alert("El producto: "+cod_prod+" a sido agregado satisfactoriamente");           
        }
        
        function vali_nuevoproveedor(){
       
            var rfc_prov= document.getElementById('nuevo_rfc').value;

                 if(!(/^[a-zA-z0-9]{13}$/.test(rfc_prov))){
                     alert("Favor de ingresar el RFC con los 13 caractéres");

                     return false;
                 }

            var nuevo_nomemp= document.getElementById('nuevo_nomemp').value;          

                if(!(/^[a-zA-Z]+\s?[a-zA-Z]*\s?[a-zA-Z]*\s?[a-zA-Z]*$/.test(nuevo_nomemp))){
                    alert("Favor de ingresar el nombre de la empresa de manera correcta");

                    return false;
                }

            var nuevo_nomenc= document.getElementById('nuevo_nomenc').value;          

                if(!(/^[a-zA-Z]+\s?[a-zA-Z]*\s?[a-zA-Z]*\s?[a-zA-Z]*$/.test(nuevo_nomenc))){
                    alert("Favor de ingresar el nombre del contacto de manera correcta");

                    return false;
                }
            
            var nuevo_correo= document.getElementById('nuevo_correo').value;          

                if(!(/^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i.test(nuevo_correo))){
                    alert("Favor de ingresar un correo de manera correcta");

                    return false;
                }
            
             var nuevo_tel= document.getElementById('nuevo_tel').value;

                  if(!(/^\d{10}$/.test(nuevo_tel))){
                     alert("Favor de ingresar el teléfono del proveedor con los 10 números");

                     return false;
                 }
                 
        var estado= document.getElementById('nuevo_estado').value;
            
            if(estado =='@'){
                alert("Favor de elegir un estado");
                
                return false;
            }
                 
                 alert("El proveedor: "+ nuevo_nomemp +" a sido agregado satisfactoriamente"); 

        }
        
        function vali_fecha(){
            
             var fecha= document.getElementById('fecha_com').value;
             
            if(fecha==''){
                alert("vacio");
                return false;
            }
            

//            if (!(/^\d{1,2}\/\d{1,2}\/\d{2,4}$/.test(fecha_com))) {
//                alert("esar la fecha deseada");
//                return false;
//            }
            
//            var today = new Date();
//            var fecha_actual = today.getDate() + "/" + (today.getMonth() +1) + "/" + today.getFullYear() 
//
//            if (fecha_com >= fecha_actual){
//                alert("Favooooooooooooooooooooooooooooooooooor"+today);
//              return false;
//            }
            
            Hoy = new Date();//Fecha actual del sistema

            var AnyoFecha = fecha_com.getFullYear();
            var MesFecha = fecha_com.getMonth();
            var DiaFecha = fecha_com.getDate();

            var AnyoHoy = Hoy.getFullYear();
            var MesHoy = Hoy.getMonth();
            var DiaHoy = Hoy.getDate();

            if (AnyoFecha < AnyoHoy){
                alert ("La fecha introducida es anterior a Hoy");
                return false;
            }
//            else{
//                if (AnyoFecha == AnyoHoy && MesFecha < MesHoy){
//                    alert ("La fecha introducida es anterior a Hoy");	
//                    return false;		
//                }
//                else{
//                    if (AnyoFecha == AnyoHoy && MesFecha == MesHoy && DiaFecha < DiaHoy){
//                        alert ("La fecha introducida es anterior a Hoy");
//                        return false;
//                    }
//                    else{
//                        if (AnyoFecha == AnyoHoy && MesFecha == MesHoy && DiaFecha == DiaHoy){
//                             alert ("Has introducido la fecha de Hoy");
//                             return false;
//                        }
//                        else{
//                            alert ("La fecha introducida es posterior a Hoy");
//                            return false;
//                        }
//                    }
//                }
//                alert("Prrrrrrrrrrrrrrrrrrrrrrrrrr");
//                return false;
//            }
            
            alert("Favorasdfsadfe fdgdsf");
        }
        
        
        
        function vali_folio(){
           var foliolista= document.getElementById('folio_com').value;
             
             if(!(/^\d{7}$/.test(foliolista))){
             alert("Favor de ingresar el folio con los 7 números");
             return false;
         } 
        }
