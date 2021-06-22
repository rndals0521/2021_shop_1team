package com.ict.db;

public class CVO {

	private String idx,p_num,p_name,id;
	private int p_price,p_saleprice,p_su;

	private int total;
	
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}
	public int getP_su() {
		return p_su;
	}
	public void setP_su(int p_su) {
		this.p_su = p_su;
	}
	
	public int getTotal() {
		
		return 0;
	}
}
