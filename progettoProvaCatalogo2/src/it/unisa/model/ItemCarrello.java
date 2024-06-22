package it.unisa.model;

public class ItemCarrello {

    private ProdottoBean prodotto;
    private int quantit‡Carrello;

    public ItemCarrello(ProdottoBean prodotto) {
        this.prodotto = prodotto;
        this.quantit‡Carrello = 1;
    }

    public ProdottoBean getProdotto() {
        return prodotto;
    }

    public void setProdotto(ProdottoBean prodotto) {
        this.prodotto = prodotto;
    }

    public int getQuantit‡Carrello() {
        return quantit‡Carrello;
    }

    public void setQuantit‡Carrello(int quantit‡) {
        this.quantit‡Carrello = quantit‡;
    }

    public int getId() {
        return prodotto.getIdProdotto();
    }

    public double getTotalPrice() {
        return quantit‡Carrello * prodotto.getPrezzo();
    }

    public String getDescription() {
        return prodotto.getDescrizione();
    }

    public void incrementa() {
        if (quantit‡Carrello < prodotto.getQuantit‡()) {
            quantit‡Carrello++;
        }
    }

    public void decrementa() {
        if (quantit‡Carrello > 1) {
            quantit‡Carrello--;
        }
    }
}
