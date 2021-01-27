package com.packt.webstore.controller;

import com.packt.webstore.domain.Cart;
import com.packt.webstore.dto.CartDto;
import com.packt.webstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping(value = "rest/cart")
public class CartRestController {

    @Autowired
    private CartService cartService;

    @PostMapping(value = "/create")
    @ResponseStatus(value = HttpStatus.CREATED)
    public void create(@RequestBody CartDto cartDto) {
        cartService.create(cartDto);
    }

    @GetMapping(value = "/{cartId}")
    public Cart read(@PathVariable(value = "cartId") String cartId) {
        return cartService.read(cartId);
    }

    @PutMapping("/{cartId}")
    public void update(@PathVariable("cartId") String cartId, @RequestBody CartDto cartDto){
        cartDto.setId(cartId);
        cartService.update(cartId, cartDto);
    }

    @DeleteMapping(value = "/{cartId}")
    @ResponseStatus(value = HttpStatus.OK)
    public void delete(@PathVariable(value = "cartId") String cartId) {
        cartService.delete(cartId);
    }

    @PutMapping(value ="/add/{productId}")
    @ResponseStatus(value = HttpStatus.OK)
    public void addItem(@PathVariable String productId, HttpSession session) {
        cartService.addItem(session.getId(),productId);
    }

    @PutMapping(value = "/remove/{productId}")
    @ResponseStatus(value = HttpStatus.OK)
    public void removeItem(@PathVariable String productId, HttpSession session) {
        cartService.removeItem(session.getId(),productId);
    }
}
