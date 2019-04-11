function searchKeyPress(e)
{
        if (e.keyCode == 13)
        {
            var codprod = $('#codprod').val();
            var Max_codigo = 13;
            var lengthcodigo = document.getElementById("codprod").value.length;
            
            if(codprod == "" || codprod == null || codprod.length == 0 || /^\s+$/.test(codprod)){
       
            alert("ingrese un codigo");
            return false;
        
            } else if (lengthcodigo != Max_codigo) {

                alert("el numero de caracteres para el codigo del producto debe ser de 13");
                return false;

            }else{
                $.ajax({
                    type:'POST',
                    url: '../AgregaProducto',
                    datatype: 'json',
                    data: {codprod:codprod},
                    success: function (result) {
                        var producto = $.parseJSON(result);
                        $('#nomprod').val(producto.nombre);
                        $('#precioprod').val(producto.precio);
                        $('#ivaprod').val(producto.iva);
                    }
                });
            } 
        }
}

function cantOnPress(e)
{
        var cant=$('#cant').val();
        var precioprod=$('#precioprod').val();
        var ivaprod=$('#ivaprod').val();
        
        if (e.keyCode == 13)
        {
            if( !(/^\d{1,4}$/.test(cant)) ) {
        
                alert("ingrese una cantidad menor a 1000");
                return false;
            }else{
                $.ajax({
                    type:'POST',
                    url: '../cantidadProd',
                    data: {cant:cant,precioprod:precioprod,ivaprod:ivaprod},
                    success: function (result) {
                        $('#subtotal').val(result);
                    }
                });
            }  
        }
}

function abono_cargoAparta(e)
{
        var anticipoVar=$('#anticipo').val();
        var totalVar=$('#totalOV').val();
        
        if (e.keyCode == 13)
        {
            
            if( !/^([0-9])*$/.test(anticipoVar)||anticipoVar==null||anticipoVar==0)  {
   
                 alert("Ingrese cantidad de anticipo.");
   
                 return false;
             }else{
                $.ajax({
                    type:'POST',
                    url: '../anticipoAparta',
                    data: {abono_apart:anticipoVar,total_OV:totalVar},
                    success: function (result) {
                        $('#restante').val(result);
                    }
                });
            } 
        }
}

