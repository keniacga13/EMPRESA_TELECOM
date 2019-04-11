
package pw.sap.pojo.Compras;

/**
 *
 * @author Mauricio
 */
public class Proveedores
{
    private String prov_rfc;
    private String prov_nom_emp;
    private String prov_nom_cont;
    private String prov_correo;
    private String prov_tel;
    private String prov_estado;
    private String prov_muni;
    private String prov_cp;

    public Proveedores() {
    }

    public Proveedores(String prov_rfc, String prov_nom_emp, String prov_nom_cont, String prov_correo, String prov_tel, String prov_estado, String prov_muni, String prov_cp) {
        this.prov_rfc = prov_rfc;
        this.prov_nom_emp = prov_nom_emp;
        this.prov_nom_cont = prov_nom_cont;
        this.prov_correo = prov_correo;
        this.prov_tel = prov_tel;
        this.prov_estado = prov_estado;
        this.prov_muni = prov_muni;
        this.prov_cp = prov_cp;
    }

    public String getProv_rfc() {
        return prov_rfc;
    }

    public void setProv_rfc(String prov_rfc) {
        this.prov_rfc = prov_rfc;
    }

    public String getProv_nom_emp() {
        return prov_nom_emp;
    }

    public void setProv_nom_emp(String prov_nom_emp) {
        this.prov_nom_emp = prov_nom_emp;
    }

    public String getProv_nom_cont() {
        return prov_nom_cont;
    }

    public void setProv_nom_cont(String prov_nom_cont) {
        this.prov_nom_cont = prov_nom_cont;
    }

    public String getProv_correo() {
        return prov_correo;
    }

    public void setProv_correo(String prov_correo) {
        this.prov_correo = prov_correo;
    }

    public String getProv_tel() {
        return prov_tel;
    }

    public void setProv_tel(String prov_tel) {
        this.prov_tel = prov_tel;
    }

    public String getProv_estado() {
        return prov_estado;
    }

    public void setProv_estado(String prov_estado) {
        this.prov_estado = prov_estado;
    }

    public String getProv_muni() {
        return prov_muni;
    }

    public void setProv_muni(String prov_muni) {
        this.prov_muni = prov_muni;
    }

    public String getProv_cp() {
        return prov_cp;
    }

    public void setProv_cp(String prov_cp) {
        this.prov_cp = prov_cp;
    }

    @Override
    public String toString() {
        return prov_rfc; //To change body of generated methods, choose Tools | Templates.
    }

    
}
