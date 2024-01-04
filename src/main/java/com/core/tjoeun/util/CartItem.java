package com.core.tjoeun.util;

public class CartItem {
    private String name;
    private int price; // 또는 필요에 따라 다른 데이터 타입 사용

    public CartItem() {
    }

    public CartItem(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}