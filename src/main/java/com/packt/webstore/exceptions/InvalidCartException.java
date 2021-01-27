package com.packt.webstore.exceptions;

public class InvalidCartException extends RuntimeException{

    private static final long serialVersionUID = 8660130074763965251L;
    private String cartId;

    public InvalidCartException(String cartId) {
        this.cartId = cartId;
    }
    public String getCartId() {
        return cartId;
    }
}
