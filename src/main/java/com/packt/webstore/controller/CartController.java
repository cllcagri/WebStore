package com.packt.webstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/cart")
public class CartController {

    @GetMapping("/info")
    public String getCartInfo(HttpServletRequest request) {
        return "redirect:/cart/" + request.getSession(true).getId();
    }

    @GetMapping(value = "/{cartId}")
    public String getCart(@PathVariable(value ="cartId") String cartId, Model model) {
        model.addAttribute("cartId",cartId);
        return "cart";
    }
}
