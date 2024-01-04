package com.core.tjoeun.util;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {

	private List<CartItem> cartItems;

    public ShoppingCart() {
        this.cartItems = new ArrayList<>();
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void addToCart(CartItem item) {
        cartItems.add(item);
    }
	
}
