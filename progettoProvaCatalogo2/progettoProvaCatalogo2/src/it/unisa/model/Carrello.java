package it.unisa.model;

import java.util.ArrayList;
import java.util.Iterator;

public class Carrello {
    private ArrayList<ItemCarrello> prodotti;

    public Carrello() {
        prodotti = new ArrayList<>();
    }

    public void addProdotto(ProdottoBean prodotto) {
        for (ItemCarrello item : prodotti) {
            if (item.getId() == prodotto.getIdProdotto()) {
                item.incrementa();
                return;
            }
        }
        
        // If the product is not found, create a new ItemCarrello and add it to the cart
        ItemCarrello item = new ItemCarrello(prodotto);
        prodotti.add(item);
    }

    public void deleteProdotto(ProdottoBean prodotto) {
        Iterator<ItemCarrello> iterator = prodotti.iterator();
        while (iterator.hasNext()) {
            ItemCarrello prod = iterator.next();
            if (prod.getId() == prodotto.getIdProdotto()) {
                iterator.remove();
                break;
            }
        }
    }

    public ItemCarrello getItem(int id) {
        for (ItemCarrello item : prodotti) {
            if (item.getId() == id) {
                return item;
            }
        }
        return null; // Return null if the item with given id is not found
    }

    public double calcolaCosto() {
        double tot = 0;
        for (ItemCarrello prod : prodotti) {
            tot += prod.getTotalPrice();
        }
        return tot;
    }

    public boolean isEmpty() {
        return prodotti.isEmpty();
    }

    public void svuota() {
        prodotti.clear(); // Clear the list of products
    }

    public int size() {
        return prodotti.size();
    }

    public ItemCarrello get(int index) {
        return prodotti.get(index);
    }

    public ArrayList<ItemCarrello> getProdotti() {
        return prodotti;
    }
}
