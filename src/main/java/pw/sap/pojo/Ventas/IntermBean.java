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
public class IntermBean {
    
    private String idInterm;
    private String idEmpresa;
    private String intermNom;
    private String intermApellidos;
    private String intermTel;
    private String intermMail;

    public IntermBean(String idInterm, String idEmpresa, String intermNom, String intermApellidos, String intermTel, String intermMail) {
        this.idInterm = idInterm;
        this.idEmpresa = idEmpresa;
        this.intermNom = intermNom;
        this.intermApellidos = intermApellidos;
        this.intermTel = intermTel;
        this.intermMail = intermMail;
    }
    
        public IntermBean(String idEmpresa, String intermNom, String intermApellidos, String intermTel, String intermMail) {
        this.idEmpresa = idEmpresa;
        this.intermNom = intermNom;
        this.intermApellidos = intermApellidos;
        this.intermTel = intermTel;
        this.intermMail = intermMail;
        
    }
    
        public IntermBean(String intermNom, String intermApellidos, String intermTel, String intermMail) {
        this.intermNom = intermNom;
        this.intermApellidos = intermApellidos;
        this.intermTel = intermTel;
        this.intermMail = intermMail;
    }

    public IntermBean() {
        
        
    }

    /**
     * @return the idInterm
     */
    public String getIdInterm() {
        return idInterm;
    }

    /**
     * @param idInterm the idInterm to set
     */
    public void setIdInterm(String idInterm) {
        this.idInterm = idInterm;
    }

    /**
     * @return the idEmpresa
     */
    public String getIdEmpresa() {
        return idEmpresa;
    }

    /**
     * @param idEmpresa the idEmpresa to set
     */
    public void setIdEmpresa(String idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    /**
     * @return the intermNom
     */
    public String getIntermNom() {
        return intermNom;
    }

    /**
     * @param intermNom the intermNom to set
     */
    public void setIntermNom(String intermNom) {
        this.intermNom = intermNom;
    }

    /**
     * @return the intermApellidos
     */
    public String getIntermApellidos() {
        return intermApellidos;
    }

    /**
     * @param intermApellidos the intermApellidos to set
     */
    public void setIntermApellidos(String intermApellidos) {
        this.intermApellidos = intermApellidos;
    }

    /**
     * @return the intermTel
     */
    public String getIntermTel() {
        return intermTel;
    }

    /**
     * @param intermTel the intermTel to set
     */
    public void setIntermTel(String intermTel) {
        this.intermTel = intermTel;
    }

    /**
     * @return the intermMail
     */
    public String getIntermMail() {
        return intermMail;
    }

    /**
     * @param intermMail the intermMail to set
     */
    public void setIntermMail(String intermMail) {
        this.intermMail = intermMail;
    }
    
}
