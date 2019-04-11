package pw.sap.pojo.sesion;

public class ValidarSesion {
    
    public String redireccionar(String area){
        String path = area;
        switch(path){
            case "Recursos Humanos":
                path = "RH/RH/rh_index.jsp";
                break;
            case "Contabilidad":
                path = "Contabilidad/ct_index.jsp";
                break;
            case "Inventarios":
                path = "Inventarios/Inventario/principal.jsp";
                break;
            case "Compras":
                path = "Compras/html/com_index.jsp";
                break;
            case "Ventas":
                path = "Ventas/mainVentas.jsp";
                break;
            case "Gerencia":
                path = "Gerencia/IG/ig_inicio.jsp";
                break;
            default:
                path = "../index.jsp";
                break;
        }
        return path;
    }
}
