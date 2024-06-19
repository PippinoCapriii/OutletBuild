
package it.unisa.model;

import java.io.Serializable;

public class ProdottoBean implements Serializable {

private static final long serialVersionUID = 1L;

	public ProdottoBean() {
		
	}

	public int getIdProdotto() {
		return idProdotto;
	}

	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	

	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	public int getQuantità() {
		return quantità;
	}
	
	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}
	
	public String getIva() {
		return iva;
	}
	
	public void setIva(String iva) {
		this.iva = iva;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getDataUscita() {
		return dataUscita;
	}
	
	public void setDataUscita(String dataUscita) {
		this.dataUscita = dataUscita;
	}

	public String getImmagine() {
		return immagine;
	}
	
	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}
	
	public String getMarca() {
		return marca;
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public String getDescrizioneDettagliata() {
		return descrizioneDettagliata;
	}
	
	public void setDescrizioneDettagliata(String descrizioneDettagliata) {
		this.descrizioneDettagliata = descrizioneDettagliata;
	}
	
	
	@Override
	public String toString() {
		return nome +", " + idProdotto +", " + prezzo +", " + descrizione +", " + marca +", " + quantità +", "+ immagine+", " + dataUscita + ", " +iva;
	}

	private int idProdotto;
	private String marca;
	private String nome;
	private String descrizione;
	private int quantità;
	private String dataUscita;
	private String iva;
	private double prezzo;
	private String immagine;
	private String descrizioneDettagliata;
}
