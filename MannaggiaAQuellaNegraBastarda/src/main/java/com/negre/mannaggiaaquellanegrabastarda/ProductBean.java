package com.negre.mannaggiaaquellanegrabastarda;

import java.io.Serializable;

public class ProductBean implements Serializable {
    private static final long serialVersionUID = 1L;

    int code = -1;

    String name = "";

    String description = "";

    int price;

    int quantity = 0;

    String marca = "";

    String img = "";

    public int getCode() {
        return this.code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return this.quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getMarca() {
        return this.marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getImg() {
        return this.img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String toString() {
        return this.name + " (" + this.name + "), " + this.code + " " + this.price + ". " + this.quantity + ", " + this.description + "." + this.marca;
    }
}
