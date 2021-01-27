package com.packt.webstore.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.function.Function;

public class Cart implements Serializable {

    private String id;
    private List<CartItem> cartItems;
    private BigDecimal grandTotal;

    public Cart(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public void setGrandTotal(BigDecimal grandTotal) {
        this.grandTotal = grandTotal;
    }

    public CartItem getItemByProductId(String productId){
        return cartItems.stream().filter(cartItem ->
                cartItem.getProduct().getProductId().equals(productId))
                .findAny()
                .orElse(null);
    }

    public BigDecimal getGrandTotal() {
        updateGrandTotal();
        return grandTotal;
    }

    public void updateGrandTotal() {
        Function<CartItem,BigDecimal> totalMapper = cartItem -> cartItem.getTotalPrice();
        BigDecimal grandTotal = cartItems.stream()
                .map(totalMapper)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        this.setGrandTotal(grandTotal);
    }
}
