/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pw.sap.pojo.Ventas;

/**
 *
 * @author ricardozaldivar
 */
public class ClienteBean {
    
        private String idClienteEmp;
        private String nombreEmpresa;
        private String rfcEmpresa;
        private String estadoDomEmpresa;
        private String muniDomEmpresa;
        private String callenumDomEmpresa;
        private String postalDomEmpresa;
        
    public ClienteBean(String nombreEmpresa, String rfcEmpresa, String estadoDomEmpresa, String muniDomEmpresa, String callenumDomEmpresa, String postalDomEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
        this.rfcEmpresa = rfcEmpresa;
        this.estadoDomEmpresa = estadoDomEmpresa;
        this.muniDomEmpresa = muniDomEmpresa;
        this.callenumDomEmpresa = callenumDomEmpresa;
        this.postalDomEmpresa = postalDomEmpresa;
    }
    
    public ClienteBean(String idClienteEmp, String nombreEmpresa, String rfcEmpresa, String estadoDomEmpresa, String muniDomEmpresa, String callenumDomEmpresa, String postalDomEmpresa) {
        this.idClienteEmp = idClienteEmp;
        this.nombreEmpresa = nombreEmpresa;
        this.rfcEmpresa = rfcEmpresa;
        this.estadoDomEmpresa = estadoDomEmpresa;
        this.muniDomEmpresa = muniDomEmpresa;
        this.callenumDomEmpresa = callenumDomEmpresa;
        this.postalDomEmpresa = postalDomEmpresa;
    }

    /**
     * @return the nombreEmpresa
     */
    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    /**
     * @param nombreEmpresa the nombreEmpresa to set
     */
    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    /**
     * @return the rfcEmpresa
     */
    public String getRfcEmpresa() {
        return rfcEmpresa;
    }

    /**
     * @param rfcEmpresa the rfcEmpresa to set
     */
    public void setRfcEmpresa(String rfcEmpresa) {
        this.rfcEmpresa = rfcEmpresa;
    }

    /**
     * @return the estadoDomEmpresa
     */
    public String getEstadoDomEmpresa() {
        return estadoDomEmpresa;
    }

    /**
     * @param estadoDomEmpresa the estadoDomEmpresa to set
     */
    public void setEstadoDomEmpresa(String estadoDomEmpresa) {
        this.estadoDomEmpresa = estadoDomEmpresa;
    }

    /**
     * @return the muniDomEmpresa
     */
    public String getMuniDomEmpresa() {
        return muniDomEmpresa;
    }

    /**
     * @param muniDomEmpresa the muniDomEmpresa to set
     */
    public void setMuniDomEmpresa(String muniDomEmpresa) {
        this.muniDomEmpresa = muniDomEmpresa;
    }

    /**
     * @return the callenumDomEmpresa
     */
    public String getCallenumDomEmpresa() {
        return callenumDomEmpresa;
    }

    /**
     * @param callenumDomEmpresa the callenumDomEmpresa to set
     */
    public void setCallenumDomEmpresa(String callenumDomEmpresa) {
        this.callenumDomEmpresa = callenumDomEmpresa;
    }

    /**
     * @return the postalDomEmpresa
     */
    public String getPostalDomEmpresa() {
        return postalDomEmpresa;
    }

    /**
     * @param postalDomEmpresa the postalDomEmpresa to set
     */
    public void setPostalDomEmpresa(String postalDomEmpresa) {
        this.postalDomEmpresa = postalDomEmpresa;
    }

    /**
     * @return the idClienteEmp
     */
    public String getIdClienteEmp() {
        return idClienteEmp;
    }

    /**
     * @param idClienteEmp the idClienteEmp to set
     */
    public void setIdClienteEmp(String idClienteEmp) {
        this.idClienteEmp = idClienteEmp;
    }
          
}
