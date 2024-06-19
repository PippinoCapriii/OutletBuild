package it.unisa.model;

import java.io.Serializable;

public class MetodoPagamentoBean implements Serializable {

private static final long serialVersionUID = 1L;

	public MetodoPagamentoBean() {
	
	}
	
	public String getNumero() {
		return numeroCarta;
	}
	
	public void setNumero(String numero) {
		this.numeroCarta = numero;
	}
	
	public String getTitolare() {
		return titolare;
	}
	
	public void setTitolare(String titolare) {
		this.titolare = titolare;
	}
	
	public String getScadenza() {
		return scadenza;
	}
	
	public void setScadenza(String scadenza) {
		this.scadenza = scadenza;
	}
	
	public String getCVV() {
		return CVV;
	}
	
	public void setCVV(String CVV) {
		this.CVV = CVV;
	}
	
	private String numeroCarta;
	private String titolare;
	private String scadenza;
	private String CVV;
}