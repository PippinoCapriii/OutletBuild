package it.unisa.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
  private List<ProductBean> products = new ArrayList<>();
  
  public void addProduct(ProductBean product) {
    this.products.add(product);
  }
  
  public void deleteProduct(ProductBean product) {
    for (ProductBean prod : this.products) {
      if (prod.getCode() == product.getCode()) {
        this.products.remove(prod);
        break;
      } 
    } 
  }
  
  public List<ProductBean> getProducts() {
    return this.products;
  }
}
