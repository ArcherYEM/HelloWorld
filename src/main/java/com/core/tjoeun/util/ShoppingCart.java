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
        System.out.println("★★★★" + item.getName());
        System.out.println(cartItems);
    }
    
    public void clearCart() {
        this.cartItems.clear();
    }
	
    public int getTotalDotoriCount() {
    	System.out.println("★★★★★★" + cartItems);
        if (cartItems == null) {
            System.out.println("cartItems is null");
            return 0;
        }

        int totalDotoriCount = 0;
        for (CartItem item : cartItems) {
            totalDotoriCount += item.getPrice();
        }
        return totalDotoriCount;
    }
}
