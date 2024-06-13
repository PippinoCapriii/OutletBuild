package it.unisa.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import it.unisa.model.ProductBean;

public class Cart {
    private List<ProductBean> products;

    public Cart() {
        products = new ArrayList<>();
    }

    public void addProduct(ProductBean product) {
        products.add(product);
    }

    public void removeProduct(HttpServletRequest request, String productId) {
        Iterator<ProductBean> iterator = products.iterator();
        while (iterator.hasNext()) {
            ProductBean product = iterator.next();
            if (Integer.toString(product.getCode()).equals(productId)) {
                iterator.remove();
                updateSessionCart(request);
                break;
            }
        }
    }

    private void updateSessionCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.setAttribute("cart", this);
    }

    public List<ProductBean> getProducts() {
        return products;
    }

    public void setProducts(List<ProductBean> products) {
        this.products = products;
    }
}
