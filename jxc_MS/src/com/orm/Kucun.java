package com.orm;

import java.io.Serializable;

/**
 * 库存类
 * @author ljl
 *
 */
public class Kucun implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int kucun_id;
	private String goods_id;//商品id
	private int kucun;//库存量
	private String goods_name;//商品名称
	private int ruku_price;//入库平均价格
	private int chuku_price;//出库平均价格
	private int cangku_id;//仓库编号
	private String cangku_name;
	private String del;
	
	public Kucun() {}
	
	public Kucun(int kucun_id,String goods_id,int kucun,int ruku_price,int chuku_price,int cangku_id) {
		this.setKucun_id(kucun_id);
		this.setGoods_id(goods_id);
		this.setKucun(kucun);
		this.setRuku_price(ruku_price);
		this.setChuku_price(ruku_price);
		this.setCangku_id(cangku_id);
	}
	public Kucun(String goods_id,int kucun,int ruku_price,int chuku_price,int cangku_id,String del) {
		this.setGoods_id(goods_id);
		this.setKucun(kucun);
		this.setRuku_price(ruku_price);
		this.setChuku_price(ruku_price);
		this.setCangku_id(cangku_id);
		this.setDel(del);
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public int getKucun() {
		return kucun;
	}

	public void setKucun(int kucun) {
		this.kucun = kucun;
	}

	public int getRuku_price() {
		return ruku_price;
	}

	public void setRuku_price(int ruku_price) {
		this.ruku_price = ruku_price;
	}

	public int getChuku_price() {
		return chuku_price;
	}

	public void setChuku_price(int chuku_price) {
		this.chuku_price = chuku_price;
	}

	public int getCangku_id() {
		return cangku_id;
	}

	public void setCangku_id(int cangku_id) {
		this.cangku_id = cangku_id;
	}

	public int getKucun_id() {
		return kucun_id;
	}

	public void setKucun_id(int kucun_id) {
		this.kucun_id = kucun_id;
	}
	
	public void setCangku_name(String cangku_name) {
		this.cangku_name = cangku_name;
	}
	public String getCangku_name() {
		return cangku_name;
	}

	@Override
	public String toString() {
		return "Kucun [kucun_id=" + kucun_id + ", goods_id=" + goods_id + ", kucun=" + kucun + ", goods_name="
				+ goods_name + ", ruku_price=" + ruku_price + ", chuku_price=" + chuku_price + ", cangku_id="
				+ cangku_id + ", cangku_name=" + cangku_name + "]";
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}
	

}
