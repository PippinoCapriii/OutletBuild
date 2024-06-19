package it.unisa.model;

public class ItemCarrello {

    private ProdottoBean prodotto;
    private int quantitąCarrello;

    public ItemCarrello(ProdottoBean prodotto) {
        this.prodotto = prodotto;
        this.quantitąCarrello = 1;
    }

    public ProdottoBean getProdotto() {
        return prodotto;
    }

    public void setProdotto(ProdottoBean prodotto) {
        this.prodotto = prodotto;
    }

    public int getQuantitąCarrello() {
        return quantitąCarrello;
    }

    public void setQuantitąCarrello(int quantitą) {
        this.quantitąCarrello = quantitą;
    }

    public int getId() {
        return prodotto.getIdProdotto();
    }

    public double getTotalPrice() {
        return quantitąCarrello * prodotto.getPrezzo();
    }

    public String getDescription() {
        return prodotto.getDescrizione();
    }

    public void incrementa() {
        if (quantitąCarrello < prodotto.getQuantitą()) {
            quantitąCarrello++;
        }
    }

    public void decrementa() {
        if (quantitąCarrello > 1) {
            quantitąCarrello--;
        }
    }
}
