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
    
    public void clearCart() {
        this.cartItems.clear();
    }
	
    public int getTotalDotoriCount() {
    	
        if (cartItems == null) {
            
            return 0;
        }

        int totalDotoriCount = 0;
        for (CartItem item : cartItems) {
            totalDotoriCount += item.getPrice();
        }
        return totalDotoriCount;
    }
}
