package com.packt.webstore.domain.repository.mapper;

import com.packt.webstore.domain.Cart;
import com.packt.webstore.domain.CartItem;
import com.packt.webstore.service.ProductService;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class CartMapper implements RowMapper<Cart> {

    private CartItemMapper cartItemMapper;
    private NamedParameterJdbcTemplate jdbcTemplate;


    public CartMapper(NamedParameterJdbcTemplate jdbcTemplate, ProductService productService) {
        this.jdbcTemplate = jdbcTemplate;
        cartItemMapper = new CartItemMapper(productService);
    }

    @Override
    public Cart mapRow(ResultSet rs, int i) throws SQLException {
        String id = rs.getString("ID");
        Cart cart = new Cart(id);
        String SQL = String.format("SELECT * FROM CART_ITEM WHERE CART_ID = '%s'", id);
        List<CartItem> cartItems = jdbcTemplate.query(SQL, cartItemMapper);
        cart.setCartItems(cartItems);

        return cart;
    }
}
