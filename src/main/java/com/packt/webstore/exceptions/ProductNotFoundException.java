package com.packt.webstore.exceptions;

public class ProductNotFoundException extends RuntimeException{

    private static final long serialVersionUID = 515866834580656061L;
    private final String productId;

    public ProductNotFoundException(String productId) {
        this.productId = productId;
    }

    public String getProductId() {
        return productId;
    }
}
