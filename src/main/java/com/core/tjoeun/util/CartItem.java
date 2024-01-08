package com.core.tjoeun.util;

public class CartItem {
	private String cate;
	private String tableCate;
	private String contentPath;
    private String name;
    private int price; // 또는 필요에 따라 다른 데이터 타입 사용

    private int dotoriCount;
    public CartItem() {
    	this.dotoriCount = 0;
    }

    public CartItem(String cate, String tableCate, String name,
    				String contentPath, int price) {
        this.cate = cate;
        this.tableCate = tableCate;
        this.name = name;
        this.contentPath = contentPath;
        this.price = price;
    }
    
    public CartItem(String cate, String tableCate, String name,
    		String contentPath, int price, int dotoriCount) {
    	this.cate = cate;
    	this.tableCate = tableCate;
    	this.name = name;
    	this.contentPath = contentPath;
    	this.price = price;
    	this.setDotoriCount(dotoriCount);
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

	public int getDotoriCount() {
		return dotoriCount;
	}

	public void setDotoriCount(int dotoriCount) {
		this.dotoriCount = dotoriCount;
	}

	
}