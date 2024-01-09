package com.core.tjoeun.util;

public class CartItem {
	private String cate;
	private String tableCate;
	private String name;
	private String contentPath;
    private int price;
    
    public CartItem() {
    }

    public CartItem(String cate, String tableCate, String name,
    				String contentPath, int price) {
        this.cate = cate;
        this.tableCate = tableCate;
        this.name = name;
        this.contentPath = contentPath;
        this.price = price;
    }
    

    public String getCate() {
    	return cate;
    }
    
    public void setCate(String cate) {
    	this.cate = cate;
    }
    
    public String getTableCate() {
		return tableCate;
	}

	public void setTableCate(String tableCate) {
		this.tableCate = tableCate;
	}

	public String getContentPath() {
		return contentPath;
	}

	public void setContentPath(String contentPath) {
		this.contentPath = contentPath;
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