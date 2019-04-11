package pw.sap.pojo.log;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Josafat Rosas Ortiz
 */
public class Log {
    
    public String filtrosQuery(String fecha, String horaInferior, String horaSuperior){
        String referencia = "id_emp is not null";
        if(fecha!=null && !fecha.equals("")){referencia = referencia+" AND fecha = '"+fecha+"'";}
        if(horaInferior!=null && !horaInferior.equals("")){referencia=referencia+" AND '"+horaInferior+"'<=hora";}
        if(horaSuperior!=null && !horaSuperior.equals("")){referencia=referencia+" AND '"+horaSuperior+"'<=hora";}
        return referencia;
    }
    
    public boolean directorio(String path){
        File ruta = new File(path);
        if(ruta.isDirectory()){
            return true;
        }else{
            return false;
        }
    }
    
    public String fechaArchivo(){
        SimpleDateFormat formatoNombre = new SimpleDateFormat("yyyy_MM_dd_HHmm");
        Date fecha = new Date();
        String nombre = formatoNombre.format(fecha);
        return nombre;
    }
}
